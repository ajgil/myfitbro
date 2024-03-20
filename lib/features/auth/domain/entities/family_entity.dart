
import 'package:myfitbro/features/auth/domain/entities/person_entity.dart';

/// Family data class.
class Family {
  /// Create a family.
  const Family({required this.name, required this.people});

  /// The last name of the family.
  final String name;

  /// The people in the family.
  final Map<String, Person> people;
}

