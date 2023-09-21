// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$AlbumService extends AlbumService {
  _$AlbumService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AlbumService;

  @override
  Future<Response<List<dynamic>>> getAlbums() {
    final Uri $url = Uri.parse('/albums');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<dynamic>, List<dynamic>>($request);
  }
}
