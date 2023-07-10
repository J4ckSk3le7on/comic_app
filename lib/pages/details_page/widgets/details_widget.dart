import 'package:comic_app/core/models/issue_details_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailsWidget extends StatelessWidget {
  final String title;
  final List<Volume> data;

  const DetailsWidget({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            width: SizerUtil.deviceType == DeviceType.tablet ? 50.w : 80.w,
            height: 3,
            color: Colors.grey,
          ),
          SizedBox(
            width: SizerUtil.deviceType == DeviceType.tablet ? 30.w : null,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: SizerUtil.deviceType == DeviceType.tablet ? 2/1 : 4/1,
              ),
              shrinkWrap: true,
              children: data.map((data) {
                  return Text(data.name! ,
                    style: Theme.of(context).textTheme.titleSmall,
                  );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

}
