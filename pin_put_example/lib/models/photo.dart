// To parse this JSON data, do

// final photos = photosFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

List<Photos> photosFromJson(String str) =>
    List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photosToJson(List<Photos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photos {
  Photos({
    @required this.id,
    @required this.color,
    @required this.description,
    @required this.urls,
    @required this.likes,
    @required this.user,
  });

  final String id;

  final String color;
  final String description;
  final Urls urls;

  final int likes;
  final User user;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
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
  String id;
  String username;
  String name;
  String firstName;
  String lastName;
  String bio;
  String location;
  ProfileImage profileImage;
  int totalCollections;
  int totalLikes;
  int totalPhotos;

  User({
    @required this.id,
    @required this.username,
    @required this.name,
    @required this.firstName,
    @required this.lastName,
    @required this.bio,
    @required this.location,
    @required this.profileImage,
    @required this.totalCollections,
    @required this.totalLikes,
    @required this.totalPhotos,
  });

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
  String medium;

  ProfileImage({
    @required this.medium,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
      };

  ProfileImage copyWith({
    String medium,
  }) {
    return ProfileImage(
      medium: medium ?? this.medium,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medium': medium,
    };
  }

  factory ProfileImage.fromMap(Map<String, dynamic> map) {
    return ProfileImage(
      medium: map['medium'],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory ProfileImage.fromJson(String source) =>
  // ProfileImage.fromMap(json.decode(source));

  @override
  String toString() => 'ProfileImage(medium: $medium)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileImage && other.medium == medium;
  }

  @override
  int get hashCode => medium.hashCode;
}

class Urls {
  String full;

  Urls({
    @required this.full,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        full: json["full"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
      };

  Urls copyWith({
    String full,
  }) {
    return Urls(
      full: full ?? this.full,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'full': full,
    };
  }

  factory Urls.fromMap(Map<String, dynamic> map) {
    return Urls(
      full: map['full'],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Urls.fromJson(String source) => Urls.fromMap(json.decode(source));

  @override
  String toString() => 'Urls(full: $full)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Urls && other.full == full;
  }

  @override
  int get hashCode => full.hashCode;
}
