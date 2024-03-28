import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfitbro/features/presentation/widgets/shared/custom_list_card.dart';
import 'package:myfitbro/features/presentation/widgets/shared/custom_second_card.dart';

/// Widget for the root page for the first section of the bottom navigation bar.
class RootScreenA extends StatelessWidget {
  /// Creates a RootScreenA
  const RootScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Root of home MyFitBro'),
        ),
        body: const _ProfileView()
        /*
      Center(
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
      */
        );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text('Listado de workouts'),
          subtitle: Text('Tus workouts, hechos y por hacer'),
        ),
        SegmentedButton(
          segments: const [
            ButtonSegment(value: 'all', icon: Text('Todos')),
            ButtonSegment(value: 'completed', icon: Text('Hechos')),
            ButtonSegment(value: 'pending', icon: Text('Por hacer')),
          ],
          selected: const <String>{'all'},
          onSelectionChanged: (value) {},
        ),
        const SizedBox(height: 5),
        //Expanded(child: ListCardsScreen()),
        const SizedBox(height: 5),
        Expanded(child: CustomSecondCardsScreen()),
      ],
/*
        /// Listado de workouts en formato cards
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return SwitchListTile(
                  title: const Text('Juan carlos'),
                  value: true,
                  onChanged: (value) {});
            },
          ),
        ),
      */
    );
  }
}
