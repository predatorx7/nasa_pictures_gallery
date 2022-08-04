import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/l10n/l10n.dart';

class SliverNoResults extends ConsumerWidget {
  const SliverNoResults({
    Key? key,
    required this.wasSearched,
    required this.onRefreshPress,
  }) : super(key: key);

  final bool wasSearched;
  final VoidCallback onRefreshPress;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: NoResults(
        wasSearched: wasSearched,
        onRefreshPress: onRefreshPress,
      ),
    );
  }
}

class NoResults extends StatelessWidget {
  const NoResults({
    Key? key,
    required this.wasSearched,
    required this.onRefreshPress,
  }) : super(key: key);

  final bool wasSearched;
  final VoidCallback onRefreshPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            FluentIcons.search_48_filled,
            size: 100,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                wasSearched ? context.l10n.noResults : context.l10n.noPictures,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: onRefreshPress,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.0),
                    child: Text('Try again'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
