import 'package:flutter/material.dart';
import 'package:gridview/features/grid_view/provider/images_provider.dart';
import 'package:gridview/features/grid_view/repository/image_repository.dart';
import 'package:provider/provider.dart';

class ImagesScope extends StatelessWidget {
  const ImagesScope({Key? key, required this.child})
      : super(
          key: key,
        );
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ImagesProvider(imageRepository: ImageRepositoryImpl()),
      child: child,
    );
  }
}
