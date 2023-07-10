import 'package:comic_app/core/controllers/details_page_controller.dart';
import 'package:comic_app/core/enums/enums.dart';
import 'package:comic_app/pages/details_page/widgets/details_widget.dart';
import 'package:comic_app/pages/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DesktopTabletDetailsPage extends StatefulWidget {
  final int comicId;

  const DesktopTabletDetailsPage({
    Key? key,
    required this.comicId
  }) : super(key: key);

  @override
  DesktopTabletDetailsPageState createState() => DesktopTabletDetailsPageState();
}

class DesktopTabletDetailsPageState extends StateMVC<DesktopTabletDetailsPage> {
  late DetailsPageController _controller;

  DesktopTabletDetailsPageState() : super(DetailsPageController()) {
    _controller = controller as DetailsPageController;
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.fetchData(id: widget.comicId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _controller.details == null ? 
        const Center(child: CircularProgressIndicator())
        : SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            primary: true,
            child: Row(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      DetailsWidget(title: 'Characters', data: _controller.details!.characterCredits!),
                      DetailsWidget(title: 'Teams', data: _controller.details!.teamCredits!),
                      DetailsWidget(title: 'Locations', data: _controller.details!.locationCredits!),
                      DetailsWidget(title: 'Concepts', data: _controller.details!.conceptCredits!)
                    ],
                  ),
                ),
                const SizedBox(width: 100),
                ImageWidget(
                  imageUrl: _controller.details!.image!.originalUrl!,
                  viewType: HomeViewType.list,
                ),
              ],
            ),
          ),
        ),
    );
  }

}
