/// OAuth client identifiers for Google / Apple sign-in, passed at build time:
///
/// ```
/// flutter run \
///   --dart-define=GOOGLE_SERVER_CLIENT_ID=<web client id>.apps.googleusercontent.com \
///   --dart-define=GOOGLE_IOS_CLIENT_ID=<ios client id>.apps.googleusercontent.com \
///   --dart-define=APPLE_SERVICE_ID=<services id> \
///   --dart-define=APPLE_REDIRECT_URI=https://<api host>/api/v1/auth/social/apple/callback
/// ```
///
/// The server client id is the one the backend verifies Google ID tokens
/// against. The Apple service id / redirect are only needed on Android, where
/// Sign in with Apple runs as a web flow.
class SocialAuthConfig {
  const SocialAuthConfig._();

  static const googleServerClientId = String.fromEnvironment(
    'GOOGLE_SERVER_CLIENT_ID',
    defaultValue: '911164975994-86ctgv020t0lqg87rsjqrjsiepphim6f.apps.googleusercontent.com',
  );
  static const googleIosClientId = String.fromEnvironment(
    'GOOGLE_IOS_CLIENT_ID',
    defaultValue: '911164975994-9atool2ig6m2loepo65p9a8phcso5g4b.apps.googleusercontent.com',
  );
  static const appleServiceId = String.fromEnvironment('APPLE_SERVICE_ID');
  static const appleRedirectUri = String.fromEnvironment(
    'APPLE_REDIRECT_URI',
    defaultValue: 'https://padel.mutasemjaber.online/api/v1/auth/social/apple/callback',
  );
}
