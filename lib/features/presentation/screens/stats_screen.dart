import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfitbro/features/auth/domain/entities/family_entity.dart';
import 'package:myfitbro/features/auth/domain/entities/person_entity.dart';




const Map<String, Family> _families = <String, Family>{
  'f1': Family(
    name: 'Doe',
    people: <String, Person>{
      'p1': Person(name: 'Jane'),
      'p2': Person(name: 'John'),
    },
  ),
  'f2': Family(
    name: 'Wong',
    people: <String, Person>{
      'p1': Person(name: 'June'),
      'p2': Person(name: 'Xin'),
    },
  ),
};

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          for (final MapEntry<String, Family> entry in _families.entries)
            ListTile(
              title: Text(entry.value.name),
              onTap: () => context.go('/family/${entry.key}'),
            )
        ],
      ),
    );
  }
}