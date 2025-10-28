class registerUser {
  String? id;
  String? username;
  int? age;
  String? email;
  String? password;
  String? cpassword;

  registerUser(
      {this.id,
        this.username,
        this.age,
        this.email,
        this.password,
        this.cpassword});

  registerUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    age = json['age'];
    email = json['email'];
    password = json['password'];
    cpassword = json['cpassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['age'] = this.age;
    data['email'] = this.email;
    data['password'] = this.password;
    data['cpassword'] = this.cpassword;
    return data;
  }
}
