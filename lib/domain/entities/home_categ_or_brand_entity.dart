class HomeCategOrBrandEntity {
  HomeCategOrBrandEntity({
    this.results,
    this.data,
    this.statusMsg,
    this.message,
  });

  int? results;
  List<CategOrBrandDataEntity>? data;
  String? message;
  String? statusMsg;
}

class CategOrBrandDataEntity {
  CategOrBrandDataEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;

}
