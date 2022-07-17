import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/dimens.dart';
import '../../../../config/routes.dart';
import '../../../../config/styles.dart';
import '../../../../core/app/value.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../note/presentation/widget/note_page_components.dart';
import '../../../note/presentation/widget/w_note_home_background_container.dart';
import '../widgets/my_cupertino_switch.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: noteHomeBackgroundContainer(
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              notePageTitle(
                "Profile",
                "",
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/profile_avatar.png",
                  height: 100.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppStyles.subtitle1TextStyle.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "${AppValue.currentUser.name}\n"),
                    TextSpan(
                      text: AppValue.currentUser.email,
                      style: AppStyles.subtitle2TextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              profilePageItem(
                () {},
                "assets/icons/personal_icon.png",
                "Edit Profile",
                null,
              ),
              SizedBox(height: 12.h),
              profilePageItem(
                () {},
                "assets/icons/notification_solid_icon.png",
                "Notification",
                MyCupertinoSwitch(isOn: true),
              ),
              SizedBox(height: 12.h),
              profilePageItem(
                () {},
                "assets/icons/heart_solid_icon.png",
                "Refer a friend",
                null,
              ),
              SizedBox(height: 12.h),
              profilePageItem(
                () {},
                "assets/icons/help_solid_icon.png",
                "Help and Support",
                null,
              ),
              SizedBox(height: 12.h),
              profilePageItem(
                () {},
                "assets/icons/information_solid_icon.png",
                "About us",
                null,
              ),
              SizedBox(height: 12.h),
              profilePageItem(
                () {},
                "assets/icons/privacy_solid_icon.png",
                "Privacy Policy",
                null,
              ),
              SizedBox(height: 12.h),
              profilePageItem(
                () {
                  BlocProvider.of<AuthBloc>(context).add(const SignOut());
                  Navigator.of(context, rootNavigator: true)
                    ..popUntil((route) => false)
                    ..pushNamed(AppRoutes.signIn);
                },
                "assets/icons/sign_out_solid_icon.png",
                "SignOut",
                const SizedBox.shrink(),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector profilePageItem(
      Function() onTap, String assetUrl, String content, Widget? suffixIcon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68.h,
        margin: EdgeInsets.only(left: 16.w, right: 16.w),
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        decoration: BoxDecoration(
          color: AppColors.boneColor,
          borderRadius: BorderRadius.circular(AppDimens.itemRadius + 8.r),
          border: Border.all(
            color: AppColors.whiteColor,
            width: 1.4.w,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(assetUrl),
            SizedBox(width: 28.w),
            Text(content),
            const Spacer(),
            suffixIcon ?? const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
