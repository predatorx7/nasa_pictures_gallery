import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: const Size.square(40),
        child: const CircularProgressIndicator(),
      ),
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
