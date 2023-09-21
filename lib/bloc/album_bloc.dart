import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

import '../data/album.dart';
import '../services/album_service.dart';

part 'album_event.dart';

part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  InternetConnectionChecker internetConnectionChecker;
  AlbumService albumService;

  AlbumBloc({required this.albumService, required this.internetConnectionChecker})
      : super(AlbumInitialState()) {
    on<AlbumEvent>((event, emit) async {
      final connectionStatus = await internetConnectionChecker.connectionStatus;
      if (connectionStatus == InternetConnectionStatus.connected) {
        emit(AlbumLoadingState());
        final response = await albumService.getAlbums();
        if (response.statusCode == 200) {
          List<Album> albumList = List.empty(growable: true);
          List<Album>? mList = response.body?.map((job) => Album.fromJson(job)).toList();
          albumList.addAll(mList ?? List.empty());
          emit(AlbumSuccessState(list: albumList));
        } else {
          if (response.statusCode == 400) {
            emit(AlbumErrorState(errorCode: 200, errorMessage: " Internet Available"));
          }
        }
      } else {
        emit(AlbumErrorState(errorCode: 200, errorMessage: " Internet Available"));
      }
    });
  }
}
