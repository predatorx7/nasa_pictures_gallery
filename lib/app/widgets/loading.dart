import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging_manager/logging.dart';
import 'package:nasa_pictures/configs/logging.dart';

import '../../configs/config.dart';
import '../../modules/logging.dart';

const _loading = ShimmerLoadingWidget(
  isDarkMode: false,
  radius: 8,
);

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.70,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ).add(const EdgeInsets.only(
        bottom: 40.0,
      )),
      itemBuilder: (context, index) {
        return _loading;
      },
      itemCount: 40,
    );
  }
}

class SliverLoadingWidget extends StatelessWidget {
  const SliverLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.fromSize(
            size: const Size.square(20),
            child: const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

class LoadingTileWidget extends StatelessWidget {
  const LoadingTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox.fromSize(
          size: const Size.square(40),
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }
}

class ShimmerLoadingWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final bool isDarkMode;

  const ShimmerLoadingWidget({
    Key? key,
    this.height,
    this.width,
    required this.radius,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (buildConfigurations.isTestMode) {
      return const Text('LOADING');
    }

    final fadeTheme = isDarkMode ? FadeTheme.dark : FadeTheme.light;
    if (height == null || width == null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final h = height ?? constraints.maxHeight;
          final w = width ?? constraints.maxWidth;

          return FadeShimmer(
            height: h,
            width: w,
            radius: radius,
            fadeTheme: fadeTheme,
          );
        },
      );
    }

    return FadeShimmer(
      height: height!,
      width: width!,
      radius: radius,
      fadeTheme: fadeTheme,
    );
  }
}

class LoadingListenableImage extends StatelessWidget {
  final ImageProvider<Object> image;
  final BoxFit? fit;
  final bool isDarkMode;
  final double? height;
  final double? width;
  final double radius;
  final bool isDownloadProgressVisible;

  const LoadingListenableImage({
    Key? key,
    required this.image,
    required this.isDarkMode,
    this.fit,
    required this.height,
    required this.width,
    required this.radius,
    required this.isDownloadProgressVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Logging logger = logging('_LoadingListenableImageState');
    final img = image;
    if (img is NetworkImage) {
      logger = logger(img.url);
    }

    final _loadingWidget = ShimmerLoadingWidget(
      height: height,
      width: width,
      isDarkMode: isDarkMode,
      radius: radius,
    );

    Widget onLoadingBuild(
      BuildContext context,
      Widget child,
      ImageChunkEvent? loadingProgress,
    ) {
      if (loadingProgress != null) {
        return ImageLoadingProgress(
          event: loadingProgress,
          child: _loadingWidget,
        );
      }

      return Center(
        child: child,
      );
    }

    Widget onFrameBuild(
      BuildContext context,
      Widget child,
      int? frame,
      bool wasSynchronouslyLoaded,
    ) {
      if (wasSynchronouslyLoaded || frame != null) {
        return child;
      }
      return _loadingWidget;
    }

    return ProviderScope(
      overrides: [
        loggingProvider.overrideWithValue(logger),
      ],
      child: Image(
        image: image,
        fit: fit,
        filterQuality: FilterQuality.none,
        frameBuilder: !isDownloadProgressVisible ? onFrameBuild : null,
        loadingBuilder: isDownloadProgressVisible ? onLoadingBuild : null,
        height: height,
        width: width,
      ),
    );
  }
}

class ImageLoadingProgress extends StatelessWidget {
  const ImageLoadingProgress({
    Key? key,
    required this.event,
    required this.child,
  }) : super(key: key);

  final ImageChunkEvent event;
  final Widget child;

  double? progressFrom(ImageChunkEvent event) {
    final total = event.expectedTotalBytes;
    final n = event.cumulativeBytesLoaded;

    if (total == null || total <= 0 || n < 0 || total <= n) {
      return null;
    }

    return n / total;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final progress = progressFrom(event);

    if (progress == null) return child;

    return Stack(
      alignment: Alignment.center,
      fit: StackFit.passthrough,
      clipBehavior: Clip.none,
      children: [
        Center(
          child: child,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
