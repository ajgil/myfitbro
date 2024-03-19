import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Widget for the root page for the first section of the bottom navigation bar.
class RootScreenA extends StatelessWidget {
  /// Creates a RootScreenA
  const RootScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root of home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen home', style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/details');
              },
              child: const Text('View details'),
            ),
          ],
        ),
      ),
    );
  }
}