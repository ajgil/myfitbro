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


/// The screen that shows a list of persons in a family.
class FamilyScreen extends StatelessWidget {
  /// Creates a [FamilyScreen].
  const FamilyScreen({required this.fid, required this.asc, super.key});

  /// The family to display.
  final String fid;

  /// Whether to sort the name in ascending order.
  final bool asc;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> newQueries;
    final List<String> names = _families[fid]!
        .people
        .values
        .map<String>((Person p) => p.name)
        .toList();
    names.sort();
    if (asc) {
      newQueries = const <String, String>{'sort': 'desc'};
    } else {
      newQueries = const <String, String>{'sort': 'asc'};
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_families[fid]!.name),
        actions: <Widget>[
          IconButton(
            onPressed: () => context.goNamed('family',
                pathParameters: <String, String>{'fid': fid},
                queryParameters: newQueries),
            tooltip: 'sort ascending or descending',
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          for (final String name in asc ? names : names.reversed)
            ListTile(
              title: Text(name),
            ),
        ],
      ),
    );
  }
}