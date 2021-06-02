import 'package:flutter/material.dart';
// import 'package:pin_put_example/contact_steam.dart';
import 'package:pin_put_example/photo_screen.dart';
import 'package:pin_put_example/services/api.dart';
import 'package:pin_put_example/services/api_service.dart';

import 'models/photo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Photos>> photos;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    final apiService = APIService(API.sandbox());
    photos = apiService.fetchPhotos(PageIndex.page1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: photos,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              if (snapshot.hasError)
                return Center(
                  child: Text('There was an error: ${snapshot.error}'),
                );
              var photos = snapshot.data;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button to fetch photos',
                    ),
                    Text(
                      photos[0],
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              );
          }
          return Container();
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
