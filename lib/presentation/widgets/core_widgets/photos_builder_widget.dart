import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../data/models/photo_model.dart';
import '../screens/details_screen.dart';

class PhotosBuilderWidget extends StatelessWidget {
  const PhotosBuilderWidget({
    Key? key,
    required this.listOfPhoto,
  }) : super(key: key);

  final List<PhotoModel> listOfPhoto;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.w,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(photo: listOfPhoto[index]),
                  ));
              //ToDo change type of  navigation
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image(
                  image: NetworkImage(listOfPhoto[index].portrait),
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image_sharp,
                        color: Colors.blueGrey,
                      ),
                    );
                  },
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 16,
                  child: Text(
                    listOfPhoto[index].photographer,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: listOfPhoto.length,
      ),
    );
  }
}
