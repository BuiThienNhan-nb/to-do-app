import '../repositories/auth_repository.dart';
import 'auth_use_case/sign_in_use_case.dart';
import 'auth_use_case/sign_out_use_case.dart';
import 'auth_use_case/sign_up_use_case.dart';

class AuthUseCase {
  final AuthRepository repository;
  late SignInUseCase signInUseCase;
  late SignUpUseCase signUpUseCase;
  late SignOutUseCase signOutUseCase;

  AuthUseCase(this.repository) {
    signInUseCase = SignInUseCase(repository);
    signUpUseCase = SignUpUseCase(repository);
    signOutUseCase = SignOutUseCase(repository);
  }
}
