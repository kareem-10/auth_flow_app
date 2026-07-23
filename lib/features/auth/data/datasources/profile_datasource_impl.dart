import '../../../../core/error/exceptions.dart';
import 'auth_client.dart';
import 'profile_datasource.dart';
import '../models/user_model.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  final AuthClient _authClient;

  ProfileDataSourceImpl(this._authClient);

  @override
  Future<UserModel> updateProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    try {
      // TODO: Implement updateProfile
      throw UnimplementedError('updateProfile not implemented yet');
    } on AuthException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to update profile: ${e.toString()}');
    }
  }

  @override
  Future<String> uploadProfilePicture({required String filePath}) async {
    try {
      // TODO: Implement uploadProfilePicture
      throw UnimplementedError('uploadProfilePicture not implemented yet');
    } catch (e) {
      throw ServerException(
        'Failed to upload profile picture: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      // TODO: Implement deleteAccount
      throw UnimplementedError('deleteAccount not implemented yet');
    } on AuthException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to delete account: ${e.toString()}');
    }
  }
}
