import 'package:equatable/equatable.dart';

enum SocialProvider {
  google,
  apple;

  /// Path segment of `auth/social/{provider}`.
  String get apiValue => name;
}

/// What the Google / Apple SDK hands back; the backend verifies the token
/// with the provider and signs the user in (or creates the account).
class SocialCredential extends Equatable {
  final SocialProvider provider;

  /// Google ID token, or Apple identity token (both JWTs).
  final String idToken;

  /// Apple only: one-time authorization code.
  final String? authorizationCode;

  /// Apple only: the raw nonce whose SHA-256 is embedded in [idToken].
  final String? nonce;

  /// Apple sends the name only on the very first sign-in.
  final String? givenName;
  final String? familyName;

  const SocialCredential({
    required this.provider,
    required this.idToken,
    this.authorizationCode,
    this.nonce,
    this.givenName,
    this.familyName,
  });

  @override
  List<Object?> get props => [provider, idToken, authorizationCode, nonce, givenName, familyName];
}
