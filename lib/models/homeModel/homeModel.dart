class HomeModel {
  late bool status;

  late HomeData homeData;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    homeData = HomeData.fromJson(json['data']);
  }
}

class HomeData {
  // late List<Banners> banners;
  late List<Products> products = [];

  HomeData.fromJson(Map<String, dynamic> json) {
    json['products'].forEach((element) {
      products.add(Products.fromJson(element));
    });
  }
}

class Products {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late String description;
  //late List<String> images;
  late bool inFavorite;
  late bool inCart;
  Products.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    //  images = json['images'];
    description = json['description'];
    inFavorite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}

class Banners {}
