import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/routine.dart';

part 'profile.g.dart';

@Collection()
class Profile {
  Id id = Isar.autoIncrement;
  String name;
  String email;

  final routines = IsarLinks<Routine>();

  Profile({
    required this.name,
    required this.email,
  });
}
