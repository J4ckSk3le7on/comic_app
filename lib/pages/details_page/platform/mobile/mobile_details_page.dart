import 'package:comic_app/core/controllers/details_page_controller.dart';
import 'package:comic_app/pages/details_page/widgets/details_widget.dart';
import 'package:comic_app/pages/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:sizer/sizer.dart';

class MobileDetailsPage extends StatefulWidget {
  final int comicId;

  const MobileDetailsPage({
    Key? key,
    required this.comicId
  }) : super(key: key);

  @override
  MobileDetailsPageState createState() => MobileDetailsPageState();
}

class MobileDetailsPageState extends StateMVC<MobileDetailsPage> {
  late DetailsPageController _controller;

  MobileDetailsPageState() : super(DetailsPageController()) {
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
          width: 100.w,
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              children: [
                ImageWidget(
                  imageUrl: _controller.details!.image!.originalUrl!,
                ),
                const SizedBox(height: 20),
                DetailsWidget(title: 'Characters', data: _controller.details!.characterCredits!),
                DetailsWidget(title: 'Teams', data: _controller.details!.teamCredits!),
                DetailsWidget(title: 'Locations', data: _controller.details!.locationCredits!),
                DetailsWidget(title: 'Concepts', data: _controller.details!.conceptCredits!)
              ],
            ),
          ),
        ),
    );
  }

}
