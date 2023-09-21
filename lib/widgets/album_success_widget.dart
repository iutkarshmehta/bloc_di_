import 'package:flutter/material.dart';

import '../data/album.dart';
import 'album_cell_widget.dart';

class AlbumSuccessWidget extends StatefulWidget {
  final List<Album> albumList;

  AlbumSuccessWidget({required this.albumList}) : super(key: const Key("album list"));

  @override
  State<AlbumSuccessWidget> createState() => _AlbumSuccessWidgetState();
}

class _AlbumSuccessWidgetState extends State<AlbumSuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.albumList.length,
      itemBuilder: (context, index) {
        return AlbumCellWidget(album: widget.albumList[index]);
      },
    );
  }
}