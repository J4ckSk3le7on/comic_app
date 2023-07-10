import 'package:comic_app/pages/home_page/desktop_tablet_page/desktop_tablet_home_page.dart';
import 'package:comic_app/pages/home_page/mobile_page/mobile_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return const DesktopTabletHomePage();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return const DesktopTabletHomePage();
        }

        return const MobileHomePage();
      },
    );
  }

}
