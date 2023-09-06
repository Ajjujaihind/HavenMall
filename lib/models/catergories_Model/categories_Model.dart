// ignore: file_names
class CategoriesModel {
  String? id;
  String? image;
  String? name;

  CategoriesModel({this.id, this.image, this.name});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}
