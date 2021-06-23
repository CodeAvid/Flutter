import 'dart:async';

import 'package:pin_put_example/services/api_service.dart';
// import 'package:pin_put_example/services/contact_service.dart';

import 'models/contact.dart';
import 'models/photo.dart';
import 'services/api.dart';

class ContactManager {
  final _apiService = APIService(API.sandbox());
  final StreamController<int> _contactCounter = StreamController<int>();
  Stream<int> get contactCounter => _contactCounter.stream;

  Stream<List<Contact>> get contactListView async* {
    await Future.delayed(Duration(seconds: 3));
    // yield await ContactService.brows();
    yield await _apiService.fetchContact();
  }

  ContactManager() {
    contactListView.listen((list) => _contactCounter.add(list.length));
  }
  Stream<List<Photo>> get photoList async* {
    yield await _apiService.fetchPhotos(PageIndex.page1);
  }
}

// void main() async {
//   final _apiService = APIService(API.sandbox());
//   List result = await _apiService.fetchContact();
//   print(result);
// }
