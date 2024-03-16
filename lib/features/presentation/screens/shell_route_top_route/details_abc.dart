import 'package:flutter/material.dart';
/// The details screen for either the A, B or C screen.
class DetailsABCScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen].
  const DetailsABCScreen({
    required this.label,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Details for $label',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}