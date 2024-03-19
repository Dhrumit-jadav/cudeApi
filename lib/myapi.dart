import 'dart:convert';

import 'package:http/http.dart' as http;

class MyApi {
  Future<List> getdata() async {
    var res = await http
        .get(Uri.parse("https://63ec906f31ef61473b2493e2.mockapi.io/users"));
    return jsonDecode(res.body);
  }

  Future<void> Insertuser(map) async {
    await http.post(
      Uri.parse("https://63ec906f31ef61473b2493e2.mockapi.io/users"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(map),
    );
  }

  Future<void> Updateuser(String id, map) async {
    await http.put(
      Uri.parse("https://63ec906f31ef61473b2493e2.mockapi.io/users/" + id),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(map),
    );
  }

  Future<void> deleteUser(id) async {
    await http.delete(
        Uri.parse("https://63ec906f31ef61473b2493e2.mockapi.io/users/" + id));
  }
}
