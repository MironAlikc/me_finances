class UserDataModel {
  String? id;
  String? name;
  String? sureName;
  int? age;
  String? gender;
  String? image;

  UserDataModel(
      {this.id, this.name, this.sureName, this.age, this.gender, this.image});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sureName = json['sureName'];
    age = json['age'];
    gender = json['gender'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sureName'] = sureName;
    data['age'] = age;
    data['gender'] = gender;
    data['image'] = image;
    return data;
  }
}
