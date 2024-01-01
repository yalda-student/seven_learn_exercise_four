/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/add_photo.svg
  String get addPhoto => 'assets/icon/add_photo.svg';

  /// File path: assets/icon/back.svg
  String get back => 'assets/icon/back.svg';

  /// File path: assets/icon/calender.svg
  String get calender => 'assets/icon/calender.svg';

  /// File path: assets/icon/call.svg
  String get call => 'assets/icon/call.svg';

  /// File path: assets/icon/circular_call.svg
  String get circularCall => 'assets/icon/circular_call.svg';

  /// File path: assets/icon/circular_email.svg
  String get circularEmail => 'assets/icon/circular_email.svg';

  /// File path: assets/icon/contact.svg
  String get contact => 'assets/icon/contact.svg';

  /// File path: assets/icon/email.svg
  String get email => 'assets/icon/email.svg';

  /// File path: assets/icon/empty_state.jpg
  AssetGenImage get emptyState =>
      const AssetGenImage('assets/icon/empty_state.jpg');

  /// File path: assets/icon/favorite.svg
  String get favorite => 'assets/icon/favorite.svg';

  /// File path: assets/icon/message.svg
  String get message => 'assets/icon/message.svg';

  /// File path: assets/icon/save.svg
  String get save => 'assets/icon/save.svg';

  /// List of all assets
  List<dynamic> get values => [
        addPhoto,
        back,
        calender,
        call,
        circularCall,
        circularEmail,
        contact,
        email,
        emptyState,
        favorite,
        message,
        save
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
