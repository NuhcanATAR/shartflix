import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/product/extension/dynamic_extension.dart';
import 'package:shartflix/product/util/util.dart';

enum SnackType {
  success(Color(0xff328048), "Başarılı", Icons.check_circle),
  warning(Color(0xffFD9D42), "Uyarı", Icons.warning_rounded),
  error(Color(0xffB42318), "Hatalı", Icons.error);

  final Color color;
  final String message;
  final IconData icon;
  const SnackType(this.color, this.message, this.icon);
}

class CodeNoahDialogs {
  final BuildContext context;

  CodeNoahDialogs(this.context);

  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnack(SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _onFlushPressed(Flushbar? flushbar, bool showing) async {
    if (showing) {
      await flushbar?.dismiss(true);
      return;
    } else {
      return;
    }
  }

  Future<void> showFlush({String? message, required SnackType type}) async {
    Flushbar? flushbar;
    bool showing = false;
    flushbar = Flushbar(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      icon: Icon(type.icon, color: type.color, size: 42),
      borderRadius: BorderRadius.circular(10),
      messageText: Text(
        message ?? type.message,
        style: const TextStyle(color: BaseUtility.black),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.12),
          offset: const Offset(4, 4),
          blurRadius: 12,
        ),
      ],
      isDismissible: true,
      duration: const Duration(milliseconds: 2000),
      backgroundColor: BaseUtility.white,
      mainButton: IconButton(
        onPressed: () async => await _onFlushPressed(flushbar, showing),
        icon: const Icon(Icons.clear),
      ),
      onStatusChanged: (status) {
        if (status == FlushbarStatus.IS_APPEARING ||
            status == FlushbarStatus.SHOWING) {
          showing = true;
        } else {
          showing = false;
        }
      },
    );

    await flushbar.show(context);
  }

  void showModalBottom(
    Widget child, {
    Color? backgroundColor,
    Color? barrierColor,
    DynamicViewExtensions? dynamicViewExtensions,
    double? barHeight,
    String? appbarText,
  }) {
    showModalBottomSheet(
      context: context,
      barrierColor: barrierColor ?? Colors.transparent,
      builder:
          (context) => SizedBox(
            height:
                dynamicViewExtensions != null
                    ? dynamicViewExtensions.dynamicHeight(
                      context,
                      barHeight ?? 0.0,
                    )
                    : 80,
            child: child,
          ),
      backgroundColor: backgroundColor ?? Colors.transparent,
    );
  }

  Future<T?> showAlert<T extends Object?>(Widget child) {
    return showDialog<T>(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            content: child,
          ),
    );
  }
}
