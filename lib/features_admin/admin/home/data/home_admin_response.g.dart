// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_admin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeAdminResponse _$HomeAdminResponseFromJson(Map<String, dynamic> json) =>
    HomeAdminResponse(
      status: json['status'] as String?,
      result: (json['result'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeAdminResponseToJson(HomeAdminResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      notRespondedBookings: (json['notRespondedBookings'] as List<dynamic>?)
          ?.map((e) => NotRespondedBookings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'notRespondedBookings': instance.notRespondedBookings,
    };

NotRespondedBookings _$NotRespondedBookingsFromJson(
        Map<String, dynamic> json) =>
    NotRespondedBookings(
      createdAt: json['createdAt'] as String?,
      responded: json['responded'] as bool?,
      id: json['_id'] as String?,
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>),
      user: json['user'] as String?,
      price: (json['price'] as num?)?.toInt(),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotRespondedBookingsToJson(
        NotRespondedBookings instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'responded': instance.responded,
      '_id': instance.id,
      'property': instance.property,
      'user': instance.user,
      'price': instance.price,
      '__v': instance.v,
    };

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      approved: json['approved'] as bool?,
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      type: json['type'] as String?,
      transaction: json['transaction'] as String?,
      furnished: json['Furnished'] as bool?,
      level: (json['level'] as num?)?.toInt(),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      address: json['address'] as String?,
      area: (json['area'] as num?)?.toInt(),
      contract: json['contract'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'owner': instance.owner,
      'city': instance.city,
      'images': instance.images,
      'approved': instance.approved,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'type': instance.type,
      'transaction': instance.transaction,
      'Furnished': instance.furnished,
      'level': instance.level,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      '_id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'address': instance.address,
      'area': instance.area,
      'contract': instance.contract,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['_id'] as String?,
      nameAr: json['city_name_ar'] as String?,
      nameEn: json['city_name_en'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      '_id': instance.id,
      'city_name_ar': instance.nameAr,
      'city_name_en': instance.nameEn,
    };
