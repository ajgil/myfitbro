import 'package:myfitbro/features/auth/auth_provider.dart';
import 'package:myfitbro/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_with_google_controller.g.dart';

@riverpod
class SignInWithGoogleController extends _$SignInWithGoogleController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> singIn({required String email, required String password}) async {
    await ref
        .read(authRepositoryProvider)
        .signIn(email: email, password: password);
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    final res = await ref
        .read(authRepositoryProvider)
        .signUp(email: email, password: password, username: username);
    res.fold((l) {
      state = AsyncError(l, StackTrace.current);
    }, (r) {
      state = AsyncData(r);
    });
  }

  Future<void> verifyOtp({
    required String email,
    required String token,
  }) async {
    await ref
        .read(authRepositoryProvider)
        .verifyOtp(email: email, token: token);
  }

  /// Signs in using Supabase auth
  Future<void> signInWithGoogle() async {
    final res = await ref.read(authRepositoryProvider).signInWithGoogle();
    res.fold((l) {
      state = AsyncError(l, StackTrace.current);
    }, (r) {
      state = AsyncData(r);
    });
  }
}
