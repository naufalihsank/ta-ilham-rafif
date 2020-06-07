import 'package:firebase_database/firebase_database.dart';

class DataResource {
  String key;
  dynamic value;

  DataResource(this.value);

  DataResource.fromSnapShot(DataSnapshot snapshot)
      : key = 'DataResource',
        value = snapshot.value;

  toJson() {
    return {
      "value": value,
    };
  }
}
