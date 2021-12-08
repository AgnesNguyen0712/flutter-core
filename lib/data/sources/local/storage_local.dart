import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageLocal {

}

class StorageLocalImpl extends StorageLocal {
  final SharedPreferences sharedPreferences;

  StorageLocalImpl(this.sharedPreferences);


}