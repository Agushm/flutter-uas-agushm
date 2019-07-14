import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './api.dart';

TextEditingController controllerNIM = new TextEditingController();
TextEditingController controllerNama = new TextEditingController();
TextEditingController controllerMakul = new TextEditingController();
TextEditingController controllerEmail = new TextEditingController();

void addData() {
  var url = "https://lppmelati.000webhostapp.com/coba-uas.php";
  http.post(url, body: {
    "NIM": controllerNIM.text,
    "nama": controllerNama.text,
    "mata_kuliah": controllerMakul.text,
    "email": controllerEmail.text
  });
  
}
Future<bool> register(String nim, String nama, String mata_kuliah, String email) async{
  final response = await http.post(
    Url.register,
    body: {
    "NIM": nim,
    "nama": nama,
    "mata_kuliah": mata_kuliah,
    "email": email
  },
  );
  if (response.statusCode == 201) {
    return false;
  } else {
    return true;
  }
}


