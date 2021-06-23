import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pin_put_example/services/api_service.dart';
import 'contact_manager.dart';
import 'models/photo.dart';
import 'services/api.dart';

class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final ContactManager manager = ContactManager();
  Future<List<Photo>> photos;

  @override
  void initState() {
    super.initState();
    final apiService = APIService(API.sandbox());
    photos = apiService.fetchPhotos(PageIndex.page1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<Photo>>(
        stream: manager.photoList,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Opos something went wrong ${snapshot.error}');
              }
              if (snapshot.hasData) {
                var photos = snapshot.data;
                return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    Photo photo = photos[index];
                    return Container(
                      margin: const EdgeInsets.all(20.0),
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: "${photo.urls.raw}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      // Center(child: Text(photo.user.name)),
                    );
                  },
                );
              }
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
