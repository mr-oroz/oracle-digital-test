class NewTodayModel {
  String? image;
  String? firstName;
  String? lastName;
  String? avatar;
  String? login;

  NewTodayModel({this.image, this.firstName, this.lastName, this.avatar, this.login});

  @override
  String toString() {
    return 'NewTodayModel(image: $image, firstName: $firstName, lastName: $lastName, avatar: $avatar, login: $login)';
  }

  NewTodayModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    avatar = json['avatar'];
    login = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['avatar'] = avatar;
    data['login'] = login;

    return data;
  }
}
