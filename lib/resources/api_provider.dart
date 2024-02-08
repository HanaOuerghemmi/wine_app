import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:wine_app/models/wine_model.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl = "https://api.sampleapis.com/wines/reds";

  Future <dynamic> fetchWineList() async {
    print('+++++ api provider +++');
    final response = await client.get(Uri.parse(_baseUrl)); 
    print('+++++ response+++' + response.statusCode.toString());

    if (response.statusCode == 200) {
  List<WineModel> wines = (jsonDecode(response.body) as List)
    .map((item) => WineModel.fromJson(item))
    .toList();
    return wines;
     
    } else {
      throw Exception('Failed to load ');
    }
  }
}
