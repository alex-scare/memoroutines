import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memoroutines/services/logger/dev_logger.dart';
import 'package:memoroutines/shared/models/completion.dart';

import 'base_repository.dart';

class CompletionsRepository extends BaseRepository<Completion> {
  final _log = DevLogger('completions_repo');
  CompletionsRepository(ProviderRef ref) : super(ref);

  // Marks a completion as completed
  Future<void> complete(Completion completion) async {
    final db = await isar;
    await db.writeTxn(() async {
      completion.status = CompletionStatus.completed;
      completion.actionedAt = DateTime.now();
      await db.completions.put(completion);
    });
  }

  // Marks a completion as missed
  Future<void> miss(Completion completion) async {
    final db = await isar;
    await db.writeTxn(() async {
      completion.status = CompletionStatus.missed;
      completion.actionedAt = DateTime.now();
      await db.completions.put(completion);
    });
  }
}

final completionsPod = Provider((ref) => CompletionsRepository(ref));
