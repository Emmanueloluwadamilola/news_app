
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends CustomProvider> extends StatelessWidget {
  const ProviderWidget({
    required this.provider,
    required this.children,
    this.horizPadding = 20,
    this.vertPadding = 20,
    this.lazy,
    this.resizeInsets,
    super.key,
    this.canPop = true,
    this.topSafeArea = true,
    this.onPop,
    this.bottomSheet,
    this.floatingActionButton,
  });

  final List<Widget> Function(T, ThemeData) children;

  final double horizPadding;
  final double vertPadding;

  final bool? lazy;
  final bool? resizeInsets;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;

  final bool canPop;
  final bool topSafeArea;

  final void Function(bool)? onPop;

  final T provider;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: onPop,
      child: ChangeNotifierProvider(
        create: (BuildContext context) => provider,
        lazy: lazy,
        child: Consumer<T>(builder: (_, provider, __) {
          return Scaffold(
            resizeToAvoidBottomInset: resizeInsets,
            body: SafeArea(
              top: topSafeArea,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizPadding, vertical: vertPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children(provider, Theme.of(context)),
                ),
              ),
            ),
            bottomNavigationBar: bottomSheet,
            floatingActionButton: floatingActionButton,
          );
        }),
      ),
    );
  }
}

class ConsumerWidget<T extends CustomProvider> extends StatelessWidget {
  final List<Widget> Function(T, ThemeData) children;

  final double padding;
  final bool? resizeInsets;
  final T provider;
  final bool canPop;
  final void Function(bool)? onPop;

  const ConsumerWidget({
    super.key,
    required this.children,
    this.padding = 20,
    this.resizeInsets,
    required this.provider,
    this.canPop = true,
    this.onPop,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: onPop,
      child: Consumer<T>(
        builder: (_, provider, __) {
          return Scaffold(
            resizeToAvoidBottomInset: resizeInsets,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children(provider, Theme.of(context)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
