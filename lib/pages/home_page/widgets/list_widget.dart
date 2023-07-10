import 'package:comic_app/pages/home_page/widgets/paginate_widget.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final int itemCount;
  final List<Widget>? items;

  const ListWidget({
    Key? key,
    required this.scrollController,
    required this.itemCount,
    required this.items
  }) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      cacheExtent: MediaQuery.of(context).size.height * 1,
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Item(child: widget.items![index]),
        );
      },
    );
  }

}
