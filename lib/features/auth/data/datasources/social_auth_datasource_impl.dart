import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';
import 'social_auth_datasource.dart';
import '../../../../core/network/supabase/auth_client.dart';

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

      return UserModel(
        id: googleUser.id,
        email: googleUser.email,
        isEmailVerified: true,
        createdAt: DateTime.now(),
      );
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
  Future<UserModel> signInWithGitHub() async {
    try {
      // TODO: Implement signInWithGitHub
      throw UnimplementedError('signInWithGitHub not implemented yet');
    } on AuthException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign in with GitHub: ${e.toString()}');
    }
  }
}
