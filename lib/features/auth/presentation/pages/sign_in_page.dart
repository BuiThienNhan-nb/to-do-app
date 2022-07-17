import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/config/routes.dart';
import 'package:to_do_app/core/app/value.dart';
import 'package:to_do_app/features/note/presentation/bloc/note_bloc.dart';

import '../../../../config/colors.dart';
import '../../../../config/styles.dart';
import '../../../../core/bloc/status.dart';
import '../../../../core/error/w_error_refresh_button.dart';
import '../../../note/presentation/widget/w_note_submit_button.dart';
import '../bloc/auth_bloc.dart';
import '../widget/w_auth_components.dart';
import '../widget/w_auth_text_form_field.dart';
import '../widget/w_password_text_form_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: authBackgroundContainer(
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            // if (!AppValue.isLogin) {
            //   state.status = BlocStatus.initial;
            // }
            if (state.status == BlocStatus.loaded) {
              // AppValue.isLogin = true;
              AppValue.currentUser = state.user;
              BlocProvider.of<NoteBloc>(context).add(
                GetNoteByUserID(
                  userId: AppValue.currentUser.id,
                ),
              );
              state.status = BlocStatus.initial;
              Navigator.of(context).pushNamed(AppRoutes.home);
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // To Do App
                  SizedBox(height: 120.h),
                  Text(
                    "endeavor",
                    textAlign: TextAlign.center,
                    style: AppStyles.headline3TextStyle
                        .copyWith(color: AppColors.endeavourColor),
                  ),
                  SizedBox(height: 80.h),
                  Text(
                    "sign in",
                    style: AppStyles.headline6TextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24.h),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        AuthTextFormField(
                          label: "Email",
                          controller: emailController,
                          prefixIcon: Image.asset("assets/icons/mail_icon.png"),
                        ),
                        SizedBox(height: 24.h),
                        PasswordTextFormField(controller: passwordController),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  forgotPasswordButton(),
                  SizedBox(height: 28.h),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state.status == BlocStatus.initial) {
                          return NoteActionButton(
                            title: "Sign In",
                            submit: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignIn(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                            },
                          );
                        }
                        if (state.status == BlocStatus.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state.status == BlocStatus.loaded) {
                          return NoteActionButton(
                            title: "Sign In",
                            submit: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignIn(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                            },
                          );
                        }
                        return ErrorRefreshButton(
                          message: state.errorMessage ?? "Unexpected error!",
                          callback: () {
                            BlocProvider.of<AuthBloc>(context).add(
                              SignIn(
                                emailController.text,
                                passwordController.text,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 32.h),
                  signUpButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
