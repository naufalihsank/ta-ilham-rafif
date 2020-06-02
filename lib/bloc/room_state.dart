part of 'room_bloc.dart';

@immutable
abstract class RoomState extends Equatable {
  RoomState([List props = const []]) : super(props);
}

class RoomInitial extends RoomState {}

class RoomLoading extends RoomState {}

class RoomLoaded extends RoomState {
  final Room room;

  RoomLoaded(this.room) : super([room]);
}
