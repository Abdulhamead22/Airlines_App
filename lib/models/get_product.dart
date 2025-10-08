

// class Products {
//   String? status;
//   String? message;
//   List<Product>? products;

//   Products({this.status, this.message, this.products});

//   Products.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['products'] != null) {
//       products = <Product>[];
//       json['products'].forEach((v) {
//         products!.add(new Product.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Product {
//   int? id;
//   String? title;
//   String? image;
//   int? price;
//   String? description;
//   String? brand;
//   String? model;
//   String? color;
//   String? category;
//   int? discount;
//   bool? popular;
//   bool? onSale;

//   Product(
//       {this.id,
//       this.title,
//       this.image,
//       this.price,
//       this.description,
//       this.brand,
//       this.model,
//       this.color,
//       this.category,
//       this.discount,
//       this.popular,
//       this.onSale});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     image = json['image'];
//     price = json['price'];
//     description = json['description'];
//     brand = json['brand'];
//     model = json['model'];
//     color = json['color'];
//     category = json['category'];
//     discount = json['discount'];
//     popular = json['popular'];
//     onSale = json['onSale'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['image'] = this.image;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['brand'] = this.brand;
//     data['model'] = this.model;
//     data['color'] = this.color;
//     data['category'] = this.category;
//     data['discount'] = this.discount;
//     data['popular'] = this.popular;
//     data['onSale'] = this.onSale;
//     return data;
//   }
// }
class Product {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
