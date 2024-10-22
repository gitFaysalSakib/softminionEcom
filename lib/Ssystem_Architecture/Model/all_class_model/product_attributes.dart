class ProductAttributesModel {
  int? id;
  String? name;
  String? slug;
  String? type;
  String? orderBy;

  ProductAttributesModel({
    this.id,
    this.name,
    this.slug,
    this.type,
    this.orderBy,
  });

  ProductAttributesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    orderBy = json['order_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['type'] = this.type;
    data['order_by'] = this.orderBy;

    return data;
  }
}
