
import 'package:wine_app/models/wine_model.dart';
import 'package:wine_app/resources/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future <dynamic> fetchWineList() {
    return _provider.fetchWineList();
  }
}

class NetworkError extends Error {}