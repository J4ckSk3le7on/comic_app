import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DescriptionWidget extends StatelessWidget {
  final String name;
  final String date;

  const DescriptionWidget({
    Key? key,
    required this.name,
    required this.date
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 50.w,
          child: Text(name,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Text(date,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

}
