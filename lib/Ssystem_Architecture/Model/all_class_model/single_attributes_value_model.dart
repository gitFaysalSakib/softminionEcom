class SingleAttributesValueModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? menuOrder;

  SingleAttributesValueModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.menuOrder,
  });

  SingleAttributesValueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    menuOrder = json['menu_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['menu_order'] = this.menuOrder;

    return data;
  }
}
