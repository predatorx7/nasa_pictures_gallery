import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/l10n/l10n.dart';

import '../../modules/search.dart';

class BrowsingSearchBar extends ConsumerStatefulWidget {
  const BrowsingSearchBar({Key? key}) : super(key: key);

  @override
  ConsumerState<BrowsingSearchBar> createState() => _BrowsingSearchBarState();
}

class _BrowsingSearchBarState extends ConsumerState<BrowsingSearchBar> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
    _controller.addListener(_onTextChange);
  }

  void _onTextChange() {
    ref
        .read(browsingSearchQueryProvider.notifier)
        .onTextChanged(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.0),
    );

    return TextField(
      autocorrect: false,
      focusNode: _focusNode,
      controller: _controller,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      style: textTheme.labelLarge?.merge(const TextStyle(
        color: Colors.black,
      )),
      autofocus: false,
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: const Icon(
          FluentIcons.search_28_regular,
          color: Colors.black,
        ),
        border: inputBorder,
        focusedBorder: inputBorder.copyWith(
            borderSide: const BorderSide(
          color: Colors.black,
          width: 0.4,
        )),
        hintText: context.l10n.searchPictures,
        hintStyle: textTheme.labelMedium?.merge(TextStyle(
          color: Colors.grey.shade600,
        )),
        suffixIcon: ClearSearch(
          focusNode: _focusNode,
          controller: _controller,
        ),
      ),
    );
  }
}

class ClearSearch extends StatelessWidget {
  const ClearSearch({
    Key? key,
    required FocusNode focusNode,
    required TextEditingController controller,
  })  : _focusNode = focusNode,
        _controller = controller,
        super(key: key);

  final FocusNode _focusNode;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _focusNode,
      builder: (context, _) {
        final hasFocus = _focusNode.hasPrimaryFocus;
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final isNotEmpty = _controller.text.isNotEmpty;
            final isEnabled = hasFocus || isNotEmpty;

            if (!isEnabled) {
              return const SizedBox();
            }

            return IconButton(
              onPressed: () {
                if (!hasFocus) _controller.clear();
                _focusNode.unfocus();
              },
              icon: const Icon(
                Icons.close,
              ),
              color: Colors.grey,
            );
          },
        );
      },
    );
  }
}
