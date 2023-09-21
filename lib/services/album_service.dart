import 'package:chopper/chopper.dart';

part 'album_service.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class AlbumService extends ChopperService{
  @Get(path: 'albums')
  Future<Response<List<dynamic>>> getAlbums();
  static AlbumService create([ChopperClient? client]) => _$AlbumService(client);
}