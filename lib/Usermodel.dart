class UserModel {
  String _Firstname = "";
  String _Lastname = "";
  String _Age = "";

  String get Age => _Age;

  set Age(String value) {
    _Age = value;
  }

  String get Lastname => _Lastname;

  set Lastname(String value) {
    _Lastname = value;
  }

  String get Firstname => _Firstname;

  set Firstname(String value) {
    _Firstname = value;
  }

  Map<String, dynamic> Convert() {
    return {
      "Firstname": Firstname,
      "Lastname": Lastname,
      "Age": Age,
    };
  }
}
