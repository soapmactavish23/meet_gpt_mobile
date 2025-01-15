// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';

// ignore: must_be_immutable
abstract class AppBarCustom extends AppBar {
  AppBarCustom({super.key});

  static getDefaultExitOnly({
    required String title,
    List<Widget>? actions,
    required BuildContext context,
  }) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
      ),
      actions: [
        IconButton(
          onPressed: () async {},
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static getDefault({
    required String title,
    List<Widget>? actions,
    required BuildContext context,
  }) {
    return AppBar(
      title: Text(
        title,
      ),
      actions: [
        ...actions ?? [],
      ],
    );
  }
}
