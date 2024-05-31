
class LoggedInUser {
  String? token;
  bool? isLogin ;

  LoggedInUser({this.token , this.isLogin});

  LoggedInUser.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['isLogin'] = this.token;
    return data;
  }
}