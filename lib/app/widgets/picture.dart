import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:nasa_pictures/app/widgets/loading.dart';

import '../../data/picture.dart';
import '../../utils/date.dart';
import '../../utils/image.dart';

enum ImageQuality {
  regular,
  hd,
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.item,
    this.fit = BoxFit.contain,
    this.quality = ImageQuality.regular,
    this.height,
    this.width,
    this.isDownloadProgressVisible = false,
    required this.isDarkMode,
  });

  final SamplePicture item;
  final BoxFit fit;
  final ImageQuality quality;
  final double? height;
  final double? width;
  final bool isDarkMode;
  final bool isDownloadProgressVisible;

  @override
  Widget build(BuildContext context) {
    final String? imageUrl;
    switch (quality) {
      case ImageQuality.hd:
        imageUrl = item.hdurl ?? item.url;
        break;
      case ImageQuality.regular:
        imageUrl = item.url ?? item.hdurl;
        break;
      default:
        imageUrl = '';
    }

    return Hero(
      tag: 'picture ${item.title}',
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        clipBehavior: Clip.antiAlias,
        type: isDarkMode ? MaterialType.transparency : MaterialType.canvas,
        color: isDarkMode ? null : Colors.grey.shade300,
        child: LoadingListenableImage(
          image: defaultImageProvider(imageUrl ?? ''),
          fit: fit,
          radius: 8,
          height: height,
          width: width,
          isDarkMode: isDarkMode,
          isDownloadProgressVisible: isDownloadProgressVisible,
        ),
      ),
    );
  }
}

class InteractiveItemImage extends StatelessWidget {
  final SamplePicture item;
  final TransformationController controller;
  final bool isInteractiveViewEnabled;
  final bool isDarkMode;

  const InteractiveItemImage({
    super.key,
    required this.item,
    required this.controller,
    required this.isInteractiveViewEnabled,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    if (!isInteractiveViewEnabled) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ItemImage(
              item: item,
              fit: BoxFit.contain,
              quality: ImageQuality.hd,
              isDarkMode: isDarkMode,
              isDownloadProgressVisible: true,
            ),
          ),
        ],
      );
    }

    final metrics = MediaQuery.of(context).size;

    return InteractiveViewer(
      transformationController: controller,
      minScale: 1,
      maxScale: 4,
      boundaryMargin: const EdgeInsets.all(double.infinity),
      onInteractionEnd: (_) {
        controller.value = Matrix4.identity();
      },
      child: ItemImage(
        item: item,
        fit: BoxFit.scaleDown,
        quality: ImageQuality.hd,
        height: metrics.height,
        width: metrics.width,
        isDarkMode: isDarkMode,
        isDownloadProgressVisible: true,
      ),
    );
  }
}

class ItemTileBar extends StatelessWidget {
  const ItemTileBar({
    super.key,
    required this.item,
  });

  final SamplePicture item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      item.title ?? '-',
      maxLines: 2,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: textTheme.titleSmall,
    );
  }
}

class ItemFooter extends StatelessWidget {
  const ItemFooter({
    super.key,
    required this.picture,
  });

  final SamplePicture picture;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ItemDateLabel(item: picture),
          ),
        ),
      ],
    );
  }
}

class ItemDateLabel extends StatelessWidget {
  const ItemDateLabel({
    super.key,
    required this.item,
  });

  final SamplePicture item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 4.0),
                child: Icon(
                  FluentIcons.calendar_ltr_12_regular,
                  size: 12,
                ),
              ),
            ),
            TextSpan(
              text: neatlyFormatDate(
                context,
                item.date,
              ),
            ),
          ],
        ),
        style: textTheme.bodySmall?.merge(TextStyle(
          color: Theme.of(context).colorScheme.primary.withRed(200),
          fontSize: 10,
        )),
        textAlign: TextAlign.start,
      ),
    );
  }
}
