import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../data/picture.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final SamplePicture item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: item.url ?? '',
        fit: BoxFit.fill,
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
        Flexible(
          child: Text(
            item.title ?? '-',
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.fade,
            style: textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
