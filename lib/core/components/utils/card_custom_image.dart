// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meet_gpt_mobile/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/core/components/images/image_custom.dart';

// ignore: must_be_immutable
class CardCustomImage extends StatelessWidget {
  String title;
  dynamic image;
  Widget? subtitle;
  Function()? onTap;
  Function()? onLongPress;

  CardCustomImage({
    super.key,
    required this.title,
    required this.image,
    this.subtitle,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ListTile(
          leading: FadeInImage(
            placeholder: const AssetImage(ImageConstants.loading),
            image: ImageCustom.getImageProvider(image),
            fadeInDuration: const Duration(milliseconds: 200),
            fadeInCurve: Curves.easeIn,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          subtitle: subtitle,
          onTap: onTap,
          onLongPress: onLongPress,
        ),
      ),
    );
  }
}
