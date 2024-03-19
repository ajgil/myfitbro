import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WodScreen extends StatelessWidget {
  const WodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root of add workouts'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen add workout', style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/c/details');
              },
              child: const Text('View details'),
            ),
          ],
        ),
      ),
    );
  }
}