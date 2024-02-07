import 'package:myfitbro/features/auth/domain/entities/user_entity.dart';
import 'package:myfitbro/features/common/domain/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

///
abstract class AuthRepositoryInterface {
  // SignUp with credentials
  Future<Either<Failure, bool>> signUp({
    required String email,
    required String password,
    required String username,
  });

  // Verify otp token
  Future<Either<Failure, UserEntity>> verifyOtp(
      {required String email, required String token});

  // SignIn with credentials
  Future<Either<Failure, UserEntity>> signIn(
      {required String email, required String password});

  /// Sign in with Google
  Future<Either<Failure, bool>> signInWithGoogle();

  /// Sign out
  Future<Either<Failure, bool>> signOut();

  /// Listen to auth changes
  void authStateChange(
    void Function(UserEntity? userEntity) callback,
  );

  /// Store token
  Future<void> setSession(String token);

  /// restore session from token
  Future<Either<Failure, UserEntity>> restoreSession();
}
