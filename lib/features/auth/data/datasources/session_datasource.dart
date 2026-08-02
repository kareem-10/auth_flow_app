import '../models/user_model.dart';

abstract class SessionDataSource {
  UserModel? getCurrentUser();

  Future<void> signOut();

  Stream<UserModel?> get authStateChanges;
}
