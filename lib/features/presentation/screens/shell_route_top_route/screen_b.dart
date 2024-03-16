import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
/// The second screen in the bottom navigation bar.
class ScreenB extends StatelessWidget {
  /// Constructs a [ScreenB] widget.
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).go('/b/details');
          },
          child: const Text('View B details'),
        ),
      ),
    );
  }
}