import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import './api.dart';

TextEditingController controllerNIM = new TextEditingController();
TextEditingController controllerNama = new TextEditingController();
TextEditingController controllerProgdi = new TextEditingController();
TextEditingController controllerKelas = new TextEditingController();
String controllerTgl , controllerJam;
TextEditingController controllerURL = new TextEditingController();
void addlapor() {
  http.post(Url.lapor, body: {
    "NIM": controllerNIM.text,
    "nama": controllerNama.text,
    "progdi": controllerProgdi.text,
    "kelas": controllerKelas.text,
    "tgl": controllerTgl,
    "jam": controllerJam,
    "URL": controllerURL.text
  });
  
}

Future<bool> lapor(String nim, String nama, String progdi, String kelas, String tgl, String jam, String url) async{
  final response = await http.post(
    Url.lapor,
    body: {
    "NIM": nim,
    "nama": nama,
    "progdi": progdi,
    "kelas": kelas,
    "tgl": tgl,
    "jam": jam,
    "URL": url,
  },
  );
  if (response.statusCode == 201) {
    return false;
  } else {
    return true;
  }
}