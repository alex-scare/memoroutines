import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

import '../../services/isar/isar_service.dart';

class BaseRepository {
  // ignore: unused_field
  late Future<Isar> isar;

  BaseRepository(ProviderRef ref) {
    isar = ref.read(isarPod.future);
  }
}
