import 'package:flutter/material.dart';

const _decorationIfNotVisible = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
    ],
    stops: [0.0, 0.5, 1.0],
  ),
);

const _decorationIfVisible = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black45,
      Colors.black12,
      Colors.black45,
    ],
    stops: [0.0, 0.5, 1.0],
  ),
);

class Overshadow extends StatelessWidget {
  const Overshadow({
    Key? key,
    this.isVisible = false,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        decoration: isVisible ? _decorationIfVisible : _decorationIfNotVisible,
        child: isVisible ? child : null,
      ),
    );
  }
}
