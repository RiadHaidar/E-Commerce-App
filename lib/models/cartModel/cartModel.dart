class CartModel {
 late bool status;
 late cartData data;

  

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
 
    data = (json['data'] != null ?  cartData.fromJson(json['data']) : null)!;
  }

  
Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class cartData {
 late List<CartItems> cartItems;
late  dynamic subTotal;
 late dynamic total;

 

  cartData.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems.add( CartItems.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }
Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems.map((v) => v.toJson()).toList();
    }
    data['sub_total'] = this.subTotal;
    data['total'] = this.total;
    return data;
  }
  
}

class CartItems {
 late dynamic id;
 late dynamic quantity;
 late Product product;


  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        (json['product'] != null ? new Product.fromJson(json['product']) : null)!;
  }

 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
 late dynamic id;
 late dynamic price;
 late dynamic oldPrice;
 late dynamic discount;
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
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
   
    data['in_favorites'] = this.inFavorites;
    data['in_cart'] = this.inCart;
    return data;
  }

  
}
