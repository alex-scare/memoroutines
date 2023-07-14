import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

import '../../services/isar/isar_service.dart';

class BaseRepository<CollectionType> {
  late Future<Isar> isar;

  BaseRepository(ProviderRef ref) {
    isar = ref.read(isarPod.future);
  }

  Stream<List<CollectionType>> listenAll() async* {
    final db = await isar;

    yield* db.collection<CollectionType>().where().watch(fireImmediately: true);
  }

  Future<List<CollectionType>> getAll() async {
    final db = await isar;
    return db.collection<CollectionType>().where().findAll();
  }

  Future<int> save(CollectionType collection) async {
    final db = await isar;
    return db.writeTxnSync<int>(() {
      return db.collection<CollectionType>().putSync(collection);
    });
  }

  Future<void> delete(Id id) async {
    final db = await isar;
    db.writeTxnSync(() => db.collection<CollectionType>().deleteSync(id));
  }
}
