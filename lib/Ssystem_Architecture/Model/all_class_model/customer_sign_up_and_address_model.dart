import 'package:get/get.dart';

class CustomerSignUpAndAddressModel {
  Rxn<int> id = Rxn<int>();
  Rxn<String> email = Rxn<String>();
  Rxn<String> firstName = Rxn<String>();
  Rxn<String> lastName = Rxn<String>();
  Rxn<String> username = Rxn<String>();
  Rxn<String> password = Rxn<String>();
  Rxn<Billing> billing = Rxn<Billing>();
  Rxn<Shipping> shipping = Rxn<Shipping>();

  // Constructor
  CustomerSignUpAndAddressModel({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? username,
    String? password,
    Billing? billing,
    Shipping? shipping,
  }) {
    this.id.value = id;
    this.email.value = email;
    this.firstName.value = firstName;
    this.lastName.value = lastName;
    this.username.value = username;
    this.password.value = password;
    this.billing.value = billing;
    this.shipping.value = shipping;
  }

  // Factory method for creating an instance from JSON
  CustomerSignUpAndAddressModel.fromJson(Map<String, dynamic> json) {
    id.value = json['id'];
    email.value = json['email'];
    firstName.value = json['first_name'];
    lastName.value = json['last_name'];
    username.value = json['username'];
    password.value = json['password'];
    billing.value =
        json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    shipping.value =
        json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id.value;
    data['email'] = email.value;
    data['first_name'] = firstName.value;
    data['last_name'] = lastName.value;
    data['username'] = username.value;
    data['password'] = password.value;

    if (billing.value != null) {
      data['billing'] = billing.value!.toJson();
    }
    if (shipping.value != null) {
      data['shipping'] = shipping.value!.toJson();
    }
    return data;
  }

  // CopyWith method
  CustomerSignUpAndAddressModel copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? username,
    String? password,
    Billing? billing,
    Shipping? shipping,
  }) {
    return CustomerSignUpAndAddressModel(
      id: id ?? this.id.value,
      email: email ?? this.email.value,
      firstName: firstName ?? this.firstName.value,
      lastName: lastName ?? this.lastName.value,
      username: username ?? this.username.value,
      password: password ?? this.password.value,
      billing: billing ?? this.billing.value,
      shipping: shipping ?? this.shipping.value,
    );
  }
}

class Billing {
  Rxn<String> firstName = Rxn<String>();
  Rxn<String> address = Rxn<String>();
  Rxn<String> phone = Rxn<String>();

  // Constructor
  Billing({String? firstName, String? address, String? phone}) {
    this.firstName.value = firstName;
    this.address.value = address;
    this.phone.value = phone;
  }

  // Factory method for creating an instance from JSON
  Billing.fromJson(Map<String, dynamic> json) {
    firstName.value = json['first_name'];
    address.value = json['address_1'];
    phone.value = json['phone'];
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['first_name'] = firstName.value;
    data['address_1'] = address.value;
    data['phone'] = phone.value;
    return data;
  }

  // CopyWith method
  Billing copyWith({
    String? firstName,
    String? address,
    String? phone,
  }) {
    return Billing(
      firstName: firstName ?? this.firstName.value,
      address: address ?? this.address.value,
      phone: phone ?? this.phone.value,
    );
  }
}

class Shipping {
  Rxn<String> firstName = Rxn<String>();
  Rxn<String> address = Rxn<String>();
  Rxn<String> phone = Rxn<String>();

  // Constructor
  Shipping({String? firstName, String? address, String? phone}) {
    this.firstName.value = firstName;
    this.address.value = address;
    this.phone.value = phone;
  }

  // Factory method for creating an instance from JSON
  Shipping.fromJson(Map<String, dynamic> json) {
    firstName.value = json['first_name'];
    address.value = json['address_1'];
    phone.value = json['phone'];
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['first_name'] = firstName.value;
    data['address_1'] = address.value;
    data['phone'] = phone.value;
    return data;
  }

  // CopyWith method
  Shipping copyWith({
    String? firstName,
    String? address,
    String? phone,
  }) {
    return Shipping(
      firstName: firstName ?? this.firstName.value,
      address: address ?? this.address.value,
      phone: phone ?? this.phone.value,
    );
  }
}
