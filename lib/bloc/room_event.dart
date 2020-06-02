part of 'room_bloc.dart';

@immutable
abstract class RoomEvent extends Equatable {
  RoomEvent([List props = const []]) : super(props);
}

class GetTemperature extends RoomEvent {
  final String temperature;
  GetTemperature(this.temperature) : super([temperature]);
}

class GetGas extends RoomEvent {
  final String gas;
  GetGas(this.gas) : super([gas]);
}

class GetFire extends RoomEvent {
  final String fire;
  GetFire(this.fire) : super([fire]);
}
