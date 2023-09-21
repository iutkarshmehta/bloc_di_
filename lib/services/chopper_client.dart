import 'package:chopper/chopper.dart';

class ChopperClientCustom{
  static ChopperClient createChopperClient(){
    final chopper = ChopperClient(
      baseUrl: Uri.parse('https://jsonplaceholder.typicode.com/'),
      services: [],
      converter: const JsonConverter(),
    );
        return chopper;
  }
}
