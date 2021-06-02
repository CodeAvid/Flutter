import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pin_put_example/models/contact.dart';

class ContactService {
  static final String scheme = 'https';
  static final String _host = 'jsonplaceholder.typicode.com';
  static Uri _url = Uri(scheme: scheme, host: _host, path: '/users');

  static Future<List<Contact>> brows() async {
    http.Response response = await http.get(_url);
    String content = response.body;
    List collection = json.decode(content);
    List<Contact> _contact =
        collection.map((json) => Contact.fromJson(json)).toList();
    return _contact;
  }
}
