import 'package:comic_app/pages/home_page/widgets/home_page_appbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final HomeViewType viewType;

  const ImageWidget({
    Key? key,
    required this.imageUrl,
    required this.viewType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl,
      width: viewType == HomeViewType.list ? 40.w : 30.w,
      height: viewType == HomeViewType.list ? 30.h : 20.h,
      fit: BoxFit.cover,
    );
  }

}
