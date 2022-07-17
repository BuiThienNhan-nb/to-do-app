import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/dimens.dart';
import '../../../../config/routes.dart';
import '../../../../config/styles.dart';

Container authBackgroundContainer(Widget child) => Container(
      height: AppDimens.designSize.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/auth_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );

Align forgotPasswordButton() => Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forgot Password?",
          style: AppStyles.subtitle1TextStyle.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );

RichText signUpButton(BuildContext context) => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style:
            AppStyles.subtitle1TextStyle.copyWith(color: AppColors.blackColor),
        children: <TextSpan>[
          const TextSpan(text: "Don't have an account? "),
          TextSpan(
            text: "Sign up",
            style: AppStyles.subtitle1TextStyle
                .copyWith(color: AppColors.endeavourColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pushNamed(AppRoutes.signUp);
              },
          ),
        ],
      ),
    );

InputDecoration authInputDecoration(
        String label, Widget prefixIcon, Widget? suffixIcon) =>
    InputDecoration(
      hintText: label,
      hintStyle: AppStyles.headline6TextStyle.copyWith(
        color: AppColors.echoBlueColor,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.itemRadius),
        borderSide: BorderSide(
          color: AppColors.echoBlueColor,
          width: 0.8.w,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.itemRadius),
        borderSide: BorderSide(
          color: AppColors.echoBlueColor,
          width: 0.8.w,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.itemRadius),
        borderSide: BorderSide(
          color: AppColors.endeavourColor,
          width: 1.2.w,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.itemRadius),
        borderSide: BorderSide(
          color: AppColors.echoBlueColor,
          width: 0.8.w,
        ),
      ),
      filled: true,
      fillColor: AppColors.solitudeColor,
    );
