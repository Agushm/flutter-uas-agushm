import 'package:flutter/material.dart';
import '../Api/addRegister.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  bool _isFieldNamaValid;
  bool _isFieldEmailValid;
  bool _isFieldMakulValid;
  bool _isFieldNIMValid;
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerMakul = TextEditingController();
  TextEditingController _controllerNIM = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

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
                  _buildForm(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildButtomRegister(),
                  /*_buildLJamLaporan(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildButtonLapor(),*/
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

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controllerNIM,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "NIM",
                errorText: _isFieldNIMValid == null || _isFieldNIMValid
                    ? null
                    : "Masukan Nim Anda",
              ),
              onChanged: (value) {
                bool isFieldValid = value.trim().isNotEmpty;
                if (isFieldValid != _isFieldNIMValid) {
                  setState(() => _isFieldNIMValid = isFieldValid);
                }
              },
            ),
            TextField(
              controller: _controllerNama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
                errorText: _isFieldNamaValid == null || _isFieldNamaValid
                    ? null
                    : "Full name is required",
              ),
              onChanged: (value) {
                bool isFieldValid = value.trim().isNotEmpty;
                if (isFieldValid != _isFieldNamaValid) {
                  setState(() => _isFieldNamaValid = isFieldValid);
                }
              },
            ),
            TextField(
              controller: _controllerMakul,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Mata Kuliah",
                errorText: _isFieldMakulValid == null || _isFieldMakulValid
                    ? null
                    : "Masukan mata kuliah anda",
              ),
              onChanged: (value) {
                bool isFieldValid = value.trim().isNotEmpty;
                if (isFieldValid != _isFieldMakulValid) {
                  setState(() => _isFieldMakulValid = isFieldValid);
                }
              },
            ),
            TextField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                errorText: _isFieldEmailValid == null || _isFieldEmailValid
                    ? null
                    : "Email is required",
              ),
              onChanged: (value) {
                bool isFieldValid = value.trim().isNotEmpty;
                if (isFieldValid != _isFieldEmailValid) {
                  setState(() => _isFieldEmailValid = isFieldValid);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtomRegister() {
    return RaisedButton(
      onPressed: () {
        if (_isFieldNIMValid == null ||
            _isFieldNamaValid == null ||
            _isFieldMakulValid == null ||
            _isFieldEmailValid == null ||
            !_isFieldNIMValid ||
            !_isFieldNamaValid ||
            !_isFieldMakulValid ||
            !_isFieldEmailValid) {
          _scaffoldState.currentState.showSnackBar(
            SnackBar(
              content: Text("Tolong isi semua Form"),
            ),
          );
          return;
        }
        setState(() => _isLoading = true);
        String nim = _controllerNIM.text.toString();
        String nama = _controllerNama.text.toString();
        String mata_kuliah = _controllerMakul.text.toString();
        String email = _controllerEmail.text.toString();

        register(nim, nama, mata_kuliah, email).then((isSuccess) {
          if (isSuccess) {
            _scaffoldState.currentState.showSnackBar(SnackBar(
              content: Text("Berhasil tambah data"),
            ));
            //Navigator.pop(_scaffoldState.currentState.context);
          } else {
            _scaffoldState.currentState.showSnackBar(SnackBar(
              content: Text("Gagal tambah data"),
            ));
          }
        });
      },
      child: Text(
        "Register UAS",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Colors.blueGrey,
    );
  }
}
