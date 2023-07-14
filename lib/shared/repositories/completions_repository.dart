import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/shared/models/completion.dart';

import 'base_repository.dart';

class CompletionsRepository extends BaseRepository<Completion> {
  CompletionsRepository(ProviderRef ref) : super(ref);
}

final routinesPod = Provider((ref) => CompletionsRepository(ref));
