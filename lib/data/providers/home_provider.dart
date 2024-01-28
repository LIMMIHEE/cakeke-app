import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class HomeProvider {
  final client = ApiClient.client;

  Future<List<Store>> getNewStoreList() async {
    try {
      final response = await client.dio.fetch(client.clientOptions(
        'GET',
        '/stores/new/all',
      ));
      return response.data!
          .map<Store>((dynamic i) => Store.fromJson(i as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Store>> getPopularStore() async {
    final queryParameters = {
      "latitude": "37.5665",
      "longitude": "126.9780",
    };
    try {
      // final response = await client.dio.fetch(client.clientOptions(
      //     'GET', '/stores/rankings',
      //     queryParameters: queryParameters));
      final response = await client.dio.fetch(client.clientOptions(
        'GET',
        '/stores/new/all',
      ));
      return response.data!
          .map<Store>((dynamic i) => Store.fromJson(i as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
