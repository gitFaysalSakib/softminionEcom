import 'package:get/get.dart';

class CreateOrderModel {
  RxInt? id;
  RxInt? parentId;
  RxString? status;
  RxString? currency;
  RxString? grandTotal;
  RxInt? customerId;
  Billing? billing;
  Billing? shipping;
  RxString? paymentMethod;
  RxString? paymentMethodTitle;
  RxString? number;
  RxList<LineItems>? lineItems;
  RxList<MetaData>? metaData;

  CreateOrderModel({
    int? id,
    int? parentId,
    String? status,
    String? currency,
    String? grandTotal,
    int? customerId,
    Billing? billing,
    Billing? shipping,
    String? paymentMethod,
    String? paymentMethodTitle,
    String? number,
    List<LineItems>? lineItems,
    List<MetaData>? metaData,
  })  : id = RxInt(id ?? 0),
        parentId = RxInt(parentId ?? 0),
        status = RxString(status ?? ''),
        currency = RxString(currency ?? ''),
        grandTotal = RxString(grandTotal ?? ''),
        customerId = RxInt(customerId ?? 0),
        billing = billing ?? Billing(),
        shipping = shipping ?? Billing(),
        paymentMethod = RxString(paymentMethod ?? ''),
        paymentMethodTitle = RxString(paymentMethodTitle ?? ''),
        number = RxString(number ?? ''),
        lineItems = RxList<LineItems>(lineItems ?? []),
        metaData = RxList<MetaData>(metaData ?? []);

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    id = RxInt(json['id'] ?? 0);
    parentId = RxInt(json['parent_id'] ?? 0);
    status = RxString(json['status'] ?? '');
    currency = RxString(json['currency'] ?? '');
    grandTotal = RxString(json['total'] ?? '');
    customerId = RxInt(json['customer_id'] ?? 0);
    billing =
        json['billing'] != null ? Billing.fromJson(json['billing']) : Billing();
    shipping = json['shipping'] != null
        ? Billing.fromJson(json['shipping'])
        : Billing();
    paymentMethod = RxString(json['payment_method'] ?? '');
    paymentMethodTitle = RxString(json['payment_method_title'] ?? '');
    number = RxString(json['number'] ?? '');
    if (json['line_items'] != null) {
      lineItems = (json['line_items'] as List)
          .map((v) => LineItems.fromJson(v))
          .toList()
          .obs;
    }
    if (json['meta_data'] != null) {
      metaData = (json['meta_data'] as List)
          .map((v) => MetaData.fromJson(v))
          .toList()
          .obs;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id?.value;
    data['parent_id'] = parentId?.value;
    data['status'] = status?.value;
    data['currency'] = currency?.value;
    data['total'] = grandTotal?.value;
    data['customer_id'] = customerId?.value;
    if (billing != null) {
      data['billing'] = billing!.toJson();
    }
    if (shipping != null) {
      data['shipping'] = shipping!.toJson();
    }
    data['payment_method'] = paymentMethod?.value;
    data['payment_method_title'] = paymentMethodTitle?.value;
    data['number'] = number?.value;
    if (lineItems != null) {
      data['line_items'] = lineItems!.map((v) => v.toJson()).toList();
    }
    if (metaData != null) {
      data['meta_data'] = metaData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Billing {
  RxString? firstName;
  RxString? address1;
  RxString? phone;

  Billing({String? firstName, String? address1, String? phone})
      : firstName = RxString(firstName ?? ''),
        address1 = RxString(address1 ?? ''),
        phone = RxString(phone ?? '');

  Billing.fromJson(Map<String, dynamic> json) {
    firstName = RxString(json['first_name'] ?? '');
    address1 = RxString(json['address_1'] ?? '');
    phone = RxString(json['phone'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = firstName?.value;
    data['address_1'] = address1?.value;
    data['phone'] = phone?.value;
    return data;
  }
}

class LineItems {
  RxInt? id;
  RxString? name;
  RxInt? productId;
  RxInt? variationId;
  RxInt? quantity;
  RxInt? price;

  LineItems({
    int? id,
    String? name,
    int? price,
    int? productId,
    int? variationId,
    int? quantity,
  })  : id = RxInt(id ?? 0),
        name = RxString(name ?? ''),
        price = RxInt(price ?? 0),
        productId = RxInt(productId ?? 0),
        variationId = RxInt(variationId ?? 0),
        quantity = RxInt(quantity ?? 1);

  LineItems.fromJson(Map<String, dynamic> json) {
    id = RxInt(json['id'] ?? 0);
    name = RxString(json['name'] ?? '');
    price = RxInt(json['price'] ?? 0);

    productId = RxInt(json['product_id'] ?? 0);
    variationId = RxInt(json['variation_id'] ?? 0);
    quantity = RxInt(json['quantity'] ?? 1);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id?.value;
    data['name'] = name?.value;
    data['price'] = price?.value;

    data['product_id'] = productId?.value;
    data['variation_id'] = variationId?.value;
    data['quantity'] = quantity?.value;
    return data;
  }
}

class MetaData {
  RxInt? id;
  RxString? key;
  RxString? value;

  MetaData({int? id, String? key, String? value})
      : id = RxInt(id ?? 0),
        key = RxString(key ?? ''),
        value = RxString(value ?? '');

  MetaData.fromJson(Map<String, dynamic> json) {
    id = RxInt(json['id'] ?? 0);
    key = RxString(json['key'] ?? '');
    value = RxString(json['value'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id?.value;
    data['key'] = key?.value;
    data['value'] = value?.value;
    return data;
  }
}
