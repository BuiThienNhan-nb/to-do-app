part of 'auth_bloc.dart';

class AuthState extends Equatable {
  BlocStatus status;
  User user;
  String? errorMessage;

  AuthState._({
    this.status = BlocStatus.initial,
    this.user = const User(
      id: "",
      name: "name",
      email: "email",
      token: "",
    ),
    this.errorMessage,
  });

  AuthState.initial() : this._(status: BlocStatus.initial);

  AuthState.loading() : this._(status: BlocStatus.loading);

  AuthState.loaded(User user) : this._(status: BlocStatus.loaded, user: user);

  AuthState.error(String message)
      : this._(
          status: BlocStatus.error,
          errorMessage: message,
        );

  @override
  List<Object?> get props => [status, user, errorMessage];
}
