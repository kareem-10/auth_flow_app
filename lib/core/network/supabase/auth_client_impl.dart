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

  @override
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await client.signInWithPassword(email: email, password: password);
  }
}
