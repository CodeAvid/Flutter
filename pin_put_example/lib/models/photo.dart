// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

List<Photo> photoFromJson(String str) =>
    List<Photo>.from(json.decode(str).map((x) => Photo.fromJson(x)));

String photoToJson(List<Photo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photo {
  Photo({
    this.id,
    this.color,
    this.description,
    this.urls,
    this.likes,
    this.user,
  });

  final String id;

  final String color;

  final String description;

  final Urls urls;

  final int likes;

  final User user;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        color: json["color"],
        description: json["description"] == null ? null : json["description"],
        urls: Urls.fromJson(json["urls"]),
        likes: json["likes"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "description": description == null ? null : description,
        "urls": urls.toJson(),
        "likes": likes,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.bio,
    this.location,
    this.profileImage,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
  });

  final String id;

  final String username;
  final String name;
  final String firstName;
  final String lastName;

  final String bio;
  final String location;

  final ProfileImage profileImage;

  final int totalCollections;
  final int totalLikes;
  final int totalPhotos;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        bio: json["bio"] == null ? null : json["bio"],
        location: json["location"] == null ? null : json["location"],
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName == null ? null : lastName,
        "bio": bio == null ? null : bio,
        "location": location == null ? null : location,
        "profile_image": profileImage.toJson(),
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
      };
}

class ProfileImage {
  ProfileImage({
    this.medium,
  });

  final String medium;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
      };
}

class Urls {
  Urls({
    this.raw,
  });

  final String raw;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
      };
}
