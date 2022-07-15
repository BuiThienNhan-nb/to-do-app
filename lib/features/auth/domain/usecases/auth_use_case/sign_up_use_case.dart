import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase_core.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<void, SignUpParams> {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, User>> call(SignUpParams p) async =>
      await _repository.signUp(p.name, p.email, p.password);
}

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const SignUpParams(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, email, password];
}
