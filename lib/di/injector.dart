import 'package:get_it/get_it.dart';
import 'package:getit_bloc_example/bloc/album_bloc.dart';
import 'package:getit_bloc_example/services/album_service.dart';
import 'package:getit_bloc_example/services/chopper_client.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

getItInitialize() async {
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  final client = ChopperClientCustom.createChopperClient();
  final albumService = AlbumService.create(client);
  getIt.registerLazySingleton(() => albumService);
  getIt.registerLazySingleton<AlbumBloc>(() => AlbumBloc(albumService: getIt(), internetConnectionChecker: getIt()));
}
