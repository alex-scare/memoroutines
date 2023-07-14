import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/shared/models/routine.dart';

import 'base_repository.dart';

class RoutinesRepository extends BaseRepository<Routine> {
  RoutinesRepository(ProviderRef ref) : super(ref);
}

final routinesPod = Provider((ref) => RoutinesRepository(ref));
