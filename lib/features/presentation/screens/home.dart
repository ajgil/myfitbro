import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The screen for /home
class Home extends StatelessWidget {
  /// Constructs a [Home] widget.
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            onPressed: () {
              GoRouter.of(context).push('/shell1');
            },
            child: const Text('push the same shell route /shell1'),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push('/shell2');
            },
            child: const Text('push the different shell route /shell2'),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push('/regular-route');
            },
            child: const Text('push the regular route /regular-route'),
          ),
        ],
      ),
    );
  }
}