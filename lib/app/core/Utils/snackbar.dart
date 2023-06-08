import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:Monarch/app/core/commons.dart';

Future<T?> showSnackbar<T>(
    BuildContext context, {
      SnackbarType type = SnackbarType.success,
      String? title,
      IconData? icon,
      Widget? iconWidget,
      bool hideIcon = false,
      bool hideTitle = false,
      Color? titleColor,
      String? message,
      Widget? messageWidget,
      String? actionLabel,
      VoidCallback? onActionPressed,
      void Function(FlushbarStatus?)? onStatusChanged,
    }) async =>
    _showSnackbar(
      context,
      type: type,
      title: title,
      icon: icon,
      iconWidget: iconWidget,
      hideIcon: hideIcon,
      hideTitle: hideTitle,
      titleColor: titleColor,
      message: message,
      messageWidget: messageWidget,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      onStatusChanged: onStatusChanged,
    );

Future<T?> _showSnackbar<T>(
    BuildContext context, {
      required SnackbarType type,
      String? title,
      IconData? icon,
      Widget? iconWidget,
      bool hideIcon = false,
      bool hideTitle = false,
      Color? titleColor,
      String? message,
      Widget? messageWidget,
      String? actionLabel,
      VoidCallback? onActionPressed,
      void Function(FlushbarStatus?)? onStatusChanged,
    }) async {
  final data = _mapSnackbarTypeToData(type);

  return Flushbar<T>(
    margin: const EdgeInsets.all(
      Commons.baseMargin,
    ),
    borderRadius: Commons.borderRadius,
    backgroundColor: Theme.of(context).cardColor,
    duration: const Duration(seconds: 3),
    boxShadows: [Commons.shadow()],
    titleText: hideTitle
        ? null
        : Row(
      children: [
        if (!hideIcon) ...[
          iconWidget ??
              Icon(
                icon ?? data.icon,
                size: Commons.baseMargin * 2.5,
                color: titleColor ?? data.color,
              ),
          horizontalSpaceTiny,
        ],
        Text(
          title ?? data.title,
          style: TextStyle(
            color: titleColor ?? data.color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    messageText: messageWidget ??
        Text(
          message ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
    onStatusChanged: onStatusChanged,
  ).show(context);
}

SnackbarData _mapSnackbarTypeToData(SnackbarType type) {
  switch (type) {
    case SnackbarType.success:
      return const SnackbarData(
        title: 'Success!',
        icon: PhosphorIcons.checkCircleFill,
        color: Colors.green,
      );

    case SnackbarType.error:
      return const SnackbarData(
        title: 'Error!',
        icon: PhosphorIcons.xCircleFill,
        color: Colors.red,
      );

    case SnackbarType.info:
      return const SnackbarData(
        title: 'Info!',
        icon: PhosphorIcons.infoFill,
        color: Colors.blue,
      );

    case SnackbarType.warning:
      return const SnackbarData(
        title: 'Warning!',
        icon: PhosphorIcons.warningFill,
        color: Colors.amber,
      );
  }
}

enum SnackbarType { success, error, info, warning }

class SnackbarData {
  const SnackbarData({
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
  final IconData icon;
  final Color color;
}
