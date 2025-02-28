import 'package:country_app/core/constants/app_colors.dart';
import 'package:country_app/core/widgets/container_widget.dart';
import 'package:country_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        height: 50,
        width: 50,
        child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                      child: ContainerWidget(
                          color: AppColors.secondaryDark,
                          borderRadius: BorderRadius.circular(10),
                          padding: EdgeInsets.all(20),
                          child: Image.network(
                            image,
                          )));
                });
          },
          child: Image.network(
            image,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }
            },
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return Center(
                  child: TextWidget(
                text: "Copy",
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                            child: ContainerWidget(
                                color: AppColors.secondaryDark,
                                borderRadius: BorderRadius.circular(10),
                                padding: EdgeInsets.all(20),
                                child: SelectableText(
                                  "Copy link: $image",
                                  style: GoogleFonts.itim(
                                      color: AppColors.primary),
                                )));
                      });
                },
              ));
            },
          ),
        ),
      ),
    );
  }
}
