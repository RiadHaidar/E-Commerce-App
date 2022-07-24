class FavoritesModel {
  late bool status;
  late Data data;

  FavoritesModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}
class Data {
  int? currentPage;
 late List<FavoritesData> data;
  String? firstPageUrl;
  int ?from;
  int ?lastPage;
  String? lastPageUrl;
  String? path;
  int ?perPage;
  int ?to;
  int ?total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
      data =  [];
      json['data'].forEach((element){
        data.add(
        FavoritesData.fromJson(element));
        });
         // List.generate(data!.length, (index) => FavoritesData.fromJson(json['data']));
    firstPageUrl = json['first_page_url'];
      from = json['from'];
      lastPage = json['last_page'];
      lastPageUrl = json['last_page_url'];
      path = json['path'];
      perPage = json['per_page'];
        to = json['to'];
      total = json['total'];
    }
}

class FavoritesData {
 late int id;
 late FavoriteProduct product;

  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = FavoriteProduct.fromJson(json['product']);
  }
}

class FavoriteProduct {
late  int id;
late dynamic price;
late dynamic oldPrice;
late int discount;
late String image;
late String name;
late String description;

  FavoriteProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }


}