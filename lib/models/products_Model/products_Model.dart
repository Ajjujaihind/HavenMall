class ProductModel {
  String? image;
  String? id;
  bool? isFavourite;
  String? name;
  double? price; // Change the type to double
  String? description;
  String? status;

  ProductModel({
    this.image,
    this.id,
    this.isFavourite,
    this.name,
    this.price,
    this.description,
    this.status,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    isFavourite = json['isFavourite'];
    name = json['name'];
    price = json['price'] != null
        ? double.parse(json['price'].toString())
        : null; // Parse the price as double
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['id'] = this.id;
    data['isFavourite'] = this.isFavourite;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}
