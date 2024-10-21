// class UserAddressModel {
//   Shipping? shipping;

//   UserAddressModel({this.shipping});

//   UserAddressModel.fromJson(Map<String, dynamic> json) {
//     shipping = json['shipping'] != null
//         ? new Shipping.fromJson(json['shipping'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.shipping != null) {
//       data['shipping'] = this.shipping!.toJson();
//     }
//     return data;
//   }
// }

// class Shipping {
//   String? firstName;
//   String? lastName;
//   String? company;
//   String? address1;
//   String? address2;
//   String? city;
//   int? postcode;
//   String? country;
//   String? state;
//   String? phone;

//   Shipping(
//       {this.firstName,
//       this.lastName,
//       this.company,
//       this.address1,
//       this.address2,
//       this.city,
//       this.postcode,
//       this.country,
//       this.state,
//       this.phone});

//   Shipping.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     company = json['company'];
//     address1 = json['address_1'];
//     address2 = json['address_2'];
//     city = json['city'];
//     postcode = json['postcode'];
//     country = json['country'];
//     state = json['state'];
//     phone = json['phone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['company'] = this.company;
//     data['address_1'] = this.address1;
//     data['address_2'] = this.address2;
//     data['city'] = this.city;
//     data['postcode'] = this.postcode;
//     data['country'] = this.country;
//     data['state'] = this.state;
//     data['phone'] = this.phone;
//     return data;
//   }
// }
