import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef _) =>
    AuthRemoteRepository();

class AuthRemoteRepository {
  //final GoTrueClient _client;
  final _client = Supabase.instance.client;

  Stream<AuthState> get authState => _client.auth.onAuthStateChange;

  get currentSession => _client.auth.currentSession;

  Future<AuthResponse> login(
      {required String email, required String password}) async {
    return _client.auth.signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> signUp(
      {required String email, required String password, required String username}) async {
    return _client.auth.signUp(email: email, password: password, data: {'username': username});
  }

  Future<AuthResponse> verifyOTP({
    required String email,
    required String token,
  }) async {
    return _client.auth.verifyOTP(email: email, token: token, type: OtpType.email);
  }


  Future<void> logout() => _client.auth.signOut();
}
