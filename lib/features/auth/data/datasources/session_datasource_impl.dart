import '../../../../core/error/exceptions.dart';
import 'auth_client.dart';
import 'session_datasource.dart';
import '../models/user_model.dart';

class SessionDataSourceImpl implements SessionDataSource {
  final AuthClient _authClient;

  SessionDataSourceImpl(this._authClient);

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      // TODO: Implement getCurrentUser
      throw UnimplementedError('getCurrentUser not implemented yet');
    } catch (e) {
      throw ServerException('Failed to get current user: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // TODO: Implement signOut
      throw UnimplementedError('signOut not implemented yet');
    } on AuthException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign out: ${e.toString()}');
    }
  }

  @override
  Stream<UserModel?> get authStateChanges {
    // TODO: Implement authStateChanges
    throw UnimplementedError('authStateChanges not implemented yet');
  }
}
