import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nollywood_actor/gen/assets.gen.dart';
import 'package:nollywood_actor/screens/feed_page.dart';


class HomePage extends HookConsumerWidget {
  HomePage({super.key});

  List<Widget> _pages = [
    FeedPage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  @override
  Widget build(BuildContext context, ref) {
    final tabController = useTabController(initialLength: 5);

    return Scaffold(
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        color: Colors.white,
        child: TabBar(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicator: UnderlineTabIndicator(
            insets:
                EdgeInsets.fromLTRB(0.0, 0.0, 0.0, kBottomNavigationBarHeight-0.5.h),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2.h),
          ),
          controller: tabController,
          tabs: [
            Tab(
              icon: SizedBox(width: 53.w, child: SvgPicture.asset(Assets.home)),
            ),
            Tab(
              icon: SizedBox(
                  width: 53.w, child: SvgPicture.asset(Assets.messagecircle)),
            ),
            Tab(
              icon: SvgPicture.asset(Assets.create),
            ),
            Tab(
              icon:
                  SizedBox(width: 53.w, child: SvgPicture.asset(Assets.message)),
            ),
            Tab(
              icon:
                  SizedBox(width: 53.w, child: SvgPicture.asset(Assets.profile)),
            )
          ],
        ),
      ),
    );
  }
}
