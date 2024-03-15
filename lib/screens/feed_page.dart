import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

import '../gen/assets.gen.dart';

final videoPlayerControllerProvider =
    Provider<VideoPlayerController>((ref) => VideoPlayerController.asset(
        'assets/demo.mp4')..initialize(),
    );

class FeedPage extends ConsumerWidget {
  FeedPage({super.key});

  @override
  Widget build(BuildContext context, ref) {


    return Scaffold(
      backgroundColor: Colors.brown,
      body: Stack(
        // alignment: Alignment.bottomCenter,
        // clipBehavior: Clip.none,
        children: [
          PageView.builder(
            controller: PageController(),
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (context, index) => Stack(
              children: [
                VideoPlayer(ref.watch(videoPlayerControllerProvider)),
                Stack(
                  children: [
                    Positioned(
                        bottom: 17.h,
                        child: SizedBox(
                            height: 2.h,
                            width: 350.w,
                            child: LinearProgressIndicator())),
                    Positioned(
                      bottom: 35.h,
                      left: 10.w,
                      child: buildVideoDetails(context),
                    ),
                    Positioned(
                        right: 12.w,
                        bottom: 22.h,
                        child: buildFeedActions(context)),
                  ],
                ),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 23.w, right: 14.w),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.white),
                  ),
                  SvgPicture.asset(Assets.search)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildVideoDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '@AdesuaEtomi',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white),
        ),
        Text(
          'The Seagull (Anton Chekhov)',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white),
        ),
        Text(
          '#hollywood-english ',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Column buildFeedActions(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            CircleAvatar(
              radius: 21.r,
              child: Image.asset(Assets.profilepic.path),
            ),
            Positioned(
              top: 30,
              child: Container(
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                    color: Color(0xffFE2C55),
                    borderRadius: BorderRadius.circular(30.r)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        Column(
          children: [
            SvgPicture.asset(Assets.like),
            SizedBox(
              height: 6.h,
            ),
            Text(
              '154',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 12.sp, color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        Column(
          children: [
            SvgPicture.asset(Assets.comment),
            SizedBox(
              height: 6.h,
            ),
            Text(
              '154',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 12.sp, color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        Column(
          children: [
            SvgPicture.asset(Assets.share),
            SizedBox(
              height: 6.h,
            ),
            Text(
              '154',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 12.sp, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
