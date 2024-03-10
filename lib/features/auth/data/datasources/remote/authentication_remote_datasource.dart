
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myfitbro/core/errors/failures/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


abstract class AuthenticationRemoteDatasource {
  // si hay alguna excepcion, el auth repository del domain es quien captura la excepcion
  Future<Either<Failure, bool>> signUp({
    required email,
    required password,
    required username,
  });

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  });

  Future<void> verifyOTP({
    required String email,
    required String token,
  });

  Future<void> signOut();

  Stream<User?> getCurrentUser();

  // En el repositorio datasource remoto siempre devolvemos el modelo
  //Future<List<UserModel>> getUsers();
}

class AuthenticationRemoteDataSrcImpl
    implements AuthenticationRemoteDatasource {
  const AuthenticationRemoteDataSrcImpl(this._client);

  final GoTrueClient _client;

  //static const String _redirectUrl ='io.supabase.flutterexample://signup-callback';

  @override
  Future<Either<Failure, bool>> signUp(
      {required email, required password, required username}) async {
    //check to make sure that it returns the right data -> statusCode: 200
    try {
      _client.signUp(
          password: password, email: email, data: {'username': username});
      return const Right(true);
    } catch (e) {
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response =
          await _client.signInWithPassword(password: password, email: email);
      debugPrint(response.user as String?);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse> verifyOTP(
      {required String email, required String token}) async {
    try {
      final response = await _client.verifyOTP(
          email: email, token: token, type: OtpType.email);
      debugPrint(response.user as String?);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async => await _client.signOut();
  
  @override
  Stream<User?> getCurrentUser() =>
      _client.onAuthStateChange.map((event) => event.session?.user);
}
