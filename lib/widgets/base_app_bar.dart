import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;
  final Color backgroundColor;

  @override
  final Size preferredSize;

  const BaseAppBar(
      {super.key,
      required this.title,
      this.centerTitle,
      required this.backgroundColor, this.automaticallyImplyLeading, this.preferredSize = const Size.fromHeight(kToolbarHeight)});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: title,
      centerTitle: centerTitle ?? true,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    );
  }
}
