import '../models/user_model.dart';

abstract class SocialAuthDataSource {
  Future<UserModel> signInWithGoogle();

  Future<UserModel> signInWithApple();

  Future<UserModel> signInWithGitHub();
}
