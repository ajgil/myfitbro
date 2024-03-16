import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
/// The first screen in the bottom navigation bar.
class ScreenA extends StatelessWidget {
  /// Constructs a [ScreenA] widget.
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).go('/a/details');
          },
          child: const Text('View A details'),
        ),
      ),
    );
  }
}