import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
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
        title: Text('Project UAS'),
      ),
      body: Container(

        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        child: Center(child: Container(
          padding: EdgeInsets.only(top:40),
          child: Column(
            children: <Widget>[
              Text('Project UAS',style: TextStyle(color: Colors.white ,fontSize: 40, fontWeight: FontWeight.bold),),
              Text('Nama : Agus Himawan',style: TextStyle(color: Colors.white ,fontSize: 20, fontWeight: FontWeight.bold),),
              Text('Nim : 160103135',style: TextStyle(color: Colors.white ,fontSize: 20, fontWeight: FontWeight.bold),),
              Text('Kelas : TIB2',style: TextStyle(color: Colors.white ,fontSize: 20, fontWeight: FontWeight.bold),),
            ],
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
      image: AssetImage('assets/coba.gif'),
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

}
