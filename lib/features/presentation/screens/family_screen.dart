import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfitbro/features/auth/domain/entities/family_entity.dart';
import 'package:myfitbro/features/auth/domain/entities/item_entity.dart';
import 'package:myfitbro/features/auth/domain/entities/person_entity.dart';
import 'package:myfitbro/features/presentation/screens/wods/forms/add_form.dart';

const Map<String, Family> _families = <String, Family>{
  'c1': Family(
    name: 'EMOM',
    people: <String, Person>{
      'p1': Person(name: 'Jane'),
      'p2': Person(name: 'John'),
    },
  ),
  'c2': Family(
    name: 'AMRAP',
    people: <String, Person>{
      'p1': Person(name: 'June'),
      'p2': Person(name: 'Xin'),
    },
  ),
};

const Map<String, Items> _items = <String, Items>{
  '1': Items(
    item: 'squats',
  ),
  '2': Items(
    item: 'pistol',
  ),
};

/// The screen that shows a list of persons in a family.
class FamilyScreen extends StatelessWidget {
  /// Creates a [FamilyScreen].
  const FamilyScreen(
      {required this.fid,
      required this.category,
      required this.asc,
      super.key});

  /// The family to display.
  final String fid;
  final String category;

  /// Whether to sort the name in ascending order.
  final bool asc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('add your wod - 2 screen $category'), //_families[fid]!.name),
      ),
      body: ListView(
        children: <Widget>[
          for (final MapEntry<String, Items> entry in _items.entries)
            ListTile(
              title: Text(entry.value.item),
              onTap: () => showModalBottomSheet(
                  //isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (_) {
                    return AddItem();
                  }),
            )
        ],
      ),
    );
  }
}
