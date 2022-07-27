/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsNetflixCloneGen {
  const $AssetsNetflixCloneGen();

  /// File path: assets/netflix_clone/atla.jpg
  AssetGenImage get atla =>
      const AssetGenImage('assets/netflix_clone/atla.jpg');

  /// File path: assets/netflix_clone/atla_title.png
  AssetGenImage get atlaTitle =>
      const AssetGenImage('assets/netflix_clone/atla_title.png');

  /// File path: assets/netflix_clone/black_mirror.jpg
  AssetGenImage get blackMirror =>
      const AssetGenImage('assets/netflix_clone/black_mirror.jpg');

  /// File path: assets/netflix_clone/black_mirror_title.png
  AssetGenImage get blackMirrorTitle =>
      const AssetGenImage('assets/netflix_clone/black_mirror_title.png');

  /// File path: assets/netflix_clone/breaking_bad.jpeg
  AssetGenImage get breakingBad =>
      const AssetGenImage('assets/netflix_clone/breaking_bad.jpeg');

  /// File path: assets/netflix_clone/carole_and_tuesday.jpg
  AssetGenImage get caroleAndTuesday =>
      const AssetGenImage('assets/netflix_clone/carole_and_tuesday.jpg');

  /// File path: assets/netflix_clone/carole_and_tuesday_title.png
  AssetGenImage get caroleAndTuesdayTitle =>
      const AssetGenImage('assets/netflix_clone/carole_and_tuesday_title.png');

  /// File path: assets/netflix_clone/crown.jpg
  AssetGenImage get crown =>
      const AssetGenImage('assets/netflix_clone/crown.jpg');

  /// File path: assets/netflix_clone/crown_title.png
  AssetGenImage get crownTitle =>
      const AssetGenImage('assets/netflix_clone/crown_title.png');

  /// File path: assets/netflix_clone/dogs.jpg
  AssetGenImage get dogs =>
      const AssetGenImage('assets/netflix_clone/dogs.jpg');

  /// File path: assets/netflix_clone/explained.jpg
  AssetGenImage get explained =>
      const AssetGenImage('assets/netflix_clone/explained.jpg');

  /// File path: assets/netflix_clone/htsdof.jpg
  AssetGenImage get htsdof =>
      const AssetGenImage('assets/netflix_clone/htsdof.jpg');

  /// File path: assets/netflix_clone/kakegurui.jpg
  AssetGenImage get kakegurui =>
      const AssetGenImage('assets/netflix_clone/kakegurui.jpg');

  /// File path: assets/netflix_clone/netflix_logo0.png
  AssetGenImage get netflixLogo0 =>
      const AssetGenImage('assets/netflix_clone/netflix_logo0.png');

  /// File path: assets/netflix_clone/netflix_logo1.png
  AssetGenImage get netflixLogo1 =>
      const AssetGenImage('assets/netflix_clone/netflix_logo1.png');

  /// File path: assets/netflix_clone/sintel.jpg
  AssetGenImage get sintel =>
      const AssetGenImage('assets/netflix_clone/sintel.jpg');

  /// File path: assets/netflix_clone/sintel_title.png
  AssetGenImage get sintelTitle =>
      const AssetGenImage('assets/netflix_clone/sintel_title.png');

  /// File path: assets/netflix_clone/stranger_things.jpg
  AssetGenImage get strangerThings =>
      const AssetGenImage('assets/netflix_clone/stranger_things.jpg');

  /// File path: assets/netflix_clone/teotfw.jpg
  AssetGenImage get teotfw =>
      const AssetGenImage('assets/netflix_clone/teotfw.jpg');

  /// File path: assets/netflix_clone/thirteen_reasons_why.jpg
  AssetGenImage get thirteenReasonsWhy =>
      const AssetGenImage('assets/netflix_clone/thirteen_reasons_why.jpg');

  /// File path: assets/netflix_clone/tiger_king.jpg
  AssetGenImage get tigerKing =>
      const AssetGenImage('assets/netflix_clone/tiger_king.jpg');

  /// File path: assets/netflix_clone/umbrella_academy.jpg
  AssetGenImage get umbrellaAcademy =>
      const AssetGenImage('assets/netflix_clone/umbrella_academy.jpg');

  /// File path: assets/netflix_clone/umbrella_academy_title.png
  AssetGenImage get umbrellaAcademyTitle =>
      const AssetGenImage('assets/netflix_clone/umbrella_academy_title.png');

  /// File path: assets/netflix_clone/violet_evergarden.jpg
  AssetGenImage get violetEvergarden =>
      const AssetGenImage('assets/netflix_clone/violet_evergarden.jpg');

  /// File path: assets/netflix_clone/witcher.jpg
  AssetGenImage get witcher =>
      const AssetGenImage('assets/netflix_clone/witcher.jpg');
}

class Assets {
  Assets._();

  static const SvgGenImage bobStudy = SvgGenImage('assets/bob_study.svg');
  static const SvgGenImage listeningIllustration =
      SvgGenImage('assets/listening_illustration.svg');
  static const $AssetsNetflixCloneGen netflixClone = $AssetsNetflixCloneGen();
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

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
