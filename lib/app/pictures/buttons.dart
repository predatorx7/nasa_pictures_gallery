part of 'pictures.dart';

class MetadataToggleButton extends ConsumerWidget {
  const MetadataToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(informationVisibilityController);

    void toggle() {
      ref
          .read(informationVisibilityController.notifier)
          .update((state) => !state);
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 16.0),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        onPressed: toggle,
        icon: isVisible
            ? const Icon(FluentIcons.eye_off_24_regular)
            : const Icon(FluentIcons.eye_24_regular),
        label: isVisible ? const Text('Hide') : const Text('Info'),
      ),
    );
  }
}

class InteractiveViewToggleButton extends ConsumerWidget {
  const InteractiveViewToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(isInteractiveViewEnabledController);

    void toggle() {
      ref
          .read(isInteractiveViewEnabledController.notifier)
          .update((state) => !state);
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 16.0),
      child: IconButton(
        onPressed: toggle,
        icon: isVisible
            ? const Icon(FluentIcons.phone_span_out_24_regular)
            : const Icon(FluentIcons.arrow_expand_24_regular),
        tooltip: isVisible
            ? 'Enable scrolling horizontally to change page'
            : 'Enable pan & zoom',
      ),
    );
  }
}

class PreviousPageButton extends ConsumerWidget {
  const PreviousPageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInfoVisible = ref.watch(informationVisibilityController);
    final page = ref.watch(picturesPageNumberProvider);

    if (isInfoVisible || (page != null && page <= 0)) {
      return const SizedBox();
    }

    return IconButton(
      onPressed: PageChange(ref).toPreviousPage,
      icon: const Icon(Icons.arrow_back_ios_rounded),
      color: Colors.white,
    );
  }
}

class NextPageButton extends ConsumerWidget {
  const NextPageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInfoVisible = ref.watch(informationVisibilityController);
    final valuesLength = ref.watch(filteredValuesLengthProvider);
    final page = ref.watch(picturesPageNumberProvider);

    if (isInfoVisible || (page != null && page > valuesLength)) {
      return const SizedBox();
    }

    return IconButton(
      onPressed: PageChange(ref).toNextPage,
      icon: const Icon(Icons.arrow_forward_ios_rounded),
      color: Colors.white,
    );
  }
}
