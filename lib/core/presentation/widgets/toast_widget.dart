// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';

class ToastMessage {
  displayPopup(
      {required BuildContext context,
      required String text,
      VoidCallback? onPop,
      PopupType type = PopupType.success,
      MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start}) {
    var mounted = true;
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        popDialog() {
          mounted = false;
          if (onPop == null) {
            Navigator.pop(context);
          } else {
            onPop.call();
          }
        }

        var success = type == PopupType.success;
        return WillPopScope(
          onWillPop: () {
            mounted = false;
            if (onPop == null) {
              return Future.value(true);
            } else {
              onPop.call();
              return Future.value(false);
            }
          },
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TweenAnimationBuilder<double>(
                builder: (context, value, child) => Transform.translate(
                    offset: Offset(0, value), child: child!),
                duration: const Duration(seconds: 1),
                tween: Tween(begin: 24, end: 0),
                curve: Curves.bounceOut,
                onEnd: () async =>
                    await Future.delayed(const Duration(seconds: 2), () {
                  if (mounted) popDialog();
                }),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: type == PopupType.success ? blueColor : Colors.red,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            success
                                ? Icons.check_circle
                                : Icons.remove_circle_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: Text(
                              text,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: popDialog,
                              icon: const Icon(Icons.close, size: 12),
                              padding: const EdgeInsets.all(6),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
            ],
          ),
        );
      },
    );
  }
}

enum AppButtonState { idle, loading }

enum PopupType { success, failure }
