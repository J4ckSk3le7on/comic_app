import 'package:comic_app/pages/home_page/widgets/paginate_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GridWidget extends StatefulWidget {
  final ScrollController scrollController;
  final int itemCount;
  final List<Widget>? items;

  const GridWidget({
    Key? key,
    required this.scrollController,
    required this.itemCount,
    required this.items
  }) : super(key: key);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: SizerUtil.deviceType == DeviceType.tablet ? 2/1.2 : 2/3
      ),
      controller: widget.scrollController,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      cacheExtent: MediaQuery.of(context).size.height * 1,
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        return Item(child: widget.items![index]);
      },
    );
  }

}
