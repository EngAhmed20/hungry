class UserData {
  final String? token;
  final String name;
  final String email;
  final String? image;
  final String? visa;
  final String? address;

  UserData({
    required this.name,
    required this.email,
    this.token,
    this.image,
    this.visa,
    this.address,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    return UserData(
      token: data['token'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      image: data['image'] ?? '',
      visa: data['Visa'] ?? '',
      address: data['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'visa': visa,
      'address': address,

    };
  }
}
