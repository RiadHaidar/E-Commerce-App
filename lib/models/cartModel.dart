class CartModel {
 late bool status;
 late cartData data;

  

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
 
    data = (json['data'] != null ?  cartData.fromJson(json['data']) : null)!;
  }

}

class cartData {
 late List<CartItems> cartItems;
late  int subTotal;
 late int total;

 

  cartData.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems.add( CartItems.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }

  
}

class CartItems {
 late int id;
 late int quantity;
 late Product product;


  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        (json['product'] != null ? new Product.fromJson(json['product']) : null)!;
  }

 
}

class Product {
 late int id;
 late int price;
 late int oldPrice;
 late int discount;
late String image;
late String name;
late String description;
late bool inFavorites;
late bool inCart;

 

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
   
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  
}
