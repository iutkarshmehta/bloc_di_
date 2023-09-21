import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit_bloc_example/di/injector.dart';
import 'package:getit_bloc_example/widgets/album_error_widget.dart';
import 'package:getit_bloc_example/widgets/album_initial_state_widget.dart';
import 'package:getit_bloc_example/widgets/album_success_widget.dart';

import 'bloc/album_bloc.dart';

void main(){
  getItInitialize();
  getIt.allReady().then((value) =>
  runApp(MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AlbumBloc albumBloc = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => albumBloc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //bloc listener
              //bloc
              BlocBuilder<AlbumBloc, AlbumState>(
                bloc: albumBloc,
                builder: (context, state) {
                  if (state is AlbumInitialState) {
                    return AlbumInitialStateWidget();
                  } else if (state is AlbumSuccessState) {
                    return AlbumSuccessWidget(albumList: state.list);
                  } else if (state is AlbumErrorState) {
                    return AlbumErrorWidget(errorState: state);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}