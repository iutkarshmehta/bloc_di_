import 'package:flutter/material.dart';

import '../bloc/album_bloc.dart';
class AlbumErrorWidget extends StatelessWidget {
AlbumErrorState errorState;

AlbumErrorWidget({required this.errorState}) : super(key: const Key("error widget"));

@override
Widget build(BuildContext context) {
return Center(
child: Text(errorState.errorMessage),
);
}
}