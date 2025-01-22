import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';

class HomeCategOrBrandDto extends HomeCategOrBrandEntity {
  HomeCategOrBrandDto({
    super.results,
    this.metadata,
    super.data,
    super.message,
    super.statusMsg
  });

  HomeCategOrBrandDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    results = json['results'];
    metadata = json['metadata'] != null
        ? CategOrBrandMetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategOrBrandDataDto.fromJson(v));
      });
    }
  }

  CategOrBrandMetadataDto? metadata;
}

class CategOrBrandDataDto extends CategOrBrandDataEntity {
  CategOrBrandDataDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategOrBrandDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}

class CategOrBrandMetadataDto {
  CategOrBrandMetadataDto({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  CategOrBrandMetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
