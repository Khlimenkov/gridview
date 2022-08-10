import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gridview/features/app/widgets/app_scaffold.dart';
import 'package:gridview/features/grid_view/ui/widgets/image_item.dart';
import 'package:gridview/features/image_view/ui/widgets/floating_share_btn.dart';
import 'package:gridview/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: SizedBox.expand(
            child: Stack(
      children: [
        Center(child: ImageItem(imageUrl: imageUrl)),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingWithLoadingBtn(
            onPressed: () async {
              final file = await Utils.fileFromImageUrl(imageUrl);
              await Share.shareFiles(
                [file.path],
                subject: 'Share photo',
              );
            },
          ),
        )
      ],
    )));
  }
}
