class User {
  String? sId;
  String? phone;
  String? primaryEmail;
  String? username;
  String? pAN;
  int? loginstate;
  String? displayName;
  String? dateOfBirth;
  String? image;
  dynamic statusId;
  String? locationId;
  String? createdAt;
  String? updatedAt;

  User(
      {this.sId,
      this.phone,
      this.primaryEmail,
      this.username,
      this.pAN,
      this.loginstate,
      this.displayName,
      this.dateOfBirth,
      this.image,
      this.statusId,
      this.locationId,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    primaryEmail = json['primaryEmail'];
    username = json['username'];
    pAN = json['PAN'];
    loginstate = json['loginstate'];
    displayName = json['displayName'];
    dateOfBirth = json['dateOfBirth'];
    image = json['image'];
    statusId = json['statusId'];
    locationId = json['locationId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['phone'] = phone;
    data['primaryEmail'] = primaryEmail;
    data['username'] = username;
    data['PAN'] = pAN;
    data['loginstate'] = loginstate;
    data['displayName'] = displayName;
    data['dateOfBirth'] = dateOfBirth;
    data['image'] = image;
    data['statusId'] = statusId;
    data['locationId'] = locationId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
