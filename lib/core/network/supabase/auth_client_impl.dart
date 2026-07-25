import 'package:gotrue/src/types/auth_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_client.dart';

class AuthClientImpl implements AuthClient {
  final GoTrueClient client;

  AuthClientImpl(this.client);
  @override
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    return await client.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );
  }
}
