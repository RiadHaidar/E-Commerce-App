class addToCartModel {
 late bool status;

 late Data data;

  addToCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  
    data = (json['data'] != null ?  Data.fromJson(json['data']) : null)!;
  }

 
}

class Data {
late int id;
late int quantity;
late Product product;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        (json['product'] != null ?  Product.fromJson(json['product']) : null)!;
  }

  
}

class Product {
late dynamic id;
late dynamic price;
late dynamic oldPrice;
late dynamic discount;
late dynamic image;
late dynamic name;
late dynamic description;

 
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  
}
