import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_pictures/configs/config.dart';

ImageProvider<Object> defaultImageProvider(String url) {
  if (!buildConfigurations.isTestMode &&
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS)) {
    return CachedNetworkImageProvider(url);
  } else {
    return NetworkImage(url);
  }
}
