import 'package:comic_app/pages/home_page/widgets/grid_widget.dart';
import 'package:comic_app/pages/home_page/widgets/home_page_appbar.dart';
import 'package:comic_app/pages/home_page/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  late HomeViewType viewType;

  @override
  void initState() {
    super.initState();
    viewType = HomeViewType.list;
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
      body: viewType == HomeViewType.list ? const ListWidget() : const GridWidget(),
    );
  }

}
