import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

import '../../services/isar/isar_service.dart';

class BaseRepository<CollectionType> {
  ProviderRef ref;
  late Future<Isar> isar;

  BaseRepository(this.ref) {
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

  getById(Id id) async {
    final db = await isar;
    return db.collection<CollectionType>().get(id);
  }

  Future<int> save(CollectionType collection) async {
    final db = await isar;
    return db.writeTxn<int>(() {
      return db.collection<CollectionType>().put(collection);
    });
  }

  Future<void> delete(Id id) async {
    final db = await isar;
    db.writeTxn(() {
      return db.collection<CollectionType>().delete(id);
    });
  }
}
