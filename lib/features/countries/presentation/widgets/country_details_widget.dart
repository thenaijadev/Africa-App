import 'package:country_app/core/constants/app_colors.dart';
import 'package:country_app/core/utils/app_constants.dart';
import 'package:country_app/core/widgets/text_widget.dart';
import 'package:country_app/features/countries/data/models/country_details.dart';
import 'package:country_app/features/countries/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CountryDetailsWidget extends StatelessWidget {
  final CountryDetails details;

  const CountryDetailsWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final properties = details.toMap();

    return SingleChildScrollView(
      child: Column(
        children: [
          Transform.scale(
              scale: 1.5,
              child: NetworkImageWidget(image: details.flags?.png ?? "")),
          Gap(10),
          Column(
            children: properties.entries.map((entry) {
              final key = entry.key;
              final value = entry.value;

              if (value is Map<String, dynamic>) {
                return ExpansionTile(
                  tilePadding: EdgeInsets.all(-30),
                  title: TextWidget(
                    text: AppConstants.capitalize(key),
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  children: value.entries.map((nestedEntry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text:
                                "${AppConstants.capitalize(nestedEntry.key)}:",
                            color: AppColors.textSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          nestedEntry.value.toString().contains("https")
                              ? NetworkImageWidget(
                                  image: nestedEntry.value.toString(),
                                )
                              : SizedBox(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: TextWidget(
                                    textAlign: TextAlign.end,
                                    text: nestedEntry.value?.toString() ?? "",
                                  ),
                                ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }

              if (value is List) {
                return ExpansionTile(
                  tilePadding: EdgeInsets.all(-30),
                  title: TextWidget(
                    text: AppConstants.capitalize(key),
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  children: value.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (value.toString().contains("https"))
                            NetworkImageWidget(
                              image: value.toString(),
                            )
                          else
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                              child: TextWidget(
                                text: item?.toString() ?? "",
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "${AppConstants.capitalize(key)}:",
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    value.toString().contains("https")
                        ? NetworkImageWidget(
                            image: value?.toString() ?? "",
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: TextWidget(
                              textAlign: TextAlign.end,
                              text: value?.toString() ?? "",
                            ),
                          ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
