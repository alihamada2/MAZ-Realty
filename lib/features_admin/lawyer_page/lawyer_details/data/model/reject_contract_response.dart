import 'package:json_annotation/json_annotation.dart';

part 'reject_contract_response.g.dart';

@JsonSerializable()
class RejectContractResponse {
  String? status;
  @JsonKey(name: 'data')
  Data? data;

  RejectContractResponse({this.status, this.data});
  factory RejectContractResponse.fromJson(Map<String, dynamic> json) =>
      _$RejectContractResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RejectContractResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'booking')
  Booking? booking;

  Data({this.booking});
factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String,dynamic> toJson() => _$DataToJson(this);


}

@JsonSerializable()
class Booking {
    String? createdAt;
  bool? responded;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'property')
  Property? property;
  @JsonKey(name: 'user')
  User? user;
  int? price;
  @JsonKey(name: '__v')
  int? v;

  Booking(
      {this.createdAt,
      this.responded,
      this.id,
      this.property,
      this.user,
      this.price,
      this.v});
    
factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
  Map<String,dynamic> toJson() => _$BookingToJson(this);

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

      factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);
  Map<String,dynamic> toJson() => _$PropertyToJson(this);
  
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
  Map<String,dynamic> toJson() => _$OwnerToJson(this);
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

@JsonSerializable()
class User {
    String? photo;
  String? role;
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  String? whatsapp;
  String? phone;
  @JsonKey(name: '__v')
  int? v;

  User(
      {this.photo,
      this.role,
      this.id,
      this.name,
      this.email,
      this.whatsapp,
      this.phone,
      this.v});

      factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String,dynamic> toJson() => _$UserToJson(this);
}