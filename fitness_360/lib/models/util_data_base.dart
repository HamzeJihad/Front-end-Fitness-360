import 'package:get/get.dart';
import 'package:fitness_360/models/config_database.dart';
import 'package:sembast/sembast.dart';

mixin UtilDataBase {
  var store = StoreRef.main();

  Database get getDb {
    if (Get.find<ConfigDatabase>().db == null) {
      Get.find<ConfigDatabase>().initDatabase(success: () {
        return Get.find<ConfigDatabase>().db!;
      });
      return Get.find<ConfigDatabase>().db!;
    } else {
      return Get.find<ConfigDatabase>().db!;
    }
  }

  Future<dynamic> inserirNoBancoBoolean(String key, bool object, [bool merge = true]) {
    return store.record(key).put(getDb, object, merge: merge).then((value) => value);
  }

  Future<bool?> buscarNoBancoBoolean(String key) async {
    if (Get.find<ConfigDatabase>().db == null) {
      await Get.find<ConfigDatabase>().initDatabase();
    }
    return store.record(key).get(getDb).then((value) => value).then((value) => value as bool?);
  }
}
