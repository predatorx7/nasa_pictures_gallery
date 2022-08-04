import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    final locale = Localizations.localeOf(context);
    final reversedDateFormat = DateFormat("yyyy-MM-dd", locale.toString());
    final dateLabelFormat = DateFormat("dd MMM, yyyy", locale.toString());

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
                    text: dateLabelFormat.format(
                      reversedDateFormat.parse(item.date ?? ''),
                    ),
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
