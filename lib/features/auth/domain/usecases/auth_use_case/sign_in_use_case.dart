import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase_core.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';

class SignInUseCase implements UseCase<User, SignInParams> {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, User>> call(SignInParams p) async =>
      await _repository.signIn(p.email, p.password);
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
