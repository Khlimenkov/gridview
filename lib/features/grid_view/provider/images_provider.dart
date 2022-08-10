import 'package:flutter/widgets.dart';
import 'package:gridview/features/grid_view/repository/image_repository.dart';

class ImagesProvider extends ChangeNotifier {
  ImagesProvider({
    Key? key,
    required ImageRepository imageRepository,
  }) : _imageRepository = imageRepository;

  final ImageRepository _imageRepository;

  static const _take = 10;

  final imageUrls = <String>[];

  bool _hasMore = true;

  bool _inProgress = false;

  bool get hasMore => _hasMore;

  bool get inProgress => _inProgress;

  void _setInProgress(bool value) {
    _inProgress = value;
    notifyListeners();
  }

  void _setHasMore(bool value) {
    _hasMore = value;
    notifyListeners();
  }

  Future<void> getImages() async {
    _setInProgress(true);
    final urls = await _imageRepository.getImageLinks(
        take: _take, skip: imageUrls.length);
    _checkHasMore(urls.length);
    imageUrls.addAll(urls);
    _setInProgress(false);
    notifyListeners();
  }

  void _checkHasMore(int imgsLenght) {
    if (imgsLenght < _take) {
      _setHasMore(false);
    } else {
      _setHasMore(true);
    }
  }
}
