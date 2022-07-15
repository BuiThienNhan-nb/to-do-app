part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignIn extends AuthEvent {
  final String email;
  final String password;

  const SignIn(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignOut extends AuthEvent {
  const SignOut();

  @override
  List<Object?> get props => [];
}

class SignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const SignUp(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, email, password];
}
