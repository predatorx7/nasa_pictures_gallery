import 'package:flutter/material.dart';
import 'package:nasa_pictures/gen/assets.gen.dart';

class _AppSplashFragment extends StatelessWidget {
  const _AppSplashFragment();

  @override
  Widget build(BuildContext context) {
    const iconSize = 250.0;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Image(
          image: AssetImage(
            Assets.brand.icon.path,
          ),
          height: iconSize,
          width: iconSize,
          fit: BoxFit.scaleDown,
          excludeFromSemantics: true,
        ),
      ),
    );
  }
}

const splashWithoutAnimationUI = _AppSplashFragment();

const durationOfSplashWithoutAnimations = Duration(milliseconds: 1500);
