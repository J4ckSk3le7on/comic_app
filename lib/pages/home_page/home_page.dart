import 'package:comic_app/core/controllers/home_page_controller.dart';
import 'package:comic_app/core/enums/enums.dart';
import 'package:comic_app/pages/details_page/details_page.dart';
import 'package:comic_app/pages/home_page/widgets/description_widget.dart';
import 'package:comic_app/pages/home_page/widgets/home_page_appbar.dart';
import 'package:comic_app/pages/widgets/image_widget.dart';
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
      _controller.fetchData(refresh: false);
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
      body: _controller.list == null ? 
        const Center(child: CircularProgressIndicator())
        : PaginateWidget(
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
        items: _controller.list?.map((result) {
          if (viewType == HomeViewType.grid) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(comicId: result.id),
                  ),
                );
              },
              child: Column(
                children: [
                  ImageWidget(
                    imageUrl: result.image.originalUrl,
                    viewType: viewType,
                  ),
                  DescriptionWidget(
                    name: result.volume.name,
                    date: result.dateAdded.toString()
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(comicId: result.id),
                  ),
                );
              },
              child: Row(
                children: [
                  ImageWidget(
                    imageUrl: result.image.originalUrl,
                    viewType: viewType,
                  ),
                  const SizedBox(width: 10),
                  DescriptionWidget(
                    name: result.volume.name,
                    date: result.dateAdded.toString()
                  )
                ],
              ),
            );
          }
        }).toList(),
      ),
    );
  }

}
