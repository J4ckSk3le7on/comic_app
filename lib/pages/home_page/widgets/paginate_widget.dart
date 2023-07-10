import 'package:comic_app/pages/home_page/widgets/grid_widget.dart';
import 'package:comic_app/pages/home_page/widgets/home_page_appbar.dart';
import 'package:comic_app/pages/home_page/widgets/list_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PaginateWidget extends StatefulWidget {
  final bool loading;
  final bool error;
  final AsyncCallback onLoadMore;
  final AsyncCallback onRefresh;
  final AsyncCallback onError;
  final List<Widget>? items;
  final HomeViewType viewType;

  const PaginateWidget({
    Key? key,
    required this.onLoadMore,
    required this.items,
    required this.loading,
    required this.onRefresh,
    required this.error,
    required this.onError,
    required this.viewType,
  }) : super(key: key);

  @override
  State<PaginateWidget> createState() => _PaginateWidgetState();
}

class _PaginateWidgetState extends State<PaginateWidget> {
  final ScrollController scrollController = ScrollController();
  final int delayedMillis = 100;
  int milliseconds = 0;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
            (scrollController.position.maxScrollExtent - MediaQuery.of(context).size.height * 1)
                .abs()) {
          if (!widget.loading && (DateTime.now().millisecond - milliseconds).abs() > delayedMillis) {
            milliseconds = DateTime.now().millisecond;
            widget.onLoadMore();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [...widget.items ?? [const SizedBox(height: 20)]];
    if (widget.loading) {
      items.add(const Padding(
        padding: EdgeInsets.all(8),
        child: CircularProgressIndicator(),
      ));
    }
    if (widget.error) {
      items.add(Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          child: const Text("Retry"),
          onPressed: () async {
            await widget.onError();
          },
        ),
      ));
    }
    return RefreshIndicator(
      onRefresh: () async {
        await widget.onRefresh();
      },
      child: widget.viewType == HomeViewType.list ? 
        ListWidget(
          scrollController: scrollController,
          itemCount: widget.items!.length,
          items: items
        ) : GridWidget(
          scrollController: scrollController,
          itemCount: widget.items!.length,
          items: items
        )
    );
  }
}

class Item extends StatefulWidget {
  final Widget child;

  const Item({Key? key, required this.child}) : super(key: key);

  @override
    ItemState createState() {
    return ItemState();
  }
}

class ItemState extends State<Item> with AutomaticKeepAliveClientMixin<Item> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
