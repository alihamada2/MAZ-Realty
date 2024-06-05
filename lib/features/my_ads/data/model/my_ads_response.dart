import 'package:final_project/features/edit_profile/data/models/update_response.dart';



class MyAdsResponse {
  String? status;
  int? results;
  Data? data;

  MyAdsResponse({this.status, this.results, this.data});

  MyAdsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
List<Properties>? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['properties'] != null) {
      data = <Properties>[];
      json['properties'].forEach((v) {
        data!.add(new Properties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['properties'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Properties {
Owner? owner;
  City? city;
  List<String>? images;
  bool? approved;
  int? bedrooms;
  int? bathrooms;
  String? type;
  String? transaction;
  bool? furnished;
  int? level;
  String? latitude;
  String? longitude;
  String? sId;
  String? name;
  int? area;
  String? address;
  String? description;
  int? price;
  String? contract;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? isFav;

  Properties(
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
      this.sId,
      this.name,
      this.area,
      this.address,
      this.description,
      this.price,
      this.contract,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.isFav
      });

  Properties.fromJson(Map<String, dynamic> json) {
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    images = json['images'].cast<String>();
    approved = json['approved'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    type = json['type'];
    transaction = json['transaction'];
    furnished = json['Furnished'];
    level = json['level'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    sId = json['_id'];
    name = json['name'];
    area = json['area'];
    address = json['address'];
    description = json['description'];
    price = json['price'];
    contract = json['contract'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
        isFav = json['isFav'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['images'] = this.images;
    data['approved'] = this.approved;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['type'] = this.type;
    data['transaction'] = this.transaction;
    data['Furnished'] = this.furnished;
    data['level'] = this.level;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['area'] = this.area;
    data['address'] = this.address;
    data['description'] = this.description;
    data['price'] = this.price;
    data['contract'] = this.contract;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
        data['isFav'] = this.isFav;

    return data;
  }
}

class Owner {
String? sId;
  String? name;
  String? photo;
  String? email;
  String? phone;

  Owner({this.sId, this.name, this.photo, this.email, this.phone});

  Owner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class City {
   String? sId;
  String? cityNameAr;
  String? cityNameEn;

  City({this.sId, this.cityNameAr, this.cityNameEn});

  City.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cityNameAr = json['city_name_ar'];
    cityNameEn = json['city_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['city_name_ar'] = this.cityNameAr;
    data['city_name_en'] = this.cityNameEn;
    return data;
  }
}
