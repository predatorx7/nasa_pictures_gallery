import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

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
        return LayoutBuilder(builder: (context, contraints) {
          return ShimmerLoadingWidget(
            isLoading: true,
            isDarkMode: false,
            radius: 8,
            height: contraints.maxHeight,
            width: contraints.maxWidth,
            child: const SizedBox(),
          );
        });
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
            size: const Size.square(40),
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
  final bool isLoading;
  final Widget child;

  /// Prefer static Stateless widget instance for better performance
  final double height;
  final double width;
  final double radius;
  final bool isDarkMode;

  const ShimmerLoadingWidget({
    Key? key,
    required this.isLoading,
    required this.child,
    required this.height,
    required this.width,
    required this.radius,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return FadeShimmer(
        height: height,
        width: width,
        radius: radius,
        fadeTheme: isDarkMode ? FadeTheme.dark : FadeTheme.light,
      );
    } else {
      return child;
    }
  }
}

class LoadingListenableImage extends StatefulWidget {
  final ImageProvider<Object> image;
  final BoxFit? fit;
  final double? aspectRatio;
  final bool isDarkMode;
  final double height;
  final double width;
  final double radius;

  const LoadingListenableImage({
    Key? key,
    required this.image,
    required this.isDarkMode,
    this.fit,
    this.aspectRatio,
    required this.height,
    required this.width,
    required this.radius,
  }) : super(key: key);

  @override
  State<LoadingListenableImage> createState() => _LoadingListenableImageState();
}

class _LoadingListenableImageState extends State<LoadingListenableImage> {
  bool _loading = false;

  void _notifyLoaded() {
    if (_loading == false) return;
    if (mounted) {
      Future.microtask(() {
        if (mounted) {
          setState(() {
            _loading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _loadingWidget = ShimmerLoadingWidget(
      isLoading: true,
      isDarkMode: widget.isDarkMode,
      height: widget.height,
      width: widget.width,
      radius: widget.radius,
      child: const SizedBox(),
    );

    return Image(
      image: widget.image,
      fit: widget.fit,
      frameBuilder: (
        BuildContext context,
        Widget child,
        int? frame,
        bool wasSynchronouslyLoaded,
      ) {
        if (wasSynchronouslyLoaded) {
          _loading = false;
          return child;
        }
        return _loading ? _loadingWidget : child;
      },
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent? loadingProgress,
      ) {
        if (loadingProgress == null) {
          _notifyLoaded();
          return child;
        }
        _loading = true;
        return _loadingWidget;
      },
      height: widget.height,
      width: widget.width,
    );
  }
}
