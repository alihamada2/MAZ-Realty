import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'home_admin_response.g.dart';

@JsonSerializable()
class HomeAdminResponse {
  String? status;
  int? result;
  @JsonKey(name: 'data')
  Data? data;
  HomeAdminResponse({this.status, this.result, this.data});
  factory HomeAdminResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeAdminResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeAdminResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'notRespondedBookings')
List<NotRespondedBookings>? notRespondedBookings;
  Data({this.notRespondedBookings});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

// static somethingOrSomethingElse(map, string) {
//     return map['data']?? map['notRespondedBookings']?? map['property']??map['city'] ;
//   }

//   @JsonKey(readValue: somethingOrSomethingElse)
//   late List<NotRespondedBookings>? notRespondedBookings;

}

@JsonSerializable()
class NotRespondedBookings {
  String? createdAt;
  bool? responded;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'property')
  Property? property;
  String? user;
  int? price;
  @JsonKey(name: '__v')
  int? v;
  NotRespondedBookings(
      {this.createdAt,
      this.responded,
      this.id,
      this.property,
      this.user,
      this.price,
      this.v});
  factory NotRespondedBookings.fromJson(Map<String, dynamic> json) =>
      _$NotRespondedBookingsFromJson(json);
  Map<String, dynamic> toJson() => _$NotRespondedBookingsToJson(this);
}

@JsonSerializable()
class Property {
  @JsonKey(name: 'owner')
  Owner? owner;
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
  int? v;

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
      this.v});
  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}

@JsonSerializable()
class Owner {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  String? phone;
  String? whatsapp;

  Owner({this.id, this.name, this.email, this.phone, this.whatsapp});
  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
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
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
