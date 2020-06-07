import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:firebase_database/firebase_database.dart';

class Room extends Equatable {
  final double temperature;
  final bool fire;
  final double gas;

  Room({
    @required this.temperature,
    @required this.fire,
    @required this.gas
  }) : super([temperature, fire, gas]);
}
