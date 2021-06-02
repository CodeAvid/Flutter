import 'dart:convert';

import 'package:pin_put_example/models/photo.dart';
import 'package:http/http.dart' as http;
import 'api.dart';

class PhotoService {
  static final String host = '';
  static final int port = 443;
  static final String _scheme = 'https';
  static final String basePath = 't/nubentos.com/ncovapi/1.0.0';
  static final Map<String, String> clientParams = {
    "client_id": "TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to"
  };

  static Uri pageUri(PageIndex index) => Uri(
        scheme: _scheme,
        host: host,
        path: 'photos',
        queryParameters: {
          "client_id": "TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to",
          "page": _pages[index],
        },
      );

  static Uri url() => Uri.parse(
      'https://api.unsplash.com/photos/?client_id=TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to&page=');

  static Map<PageIndex, String> _pages = {
    PageIndex.page1: '1',
    PageIndex.page2: '2',
    PageIndex.page3: '3',
  };

  static Future<List<Photos>> fetchPhotos(PageIndex index) async {
    final response = await http.get(url());
    print(response.statusCode);
    if (response.statusCode == 200) {
      String content = response.body;
      List collecton = json.decode(content);
      final List<Photos> _data =
          collecton.map((json) => Photos.fromJson(json)).toList();
      return _data;
    }
    print(
        'Request ${pageUri(PageIndex.page1)} failed\n ${response.statusCode} ${response.reasonPhrase} }}');
    throw response;
  }
}
