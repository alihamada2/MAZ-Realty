import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'myfavorites_response.g.dart';

@JsonSerializable()
class MyFavoritesResponse {
  String? status;
  int? results;
  @JsonKey(name: 'data')
  Data? data;

  MyFavoritesResponse({this.status, this.results, this.data});
  
  factory MyFavoritesResponse.fromJson(Map<String, dynamic> json) =>
      _$MyFavoritesResponseFromJson(json);

  Map<String,dynamic> toJson() => _$MyFavoritesResponseToJson(this);    
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'favorites')
  List<Favorite>? favorites;

  Data({this.favorites});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String,dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Favorite {
  @JsonKey(name: '_id')
  String? id;
  String? user;
  @JsonKey(name: 'property')
  Property? property;
  @JsonKey(name: '__v')
  int? v;

  Favorite({this.id, this.user, this.property, this.v});
  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);
  Map<String,dynamic> toJson() => _$FavoriteToJson(this);
}

@JsonSerializable()
class Property {
@JsonKey(name: 'owner')
  User? owner;
  @JsonKey(name: 'city')
  City? city;
  List<String>? images;
  bool? approved;
  int? bedrooms;
  int? bathrooms;
  String? type;
  String? transaction;
  @JsonKey(name: 'Furnished')
  bool? furnished;
  int? level;
  String? latitude;
  String? longitude;
  @JsonKey(name: '_id')
  String? id;
  String? name;
  int? price;
  String? address;
  int? area;
  String? contract;
  String? description;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: '__v')
  int? iV;

  Property(
      {this.owner,
      this.city,
      this.images,
      this.approved,
      this.bedrooms,
      this.bathrooms,
      this.type,
      this.transaction,
      this.furnished,
      this.level,
      this.latitude,
      this.longitude,
      this.id,
      this.name,
      this.price,
      this.address,
      this.area,
      this.contract,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.iV});
  
  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);
  Map<String,dynamic> toJson() => _$PropertyToJson(this);
}

@JsonSerializable()
class User {

  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  String? phone;
  String? whatsapp;

  User({this.id, this.name, this.email, this.phone, this.whatsapp});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String,dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: '_id')
   String? id;
   @JsonKey(name: 'city_name_ar')
  String? nameAr;
  @JsonKey(name: 'city_name_en')
  String? nameEn;
    City({this.id, this.nameAr, this.nameEn});
    factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String,dynamic> toJson() => _$CityToJson(this);

}
