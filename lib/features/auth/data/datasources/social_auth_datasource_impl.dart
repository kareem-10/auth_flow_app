import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';
import 'social_auth_datasource.dart';
import '../../../../core/network/supabase/auth_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthException;

class SocialAuthDataSourceImpl implements SocialAuthDataSource {
  final AuthClient _authClient;

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  bool _isInitialized = false;

  SocialAuthDataSourceImpl(this._authClient);

  Future ensureInitialized() async {
    if (_isInitialized) return;
    await _googleSignIn.initialize(
      serverClientId:
          '250934022543-jmiq25k4l065hc6dgtlelva1scab93rl.apps.googleusercontent.com',
    );
    _isInitialized = true;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      await ensureInitialized();
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final idToken = googleUser.authentication.idToken;

      if (idToken == null) {
        throw ServerException('Google authentication failed');
      }

      final authResponse = await _authClient.signInWithIdToken(
        OAuthProvider.google,
        idToken,
      );

      if (authResponse.user == null) {
        throw AuthException('Failed to sign in with Google');
      }

      return UserModel.fromSupabaseUser(authResponse.user!);
    } on AuthException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign in with Google: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> signInWithApple() async {
    try {
      // TODO: Implement signInWithApple
      throw UnimplementedError('signInWithApple not implemented yet');
    } on AuthException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign in with Apple: ${e.toString()}');
    }
  }

  @override
  Future<void> signInWithGitHub() async {
    try {
      final launched = await _authClient.signInWithOAuth(
        OAuthProvider.github,
        'com.elgendy.authflowapp://login-callback',
      );
      if (!launched) {
        throw ServerException('Failed to launch GitHub authentication');
      }
    } on AuthException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign in with GitHub: ${e.toString()}');
    }
  }
}
