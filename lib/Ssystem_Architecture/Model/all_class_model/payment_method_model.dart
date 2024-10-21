class PaymentMethodModel {
  String? id;
  String? title;
  String? description;
  int? order;
  bool? enabled;
  String? methodTitle;
  String? methodDescription;

  PaymentMethodModel(
      {this.id,
      this.title,
      this.description,
      this.order,
      this.enabled,
      this.methodTitle,
      this.methodDescription});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    order = json['order'];
    enabled = json['enabled'];
    methodTitle = json['method_title'];
    methodDescription = json['method_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['enabled'] = this.enabled;
    data['method_title'] = this.methodTitle;
    data['method_description'] = this.methodDescription;
    return data;
  }
}
