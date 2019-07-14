import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import '../Api/lapor.dart';

class LaporPage extends StatefulWidget {
  @override
  _LaporPageState createState() => _LaporPageState();
}

class _LaporPageState extends State<LaporPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  String _timeString;
  String _stringTgl;
  String _stringJam;
  bool _isFieldNamaValid;
  bool _isFieldProgdiValid;
  bool _isFieldKelasValid;
  bool _isFieldURLValid;
  bool _isFieldNIMValid;
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerProgdi = TextEditingController();
  TextEditingController _controllerKelas = TextEditingController();
  TextEditingController _controllerTgl = TextEditingController();
  TextEditingController _controllerJam = TextEditingController();
  TextEditingController _controllerURL = TextEditingController();
  TextEditingController _controllerNIM = TextEditingController();

  void initState() {
    _timeString = _formatDT(DateTime.now());
    _stringJam = _formatJam(DateTime.now());
    _stringTgl = _formatTgl(DateTime.now());
    controllerTgl = _stringTgl.toString();
    controllerJam = _stringJam.toString();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getJam());
    Timer.periodic(
        Duration(
          days: 1,
        ),
        (Timer t) => _getTgl());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      key: _scaffoldState,
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage2(),
          ),
          child: ListView(
            children: <Widget>[
              AppBar(
                title: Text('Menu : '),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              ListTile(
                title: Text(
                  'Register UAS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.people),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
              ),
              ListTile(
                title: Text(
                  'Laporan UAS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.cloud_upload),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/lapor');
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Halaman Laporan UAS'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Column(
                children: <Widget>[
                  _buildFormLapor(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildLJamLaporan(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildButtonLapor(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/camo.jpg'),
    );
  }

  DecorationImage _buildBackgroundImage2() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/camo2.jpg'),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formatDT = _formatDT(now);
    setState(() {
      _timeString = formatDT;
    });
  }

  String _formatDT(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy hh:mm:ss').format(dateTime);
  }

  String _formatTgl(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void _getTgl() {
    final DateTime now = DateTime.now();
    final String formatTgl = _formatTgl(now);
    setState(() {
      _stringTgl = formatTgl;
    });
  }

  String _formatJam(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  void _getJam() {
    final DateTime now = DateTime.now();
    final String formatJam = _formatJam(now);
    setState(() {
      _stringJam = formatJam;
    });
  }

  Widget _buildLJamLaporan() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Tanggal Dan Jam',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              ' Laporan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              _timeString,
              style: TextStyle(fontSize: 30, fontFamily: 'Digital-7'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormLapor() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: controllerNIM,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "NIM",
              ),
              validator: (String value) {
                if (value.isEmpty || value.length > 9) {
                  return 'Wajib di isi dan max 9 angka';
                }
              },
            ),
            TextFormField(
              controller: controllerNama,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty || value.length > 50) {
                  return 'Wajib di isi dan max 50 huruf';
                }
              },
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
              ),
              
            ),
            TextFormField(
              controller: controllerProgdi,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty || value.length > 30) {
                  return 'Wajib di isi dan max 30 karakter';
                }
              },
              decoration: InputDecoration(
                labelText: "Program Studi",
              ),
            ),
            TextFormField(
              controller: controllerKelas,
              maxLength: 2,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty || value.length > 2) {
                  return 'Wajib di isi dan max 2 karakter';
                }
              },
              decoration: InputDecoration(
                labelText: "Kelas",
              ),
            ),
            TextFormField(
              controller: controllerURL,
              maxLines: 3,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Wajib di isi dengan URL project yang sudah di upload';
                }
              },
              decoration: InputDecoration(
                labelText: "Alamat URL Project",
                errorText: _isFieldURLValid == null || _isFieldURLValid
                    ? null
                    : "URL project yang di upload wajib diisi",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void check(){
     if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    addlapor();
    _scaffoldState.currentState.showSnackBar(SnackBar(
          content: Text("Berhasil tambah data"),
        ));
  }
  Widget _buildButtonLapor() {
    return RaisedButton(
      onPressed: () {
        check();
        
      },
      child: Text(
        "Lapor Komandan!",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Colors.blueGrey,
    );
  }
}
