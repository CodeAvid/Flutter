import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:pin_put_example/models/contact.dart';
import 'package:pin_put_example/models/photo.dart';
import 'package:pin_put_example/services/api.dart';
import 'package:http/http.dart' as http;
// import 'packag';

class APIService {
  APIService(this.api);
  final API api;

  Future<List<Photo>> fetchPhotos(PageIndex index) async {
    final response = await http.get(api.pageUri(index));
    if (response.statusCode == 200) {
      String content = response.body;
      List collecton = json.decode(content);
      final List<Photo> _data =
          collecton.map((json) => Photo.fromJson(json)).toList();
      return _data;
    }
    print(
        'Request ${api.pageUri(PageIndex.page1)} failed\n ${response.statusCode} ${response.reasonPhrase} }}');
    throw response;
  }

  Future<List<Contact>> fetchContact() async {
    http.Response response = await http.get(api.contactUri());
    if (response.statusCode == 200) {
      String content = response.body;
      // List collection = jsonDecode(content);
      List<Contact> _contact = parseContact<Contact>(content);
      return _contact;
    }
    print(
        'Request ${api.contactUri()} failed\n ${response.statusCode} ${response.reasonPhrase} }}');
    throw Exception('Failed to load contacts');
  }

  List<T> parseContact<T>(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<T>((json) => Contact.fromJson(json)).toList();
  }
}

// // Future<int> getEndpointData(
//     {@required String acessToken, @required Endpoint endpoint}) {}

// main() async {
//   final _apiService = APIService(API.sandbox());
//   List result = await _apiService.fetchPhotos(PageIndex.page1);
//   print(result);
// }
