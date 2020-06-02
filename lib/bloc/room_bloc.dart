import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ta_ilham_rafif/model/room.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  @override
  RoomState get initialState => RoomInitial();

  @override
  Stream<RoomState> mapEventToState(
    RoomEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
