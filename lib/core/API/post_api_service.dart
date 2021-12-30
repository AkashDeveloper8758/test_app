import 'dart:convert';

// import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

// part 'post_api_service.chopper.dart';

class ApiClient {
  final http.Client _client;
  ApiClient(this._client);

  dynamic getPost({int offset = 0}) async {
    try {
      var url = Uri.parse(
          'https://breakingbadapi.com/api/characters?limit=10&offset=$offset');
      final response = await _client.get(url, headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        // print('response status : ${response.statusCode}');
        return responseBody;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (err) {
      print('error on fetch: $err');
    }
  }

  closeApiClient() {
    _client.close();
    print('api client close');
  }
}

// @ChopperApi()
// abstract class PostApiService extends ChopperService {
//   @Get(path: '&offset={offset}', headers: {'Content-Type': 'application/json'})
//   Future<Response> getPosts(@Path('offset') int offset);

//   @Get(headers: {'Content-Type': 'application/json'})
//   Future<Response> getTodos();

//   static PostApiService create() {
//     final client = ChopperClient(
//       // baseUrl: 'https://jsonplaceholder.typicode.com/posts',
//       baseUrl: 'https://breakingbadapi.com/api/characters?limit=10',
//       services: [_$PostApiService()],
//       // converter: const JsonConverter(),
//       // errorConverter: JsonConverter(),
//     );
//     return _$PostApiService(client);
//   }
// }
