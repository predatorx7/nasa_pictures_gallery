import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../data/picture.dart';
import '../../utils/date.dart';

enum ImageQuality {
  regular,
  hd,
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key? key,
    required this.item,
    this.fit = BoxFit.fill,
    this.quality = ImageQuality.regular,
    this.height,
    this.width,
  }) : super(key: key);

  final SamplePicture item;
  final BoxFit fit;
  final ImageQuality quality;
  final double? height;
  final double? width;

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
        type: MaterialType.transparency,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imageUrl ?? '',
          fit: fit,
          height: height,
          width: width,
        ),
      ),
    );
  }
}

class InteractiveItemImage extends StatelessWidget {
  final SamplePicture item;
  final TransformationController controller;

  const InteractiveItemImage({
    super.key,
    required this.item,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
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
        fit: BoxFit.contain,
        quality: ImageQuality.hd,
        height: metrics.height,
        width: metrics.width,
      ),
    );
  }
}

class ItemTileBar extends StatelessWidget {
  const ItemTileBar({
    Key? key,
    required this.item,
  }) : super(key: key);

  final SamplePicture item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(),
        Flexible(
          child: Text(
            item.title ?? '-',
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.fade,
            style: textTheme.titleSmall,
          ),
        ),
        Flexible(
          child: Padding(
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
                        ) ??
                        '',
                  ),
                ],
              ),
              style: textTheme.caption?.merge(TextStyle(
                color: Theme.of(context).colorScheme.primary.withRed(200),
                fontSize: 10,
              )),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}
