import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key? key,
    required this.imageUrl,
    this.onPressed,
  }) : super(key: key);

  final String imageUrl;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => GestureDetector(
              onTap: onPressed,
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
                height: 24,
                width: 24,
              ),
            ),
        errorWidget: (context, url, error) => const Icon(Icons.error));
  }
}
