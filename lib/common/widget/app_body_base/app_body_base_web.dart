// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

class AppBodyBaseWeb extends StatelessWidget {
  const AppBodyBaseWeb({
    super.key,
    this.headerWidget,
    this.bodyWidget,
    this.footerWidget,
  });
  final Widget? headerWidget;
  final Widget? bodyWidget;
  final Widget? footerWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (headerWidget == null) const SizedBox.shrink() else headerWidget!,
          if (bodyWidget == null) const SizedBox.shrink() else Expanded(child: bodyWidget!),
          if (footerWidget == null) const SizedBox.shrink() else footerWidget!,
        ],
      ),
    );
  }
}
