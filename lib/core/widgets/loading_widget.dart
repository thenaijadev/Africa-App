import 'package:country_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                color: AppColors.primary,
                backgroundColor: Color.fromARGB(83, 3, 14, 79),
                strokeWidth: 8,
              )),
          const SizedBox(
            height: 30,
          ),
          TextWidget(
            text: label,
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          )
        ],
      ),
    );
  }
}
