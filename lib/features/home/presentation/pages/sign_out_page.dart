import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/config/routes.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../note/presentation/widget/w_note_home_background_container.dart';
import '../../../note/presentation/widget/w_note_submit_button.dart';

class SignOutPage extends StatelessWidget {
  const SignOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: noteHomeBackgroundContainer(
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Center(
            child: NoteActionButton(
              title: "Sign Out",
              submit: () {
                BlocProvider.of<AuthBloc>(context).add(const SignOut());
                Navigator.of(context, rootNavigator: true)
                  ..popUntil((route) => false)
                  ..pushNamed(AppRoutes.signIn);
              },
            ),
          ),
        ),
      ),
    );
  }
}
