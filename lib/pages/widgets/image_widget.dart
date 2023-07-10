import 'package:comic_app/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final HomeViewType viewType;

  const ImageWidget({
    Key? key,
    required this.imageUrl,
    this.viewType = HomeViewType.grid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (SizerUtil.deviceType == DeviceType.mobile) {
      return Image.network(imageUrl,
        width: viewType == HomeViewType.list ? 40.w : 30.w,
        height: viewType == HomeViewType.list ? 30.h : 20.h,
        fit: BoxFit.contain,
      );
    } else {
      return Image.network(imageUrl,
        width: viewType == HomeViewType.list ? 40.w : 30.w,
        height: viewType == HomeViewType.list ? 50.h : 20.h,
        fit: BoxFit.contain,
      );
    }
  }

}
