import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nollywood_actor/gen/assets.gen.dart';
import 'package:nollywood_actor/screens/feed_page.dart';
import 'package:nollywood_actor/screens/home_page.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 13.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: SvgPicture.asset(
                  Assets.nollylogo,
                  height: 48.h,
                  width: 64.w,
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              SizedBox(
                  child: Image.asset(
                    Assets.pictureframes.path,
                    height: 318.h,
                    width: 375.w,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'For actors, directors, and everyone in-between',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 0.5.h,
                    width: 94.w,
                    decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Text(
                    'Start exploring',
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 12.sp, color: Color(0xff7C7C7C)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Container(
                    height: 0.5.h,
                    width: 94.w,
                    decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Center(
                  child: AppButton(text: 'Explore as an actor',
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomePage()));
                      })),
              SizedBox(
                height: 15.h,
              ),
              Center(
                  child: AppButton(text: 'Explore as a producer',
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    textColor: Colors.black,
                    borderColor: Colors.black,)),

            ],
          ),
        ));
  }
}

class AppButton extends StatelessWidget {
  AppButton({
    required this.text,
    this.onPressed,
    required this.backgroundColor,
    this.borderColor,
    required this.textColor,
    super.key,
  });

  Color? borderColor;
  Color backgroundColor;
  Color textColor;
  String text;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: 327.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              disabledBackgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: borderColor ?? Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(8.r),
              )),
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme
                .of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: textColor),
            textAlign: TextAlign.center,
          )),
    );
  }
}
