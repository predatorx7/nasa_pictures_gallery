part of 'pictures.dart';

const _pageScrollDuration = Duration(milliseconds: 300);
const _pageScrollCurve = Curves.easeInOut;

final indexedItemProvider = Provider.family.autoDispose((ref, int index) {
  final pagination = ref.read(itemsPaginationControllerProvider.notifier);

  final values = ref.watch(
    itemsPaginationControllerProvider.select((value) => value.iterable),
  );
  if (values == null) return null;

  return ref.watch(filteredValuesProvider(values).select((data) {
    final length = data.length;
    if (length - 1 == index) {
      pagination.requestFetch();
    }
    return data.elementAt(index);
  }));
});

final informationVisibilityController = StateProvider((ref) {
  return true;
});

final isInteractiveViewEnabledController = StateProvider((ref) {
  return false;
});

final filteredValuesLengthProvider = Provider((ref) {
  return ref.watch(filteredValuesProvider(ref.watch(
    itemsPaginationControllerProvider.select(
      (value) => value.iterable ?? const [],
    ),
  )).select((value) => value.length));
});

final picturesPageViewControllerProvider = Provider<PageController>((ref) {
  throw UnimplementedError();
});

class PageChange {
  final WidgetRef ref;

  PageChange(this.ref);

  Future<void> toPage(int? Function(int current) page) {
    final sc = ref.read(picturesPageViewControllerProvider);

    final oldIndex = sc.page?.round();
    if (oldIndex == null) return Future.value();
    final newIndex = page(oldIndex);
    if (newIndex == null) return Future.value();

    return sc.animateToPage(
      newIndex,
      duration: _pageScrollDuration,
      curve: _pageScrollCurve,
    );
  }

  Future<void> toPreviousPage() {
    return toPage((a) {
      if (a == 0) return null;
      return a - 1;
    });
  }

  Future<void> toNextPage() {
    return toPage((a) {
      if (a == ref.read(filteredValuesLengthProvider) - 1) return null;
      return a + 1;
    });
  }
}

final picturesPageViewChangeNotifierProvider = ChangeNotifierProvider(
  (ref) {
    return ref.watch(picturesPageViewControllerProvider);
  },
  dependencies: [picturesPageViewControllerProvider],
);

final picturesPageNumberProvider = Provider.autoDispose(
  (ref) {
    return ref.watch(
      picturesPageViewChangeNotifierProvider.select(
        (value) => value.page?.round(),
      ),
    );
  },
  dependencies: [
    picturesPageViewControllerProvider,
    picturesPageViewChangeNotifierProvider,
  ],
);
