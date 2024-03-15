import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nollywood_actor/main.dart';
import 'package:nollywood_actor/screens/onboarding.dart';

import '../gen/assets.gen.dart';

final splashScreenTimerProvider = Provider<Timer>((ref) {
  return Timer(
    const Duration(seconds: 5),
    () async {
      ref.read(navigatorKeyProvider).currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => Onboarding()));
    },
  );
});

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    ref.watch(splashScreenTimerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1500),
          opacity: 1,
          curve: Curves.easeIn,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.nollywoodlogo,
                    width: 120.w,
                    height: 76.h,
                  ),
                  SizedBox(height: 7.h,),
                  Text(
                    'NOLLYWOOD ACTOR',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  ),

                ],
              ),
              Positioned(
                  bottom: 36.h,
                  child: CupertinoActivityIndicator(color: Colors.white, radius: 22.r,)),
            ],
          ),
        ),
      ),
    );
  }
}
