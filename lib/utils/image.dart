import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

ImageProvider<Object> defaultImageProvider(String url) {
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    return CachedNetworkImageProvider(url);
  } else {
    return NetworkImage(url);
  }
}
