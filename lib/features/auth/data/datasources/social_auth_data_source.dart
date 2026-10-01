import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/constants/social_auth_config.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/social_credential.dart';

/// Talks to the Google / Apple SDKs. Returns null when the user closes the
/// provider sheet; throws a [ProviderUnavailableFailure] when the provider
/// isn't configured for this build or platform.
abstract class SocialAuthDataSource {
  Future<SocialCredential?> signIn(SocialProvider provider);
}

class SocialAuthDataSourceImpl implements SocialAuthDataSource {
  static const _notConfigured = ProviderUnavailableFailure(
    'Not available yet.',
    ApiErrorCodes.socialNotConfigured,
  );

  @override
  Future<SocialCredential?> signIn(SocialProvider provider) =>
      switch (provider) {
        SocialProvider.google => _googleAuth(),
        SocialProvider.apple => _apple(),
      };

  GoogleSignIn? _googleSignIn;

  GoogleSignIn get _google => _googleSignIn ??= GoogleSignIn(
        serverClientId: SocialAuthConfig.googleServerClientId.isNotEmpty
            ? SocialAuthConfig.googleServerClientId
            : null,
        clientId: Platform.isIOS && SocialAuthConfig.googleIosClientId.isNotEmpty
            ? SocialAuthConfig.googleIosClientId
            : null,
        scopes: const ['email', 'profile'],
      );

  Future<SocialCredential?> _googleAuth() async {
    if (SocialAuthConfig.googleServerClientId.isEmpty) throw _notConfigured;
    try {
      final account = await _google.signIn();
      if (account == null) return null;

      final auth = await account.authentication;
      final idToken = auth.idToken;
      if (idToken == null) throw _notConfigured;

      return SocialCredential(
        provider: SocialProvider.google,
        idToken: idToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<SocialCredential?> _apple() async {
    final web = Platform.isAndroid;
    if (web &&
        (SocialAuthConfig.appleServiceId.isEmpty ||
            SocialAuthConfig.appleRedirectUri.isEmpty)) {
      throw _notConfigured;
    }
    if (!web && !await SignInWithApple.isAvailable()) throw _notConfigured;

    // The raw nonce goes to our backend, its SHA-256 to Apple; the backend
    // checks the token's `nonce` claim so a stolen token can't be replayed.
    final nonce = _randomNonce();
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: const [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: sha256.convert(utf8.encode(nonce)).toString(),
        webAuthenticationOptions: web
            ? WebAuthenticationOptions(
                clientId: SocialAuthConfig.appleServiceId,
                redirectUri: Uri.parse(SocialAuthConfig.appleRedirectUri),
              )
            : null,
      );
      final token = credential.identityToken;
      if (token == null) throw _notConfigured;
      return SocialCredential(
        provider: SocialProvider.apple,
        idToken: token,
        authorizationCode: credential.authorizationCode,
        nonce: nonce,
        givenName: credential.givenName,
        familyName: credential.familyName,
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) return null;
      rethrow;
    }
  }

  static String _randomNonce([int length = 32]) {
    const chars =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
  }
}
