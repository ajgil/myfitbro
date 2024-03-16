import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
/// The third screen in the bottom navigation bar.
class ScreenC extends StatelessWidget {
  /// Constructs a [ScreenC] widget.
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).go('/c/details');
          },
          child: const Text('View C details'),
        ),
      ),
    );
  }
}