import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gridview/features/app/extensions/build_context_x.dart';
import 'package:gridview/features/app/widgets/app_scaffold.dart';
import 'package:gridview/features/grid_view/provider/images_provider.dart';
import 'package:gridview/features/grid_view/scope/images_scope.dart';
import 'package:gridview/features/grid_view/ui/widgets/image_item.dart';
import 'package:gridview/features/image_view/ui/image_view_screen.dart';
import 'package:provider/provider.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  Widget _buildProgressIndicator() => const Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          height: 24,
          width: 24,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ImagesScope(
        child: Consumer<ImagesProvider>(
          builder: (context, data, child) => CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index >= data.imageUrls.length) {
                      if (!data.inProgress) {
                        SchedulerBinding.instance?.addPostFrameCallback((_) {
                          data.getImages();
                        });
                      }
                      return _buildProgressIndicator();
                    }
                    return ImageItem(
                      imageUrl: data.imageUrls[index],
                      onPressed: () => context.navigator.push(MaterialPageRoute(
                          builder: (context) =>
                              ImageView(imageUrl: data.imageUrls[index]))),
                    );
                  },
                  childCount: data.hasMore
                      ? data.imageUrls.length + 1
                      : data.imageUrls.length,
                ),
              ),
              if (!data.hasMore)
                const SliverToBoxAdapter(
                    child: Text(
                  'end of story',
                  textAlign: TextAlign.center,
                ))
            ],
          ),
        ),
      ),
    );
  }
}
