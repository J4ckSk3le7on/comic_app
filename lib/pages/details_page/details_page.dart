import 'package:comic_app/pages/details_page/platform/desktop_tablet/desktop_tablet_details_page.dart';
import 'package:comic_app/pages/details_page/platform/mobile/mobile_details_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DetailsPage extends StatelessWidget {
  final int comicId;

  const DetailsPage({
    Key? key,
    required this.comicId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop 
          || sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return DesktopTabletDetailsPage(comicId: comicId);
        }
        return MobileDetailsPage(comicId: comicId);
      },
    );
  }

}
