
import 'package:flutter/material.dart';

import '../data/album.dart';

class AlbumCellWidget extends StatelessWidget {
  Album album;

  AlbumCellWidget({required this.album}) : super(key: const Key("album item"));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(album.title.toString()),
        ),
      ),
    );
  }
}