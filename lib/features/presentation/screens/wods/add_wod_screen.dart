
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfitbro/features/auth/domain/entities/category_entity.dart';


const Map<String, Categories> _categories = <String, Categories>{
  'c1': Categories(
    category: 'EMOM',
  ),
  'c2': Categories(
    category: 'AMRAP'
  ),
};

class AddWodScreen extends StatelessWidget {
  const AddWodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root of add your wod - 1 screen'),
      ),
      body: 
        ListView(
        children: <Widget>[
          for (final MapEntry<String, Categories> entry in _categories.entries)
            ListTile(
              title: Text(entry.value.category),
              onTap: () => context.go('/c/new/${entry.key}'),
            )
        ],
      ),
      );
      
  }
}