import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    required this.positionImage,
  });

  final AssetImage positionImage;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Stack(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.white54,
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                ),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image: positionImage,
            ),
          ),
        ],
      ),
      AspectRatio(
        aspectRatio: 3 / 2,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 1],
            ),
          ),
        ),
      ),
      Positioned(
        left: 5.0,
        top: 20.0,
        child: SafeArea(
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              EvaIcons.arrowIosBack,
              color: Colors.black,
              size: 25.0,
            ),
          ),
        ),
      ),
    ],
  );
}
