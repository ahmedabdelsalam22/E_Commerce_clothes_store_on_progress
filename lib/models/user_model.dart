class UserDataModel {
  final String name;
  final String uid;
  final String email;

  UserDataModel({required this.uid, required this.email, required this.name});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'uid': uid});
    result.addAll({'email': email});

    return result;
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserDataModel(
      uid: documentId,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
