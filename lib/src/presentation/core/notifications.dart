import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'screen_sizes.dart';

const double smallNotificationWidth = 300;
const Duration notificationDuration = Duration(seconds: 3);

class NotificationHelper {
  Flushbar error({
    required String message,
    required NotificationConfig config,
    required BuildContext context,
  }) {
    final isPhone = isPhoneSize(MediaQuery.of(context).size);
    final width = isPhone ? null : smallNotificationWidth;
    return Flushbar<dynamic>(
      message: message,
      title: config?.title,
      titleText: config?.titleText,
      backgroundColor: config?.backgroundColor,
      leftBarIndicatorColor: config?.leftBarIndicatorColor,
      boxShadows: config?.boxShadows,
      backgroundGradient: config?.backgroundGradient,
      icon: config?.icon ??
          Icon(
            Icons.warning,
            size: 28.0,
            color: Theme.of(context).colorScheme.error,
          ),
      shouldIconPulse: config?.shouldIconPulse,
      duration: config?.duration ?? notificationDuration,
      isDismissible: config?.isDismissible,
      maxWidth: config?.maxWidth ?? width,
      margin: config?.margin,
      padding: config?.padding,
      borderRadius: config?.borderRadius,
      borderColor: config?.borderColor,
      borderWidth: config?.borderWidth,
      flushbarPosition:
          isPhone ? FlushbarPosition.BOTTOM : FlushbarPosition.TOP,
      dismissDirection: config?.dismissDirection,
      flushbarStyle: FlushbarStyle.GROUNDED,
      forwardAnimationCurve: config?.forwardAnimationCurve,
      reverseAnimationCurve: config?.reverseAnimationCurve,
      animationDuration: config?.animationDuration,
      barBlur: config?.barBlur,
      blockBackgroundInteraction: config?.blockBackgroundInteraction,
      routeBlur: config?.routeBlur,
      routeColor: config?.routeColor,
    );
  }

  static Flushbar success({
    required String message,
    required NotificationConfig config,
    required BuildContext context,
  }) {
    final isPhone = isPhoneSize(MediaQuery.of(context).size);
    final width = isPhone ? null : smallNotificationWidth;
    return Flushbar<dynamic>(
      message: message,
      title: config?.title,
      titleText: config?.titleText,
      backgroundColor: config?.backgroundColor,
      leftBarIndicatorColor: config?.leftBarIndicatorColor,
      boxShadows: config?.boxShadows,
      backgroundGradient: config?.backgroundGradient,
      icon: config?.icon ??
          Icon(
            Icons.check_circle,
            color: Colors.green[300],
          ),
      shouldIconPulse: config?.shouldIconPulse,
      duration: config?.duration ?? notificationDuration,
      isDismissible: config?.isDismissible,
      maxWidth: config?.maxWidth ?? width,
      margin: config?.margin,
      padding: config?.padding,
      borderRadius: config?.borderRadius,
      borderColor: config?.borderColor,
      borderWidth: config?.borderWidth,
      flushbarPosition:
          isPhone ? FlushbarPosition.BOTTOM : FlushbarPosition.TOP,
      dismissDirection: config?.dismissDirection,
      flushbarStyle: FlushbarStyle.GROUNDED,
      forwardAnimationCurve: config?.forwardAnimationCurve,
      reverseAnimationCurve: config?.reverseAnimationCurve,
      animationDuration: config?.animationDuration,
      barBlur: config?.barBlur,
      blockBackgroundInteraction: config?.blockBackgroundInteraction,
      routeBlur: config?.routeBlur,
      routeColor: config?.routeColor,
    );
  }
}

class NotificationConfig {
  /// The title displayed to the user
  final String title;

  /// Replaces [title]. Although this accepts a [Widget], it is meant to receive [Text] or [RichText]
  final Widget titleText;

  /// Will be ignored if [backgroundGradient] is not null
  final Color backgroundColor;

  /// If not null, shows a left vertical bar to better indicate the humor of the notification.
  /// It is not possible to use it with a [Form] and I do not recommend using it with [LinearProgressIndicator]
  final Color leftBarIndicatorColor;

  /// [boxShadows] The shadows generated by Flushbar. Leave it null if you don't want a shadow.
  /// You can use more than one if you feel the need.
  /// Check (this example)[https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/shadows.dart]
  final List<BoxShadow> boxShadows;

  /// Makes [backgroundColor] be ignored.
  final Gradient backgroundGradient;

  /// You can use any widget here, but I recommend [Icon] or [Image] as indication of what kind
  /// of message you are displaying. Other widgets may break the layout
  final Widget icon;

  /// An option to animate the icon (if present). Defaults to true.
  final bool shouldIconPulse;

  /// How long until Flushbar will hide itself (be dismissed). To make it indefinite, leave it null.
  final Duration duration;

  /// Determines if the user can swipe or click the overlay (if [routeBlur] > 0) to dismiss.
  /// It is recommended that you set [duration] != null if this is false.
  /// If the user swipes to dismiss or clicks the overlay, no value will be returned.
  final bool isDismissible;

  /// Used to limit Flushbar width (usually on large screens)
  final double maxWidth;

  /// Adds a custom margin to Flushbar
  final EdgeInsets margin;

  /// Adds a custom padding to Flushbar
  /// The default follows material design guide line
  final EdgeInsets padding;

  /// Adds a radius to all corners of Flushbar. Best combined with [margin].
  /// I do not recommend using it with [showProgressIndicator] or [leftBarIndicatorColor].
  final double borderRadius;

  /// Adds a border to every side of Flushbar
  /// I do not recommend using it with [showProgressIndicator] or [leftBarIndicatorColor].
  final Color borderColor;

  /// Changes the width of the border if [borderColor] is specified
  final double borderWidth;

  /// Flushbar can be based on [FlushbarPosition.TOP] or on [FlushbarPosition.BOTTOM] of your screen.
  /// [FlushbarPosition.BOTTOM] is the default.
  final FlushbarPosition flushbarPosition;

  /// [FlushbarDismissDirection.VERTICAL] by default.
  /// Can also be [FlushbarDismissDirection.HORIZONTAL] in which case both left and right dismiss are allowed.
  final FlushbarDismissDirection dismissDirection;

  /// Flushbar can be floating or be grounded to the edge of the screen.
  /// If grounded, I do not recommend using [margin] or [borderRadius]. [FlushbarStyle.FLOATING] is the default
  /// If grounded, I do not recommend using a [backgroundColor] with transparency or [barBlur]
  final FlushbarStyle flushbarStyle;

  /// The [Curve] animation used when show() is called. [Curves.easeOut] is default
  final Curve forwardAnimationCurve;

  /// The [Curve] animation used when dismiss() is called. [Curves.fastOutSlowIn] is default
  final Curve reverseAnimationCurve;

  /// Use it to speed up or slow down the animation duration
  final Duration animationDuration;

  /// Default is 0.0. If different than 0.0, blurs only Flushbar's background.
  /// To take effect, make sure your [backgroundColor] has some opacity.
  /// The greater the value, the greater the blur.
  final double barBlur;

  /// Determines if user can interact with the screen behind it
  /// If this is false, [routeBlur] and [routeColor] will be ignored
  final bool blockBackgroundInteraction;

  /// Default is 0.0. If different than 0.0, creates a blurred
  /// overlay that prevents the user from interacting with the screen.
  /// The greater the value, the greater the blur.
  /// It does not take effect if [blockBackgroundInteraction] is false
  final double routeBlur;

  /// Default is [Colors.transparent]. Only takes effect if [routeBlur] > 0.0.
  /// Make sure you use a color with transparency here e.g. Colors.grey[600].withOpacity(0.2).
  /// It does not take effect if [blockBackgroundInteraction] is false
  final Color routeColor;

  const NotificationConfig({
    required this.title,
    required this.titleText,
    this.backgroundColor = const Color(0xFF303030),
    required this.leftBarIndicatorColor,
    required this.boxShadows,
    required this.backgroundGradient,
    required this.icon,
    this.shouldIconPulse = true,
    required this.duration,
    this.isDismissible = true,
    required this.maxWidth,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 0.0,
    required this.borderColor,
    this.borderWidth = 1.0,
    this.flushbarPosition = FlushbarPosition.BOTTOM,
    this.dismissDirection = FlushbarDismissDirection.VERTICAL,
    this.flushbarStyle = FlushbarStyle.GROUNDED,
    this.forwardAnimationCurve = Curves.easeOutCirc,
    this.reverseAnimationCurve = Curves.easeOutCirc,
    this.animationDuration = const Duration(seconds: 1),
    this.barBlur = 0.0,
    this.blockBackgroundInteraction = false,
    required this.routeBlur,
    required this.routeColor,
  });
}
