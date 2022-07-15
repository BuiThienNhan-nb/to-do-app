import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/core/app/value.dart';
import 'package:to_do_app/features/auth/domain/usecases/auth_use_case/sign_in_use_case.dart';
import 'package:to_do_app/features/auth/domain/usecases/auth_use_case/sign_up_use_case.dart';

import '../../../../core/bloc/status.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/auth_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;

  AuthBloc(this.authUseCase) : super(AuthState.initial()) {
    on<SignIn>(_signIn);
    on<SignUp>(_signUp);
    on<SignOut>(_signOut);
  }

  FutureOr<void> _signIn(SignIn event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());

    final signInOrFailure = await authUseCase
        .signInUseCase(SignInParams(event.email, event.password));

    signInOrFailure.fold(
      (failure) => emit(AuthState.error(
          failure is ServerFailure ? failure.message : 'Unexpected Error')),
      (user) {
        emit(AuthState.loaded(user));
        AppValue.currentUser.copyWith(
          id: user.id,
          name: user.name,
          email: user.email,
          token: user.token,
        );
      },
    );
  }

  FutureOr<void> _signUp(SignUp event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());

    final signUpOrFailure = await authUseCase
        .signUpUseCase(SignUpParams(event.name, event.email, event.password));

    signUpOrFailure.fold(
      (failure) => emit(AuthState.error(
          failure is ServerFailure ? failure.message : 'Unexpected Error')),
      (user) {
        emit(AuthState.loaded(user));
        AppValue.currentUser.copyWith(
          id: user.id,
          name: user.name,
          email: user.email,
          token: user.token,
        );
      },
    );
  }

  FutureOr<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());

    AppValue.accessToken = "";
    AppValue.currentUser = const User(
      id: "",
      name: "name",
      email: "email",
      token: "",
    );

    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setString('token', "");
    } on Exception catch (e) {
      emit(AuthState.error(e.toString()));
    }

    emit(AuthState.loaded(AppValue.currentUser));
  }
}
