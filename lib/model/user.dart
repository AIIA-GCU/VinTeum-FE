class User{
  String? userName;
  String? userId;
  String? userPassword;

  User({this.userName, this.userId, this.userPassword});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userName: json{'userName'},
      userId: json{'userId'},
      userPassword: json{'userPassword'},
    );
  }
}