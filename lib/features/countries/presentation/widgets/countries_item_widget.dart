import 'package:country_app/core/constants/app_colors.dart';
import 'package:country_app/core/widgets/container_widget.dart';
import 'package:country_app/core/widgets/text_widget.dart';
import 'package:country_app/features/countries/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CountryItemWidget extends StatelessWidget {
  const CountryItemWidget({
    super.key,
    required this.flag,
    required this.country,
    required this.onTap,
  });
  final String flag;
  final String country;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        onTap: onTap,
        margin: EdgeInsets.only(bottom: 20),
        shadow: [
          BoxShadow(
              color: const Color.fromARGB(84, 0, 0, 0),
              blurRadius: 10,
              offset: Offset(3, 3)),
        ],
        borderRadius: BorderRadius.circular(10),
        padding: EdgeInsets.all(10),
        color: AppColors.secondaryDark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                NetworkImageWidget(image: flag),
                Gap(20),
                SizedBox(
                  width: 200,
                  child: TextWidget(text: country),
                )
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.primary,
            ),
          ],
        ));
  }
}
