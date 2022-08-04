import 'package:flutter/material.dart';
import 'package:nasa_pictures/configs/logging.dart';

class ErrorPlaceholderWidget extends StatelessWidget {
  const ErrorPlaceholderWidget(
    this.error,
    this.stacktrace, {
    Key? key,
  }) : super(key: key);

  final Object? error;
  final StackTrace? stacktrace;

  @override
  Widget build(BuildContext context) {
    logging('ErrorPlaceholderWidget').warning('Error', error, stacktrace);
    return const Center(child: Icon(Icons.error));
  }
}

class SliverErrorPlaceholderWidget extends StatelessWidget {
  const SliverErrorPlaceholderWidget(
    this.error,
    this.stacktrace, {
    Key? key,
  }) : super(key: key);

  final Object? error;
  final StackTrace? stacktrace;

  @override
  Widget build(BuildContext context) {
    logging('SliverErrorPlaceholderWidget').warning('Error', error, stacktrace);
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.error),
        ],
      ),
    );
  }
}
