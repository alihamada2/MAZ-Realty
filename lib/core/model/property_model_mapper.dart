import 'package:final_project/features/favorite/data/model/myfavorites_response.dart'
    as favorite;
import 'package:final_project/features/home_details/data/models/home_properties_response.dart'
    as home;
import 'package:final_project/features/my_ads/data/model/my_ads_response.dart' as ads;
import 'package:final_project/features/search/data/model/filter_model.dart';
import 'package:final_project/features_admin/admin/home/data/home_admin_response.dart' as admin;

class PropertyModelMapper {
  home.Property getPropertyModel(favorite.Property favorite) {
    return home.Property(
      owner: home.User(
        email: favorite.owner?.email,
        name: favorite.owner?.name,
        id: favorite.owner?.id,
        phone: favorite.owner?.phone,
      
      ),
      contract: favorite.contract,
      address: favorite.address,
      approved: favorite.approved,
      area:  favorite.area.toString(),
      bathrooms: favorite.bathrooms?.toString(),
      id: favorite.id,
      bedrooms: favorite.bedrooms.toString(),
      city: home.City(
        id: favorite.city?.id,
        nameAr: favorite.city?.nameAr,
        nameEn: favorite.city?.nameEn,
      ),
      description: favorite.bedrooms.toString(),
      images: favorite.images,
      name: favorite.name,
      price: favorite.price,
      
    );
  }
  home.Property getAdmin(admin.Property favorite) {
    return home.Property(
      owner: home.User(
        email: favorite.owner?.email,
        name: favorite.owner?.name,
        id: favorite.owner?.id,
        phone: favorite.owner?.phone,

      ),
      address: favorite.address,
      approved: favorite.approved,
      area:  favorite.area.toString(),
      contract: favorite.contract,
      bathrooms: favorite.bathrooms?.toString(),
      id: favorite.id,
      bedrooms: favorite.bedrooms.toString(),
      city: home.City(
        id: favorite.city?.id,
        nameAr: favorite.city?.nameAr,
        nameEn: favorite.city?.nameEn,
      ),
      description: favorite.bedrooms.toString(),
      images: favorite.images,
      name: favorite.name,
      price: favorite.price,

    );
  }
  FilterData getFilteredModel(favorite.Property favorite) {
    return FilterData(
      owner: Owner(
        email: favorite.owner?.email,
        name: favorite.owner?.name,
        sId: favorite.owner?.id,
        phone: favorite.owner?.phone,

      ),
      contract: favorite.contract,
      address: favorite.address,
      approved: favorite.approved,
      area:  favorite.area,
      bathrooms: favorite.bathrooms,
      sId: favorite.id,
      bedrooms: favorite.bedrooms,
      city: City(
        sId: favorite.city?.id,
        cityNameAr: favorite.city?.nameAr,
        cityNameEn: favorite.city?.nameEn,
      ),
      description: favorite.bedrooms.toString(),
      images: favorite.images,
      name: favorite.name,
      price: favorite.price,

    );
  }
 ads.Properties getPropertiesModel(ads.Properties favorite) {
    return ads.Properties(
      owner: ads.Owner(
        email: favorite.owner?.email,
        name: favorite.owner?.name,
        sId: favorite.owner?.sId,
        phone: favorite.owner?.phone,

      ),
      address: favorite.address,
      approved: favorite.approved,
      area:  favorite.area,
      bathrooms: favorite.bathrooms,
      sId: favorite.sId,
      contract: favorite.contract,
      bedrooms: favorite.bedrooms,
      city: ads.City(
        sId: favorite.city?.sId,
        cityNameAr: favorite.city?.cityNameAr,
        cityNameEn: favorite.city?.cityNameEn,
      ),
      description: favorite.bedrooms.toString(),
      images: favorite.images,
      name: favorite.name,
      price: favorite.price,

    );
  }

}
