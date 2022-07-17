import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/routes.dart';
import '../../../../config/styles.dart';
import '../../../../core/app/value.dart';
import '../../../../core/bloc/status.dart';
import '../../../../core/error/w_error_refresh_button.dart';
import '../../../note/presentation/bloc/note_bloc.dart';
import '../../../note/presentation/widget/w_note_submit_button.dart';
import '../bloc/auth_bloc.dart';
import '../widget/w_auth_components.dart';
import '../widget/w_auth_text_form_field.dart';
import '../widget/w_password_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.blackColor,
        elevation: 0.h,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == BlocStatus.loaded) {
            AppValue.isLogin = true;
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
        child: authBackgroundContainer(
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // To Do App
                  SizedBox(height: 140.h),
                  Text(
                    "sign up",
                    style: AppStyles.headline6TextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24.h),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        AuthTextFormField(
                          label: "Name",
                          controller: nameController,
                          prefixIcon:
                              Image.asset("assets/icons/personal_icon.png"),
                        ),
                        SizedBox(height: 24.h),
                        AuthTextFormField(
                          label: "Email",
                          controller: emailController,
                          prefixIcon: Image.asset("assets/icons/mail_icon.png"),
                        ),
                        SizedBox(height: 24.h),
                        PasswordTextFormField(controller: passwordController),
                        SizedBox(height: 24.h),
                        PasswordTextFormField(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state.status == BlocStatus.initial) {
                          return NoteActionButton(
                            title: "Sign Up",
                            submit: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignUp(
                                  nameController.text,
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
                          return ErrorRefreshButton(
                            message: "Loaded",
                            callback: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignUp(
                                  nameController.text,
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
                              SignUp(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
