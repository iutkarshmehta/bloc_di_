import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/album_bloc.dart';

class AlbumInitialStateWidget extends StatefulWidget {
  const AlbumInitialStateWidget() : super(key: const Key("initial widget"));

  @override
  State<AlbumInitialStateWidget> createState() => _AlbumInitialStateWidgetState();
}

class _AlbumInitialStateWidgetState extends State<AlbumInitialStateWidget> {
  late AlbumBloc albumCubit;

  @override
  void initState() {
    super.initState();
    albumCubit = BlocProvider.of<AlbumBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          albumCubit.add(GetAlbumEvent());
        },
        child: Text("Call API"),
      ),
    );
  }
}