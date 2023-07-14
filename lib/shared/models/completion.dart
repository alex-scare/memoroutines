import 'package:isar/isar.dart';
import 'package:memoroutines/shared/models/routine.dart';

part 'completion.g.dart';

@Collection()
class Completion {
  Id id = Isar.autoIncrement;
  DateTime completedAt;

  @Backlink(to: 'completions')
  final routine = IsarLink<Routine>();

  Completion({
    required this.completedAt,
  });
}
