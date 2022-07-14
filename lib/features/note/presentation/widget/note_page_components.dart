import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/styles.dart';

Container notePageTitle(String title, String subTtile) => Container(
      width: double.infinity,
      height: 180.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_title_background.png"),
          fit: BoxFit.fill,
        ),
        color: Colors.transparent,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 36.h),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppStyles.headline6TextStyle.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(text: title),
                TextSpan(
                  text: subTtile,
                  style: AppStyles.subtitle1TextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
