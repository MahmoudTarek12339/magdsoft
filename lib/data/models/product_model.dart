class ProductModel {
  int? id;
  String? company;
  String? name;
  String? type;
  String? price;
  String? image;
  String? description;

  ProductModel(this.id, this.company, this.name, this.type, this.price,
      this.image, this.description);

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }
}
