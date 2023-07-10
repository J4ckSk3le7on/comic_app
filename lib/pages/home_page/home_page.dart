import 'package:comic_app/core/controllers/home_page_controller.dart';
import 'package:comic_app/pages/home_page/widgets/home_page_appbar.dart';
import 'package:comic_app/pages/home_page/widgets/paginate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends StateMVC<HomePage> {
  late HomePageController _controller;
  late HomeViewType viewType;

  HomePageState() : super(HomePageController()) {
    _controller = controller as HomePageController;
  }

  @override
  void initState() {
    super.initState();
    viewType = HomeViewType.list;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.fetchData(refresh: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(
        changeView: (HomeViewType newViewType) { 
          setState(() => viewType = newViewType);
        },
        currentViewType: viewType,
      ),
      body: PaginateWidget(
        viewType: viewType,
        loading: HomePageController().loading,
        error: HomePageController().error,
        onLoadMore: () async {
          if (_controller.offset < _controller.totalResults) {
            _controller.fetchData(refresh: false);
          }
        },
        onRefresh: () async {
          _controller.fetchData(refresh: true);
        },
        onError: () async {
          _controller.fetchData(refresh: true);
        },
        items: const [],
      ),
    );
  }

}
