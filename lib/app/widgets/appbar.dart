import 'package:flutter/material.dart';

import 'search.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    super.key,
    super.leadingWidth = 0,
    super.toolbarHeight = kToolbarHeight + 10,
    super.centerTitle = false,
    super.titleSpacing = 8,
    super.title = const BrowsingSearchBar(),
    super.actions,
  });
}
