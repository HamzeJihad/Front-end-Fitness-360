// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class ConfigDatabase {
  final DatabaseFactory _dbFactory = databaseFactoryIo;

  Database? db;

  Database? get getDb => db;
  Future<void> initDatabase({Function? success}) async {
    try {
      if (kIsWeb) {
        db = await _dbFactory.openDatabase('test');
      } else {
        Directory appDocDirectory = await getApplicationDocumentsDirectory();
        await Directory('${appDocDirectory.path}/dir').create(recursive: true);
        var path = await getApplicationDocumentsDirectory();
        db = await _dbFactory.openDatabase('${path.path}/dbapp.fitness');
        success?.call();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
