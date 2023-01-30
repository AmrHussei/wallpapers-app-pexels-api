import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class BuildLoadingWiget extends StatelessWidget {
  const BuildLoadingWiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[350]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.white,
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
