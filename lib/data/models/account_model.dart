class UserModel {
  int? status;
  Account? account;

  UserModel(this.account, this.status);

  UserModel.fromJson(Map<String, dynamic> map) {
    status = map['status'];
    account =
        (map['account'] != null ? Account.fromJson(map['account']) : null);
  }
}

class Account {
  int? id;
  String? name, email, password, phone, updated_at, created_at;
  Account(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone,
      this.updated_at,
      this.created_at});

  static Account fromJson(Map<String, dynamic> map) {
    Account account = Account(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      password: map["password"],
      phone: map["phone"],
      updated_at: map["updated_at"],
      created_at: map["created_at"],
    );
    return account;
  }
}
