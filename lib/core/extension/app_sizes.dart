import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

extension AppSizeResponsive on num {
  double get getWidth => MediaQuery.sizeOf(navigatorKey.currentContext!).width;
  double get getHeight =>
      MediaQuery.sizeOf(navigatorKey.currentContext!).height;
  Widget get h => SizedBox(height: getHeight * (this / 844));
  Widget get w => SizedBox(width: getWidth * (this / 390));
}

extension FontExtension on num {
  double get sp {
    final context = navigatorKey.currentContext;
    double width;

    if (context != null) {
      width = MediaQuery.sizeOf(context).width;
    } else {
      final window = WidgetsBinding.instance.platformDispatcher.views.first;
      width = window.physicalSize.width / window.devicePixelRatio;
    }

    final scale = width / 300;
    return (this * scale).clamp(this * 0.9, this * 1.15);
  }
}

extension AppSizes on BuildContext {
  double get getWidth => MediaQuery.sizeOf(this).width;
  double get getHeight => MediaQuery.sizeOf(this).height;
  double get availableHeight {
    final appBarHeight = kToolbarHeight;
    final statusBarHeight = MediaQuery.of(this).padding.top;
    return getHeight - appBarHeight - statusBarHeight;
  }

  bool get isSmallScreen => getHeight < 690;

  SizedBox addHorizontalSpace(double value) {
    return SizedBox(width: getWidth * (value / 390));
  }

  SizedBox addVerticalSpace(double value) {
    return SizedBox(height: getHeight * (value / 844));
  }

  double width(double value) {
    return getWidth * (value / 390);
  }

  double height(double value) {
    return getHeight * (value / 844);
  }

  EdgeInsets spaceAroundAll(double value) {
    return EdgeInsets.all(value);
  }

  EdgeInsets spaceHorizontal(double value) {
    return EdgeInsets.symmetric(horizontal: getWidth * (value / 360));
  }

  EdgeInsets spaceVertical(double value) {
    return EdgeInsets.symmetric(vertical: getHeight * (value / 800));
  }

  EdgeInsets spaceSymmetric({
    required double vertical,
    required double horizontal,
  }) {
    return EdgeInsets.symmetric(
      horizontal: getWidth * (horizontal / 360),
      vertical: getHeight * (vertical / 800),
    );
  }

  EdgeInsets fromLTRB({
    required double left,
    required double top,
    required double right,
    required double bottom,
  }) {
    return EdgeInsets.fromLTRB(
      getWidth * (left / 360),
      getHeight * (top / 800),
      getWidth * (right / 360),
      getHeight * (bottom / 800),
    );
  }

  EdgeInsetsDirectional spaceTop(double value) {
    return EdgeInsetsDirectional.only(top: getHeight * (value / 800));
  }

  EdgeInsetsDirectional spaceBottom(double value) {
    return EdgeInsetsDirectional.only(bottom: getHeight * (value / 800));
  }

  EdgeInsetsDirectional spaceStart(double value) {
    return EdgeInsetsDirectional.only(start: getWidth * (value / 360));
  }

  EdgeInsetsDirectional spaceEnd(double value) {
    return EdgeInsetsDirectional.only(end: getWidth * (value / 360));
  }

  BorderRadius circularRadius(double value) {
    return BorderRadius.circular(value);
  }

  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;
}

extension LayoutExtensions on Widget {
  Widget pad([double value = 8.0]) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget padTop([double value = 8.0]) => Padding(
    padding: EdgeInsets.only(top: value),
    child: this,
  );
  Widget padStart([double value = 8.0]) => Padding(
    padding: EdgeInsets.only(left: value),
    child: this,
  );

  Widget padEnd([double value = 20]) => Padding(
    padding: EdgeInsets.only(right: value),
    child: this,
  );
  Widget padBottom([double value = 8.0]) => Padding(
    padding: EdgeInsets.only(bottom: value),
    child: this,
  );
  Widget center() => Center(child: this);
  Widget contains() => Container(color: Colors.red, child: this);
  Widget padSymmetricHorizon(double value) => Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: value),
    child: this,
  );
  Widget padSymmetricVert(double value) => Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: value),
    child: this,
  );
}
