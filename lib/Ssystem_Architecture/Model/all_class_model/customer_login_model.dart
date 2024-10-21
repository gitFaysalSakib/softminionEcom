class CustomerLoginModel {
  String? username;
  String? password;

  CustomerLoginModel({this.username, this.password});

  CustomerLoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = this.username;
    data['password'] = this.password;

    return data;
  }
}
