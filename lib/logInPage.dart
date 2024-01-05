import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_ten/splash_screen.dart';
import 'home_page.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController name = new TextEditingController();
  TextEditingController pas = new TextEditingController();
  var mes1 = '';
  var mes2 = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("LogInPage"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 60.0, right: 60.0, top: 70.0, bottom: 5.0),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "UserName",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 65),
                    child: Align(alignment:Alignment.centerLeft,child: Text(mes1, style: TextStyle(fontSize: 10, color: Colors.red[500]),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 60.0, right: 60.0, top: 10.0, bottom: 5.0),
                    child: TextField(
                      obscureText: true,
                      controller: pas,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: "Pasword",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, left: 65),
                    child: Align(alignment:Alignment.centerLeft,child: Text(mes2, style: TextStyle(fontSize: 10, color: Colors.red[500]),)),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {});
                      final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      if (name.text == 'Admin' && pas.text == '0000') {
                        await prefs.setBool('isLoggedIn', true);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ));
                      }
                      if (name.text != "Admin") {
                        mes1 = 'Check your UserName, please!';
                        mes2 = '';
                      }
                      if (pas.text != "0000") {
                        mes2 = 'Check your Password, please!';
                        mes1 = '';
                      }
                      if (name.text != 'Admin' && pas.text != '0000') {
                        mes1 = 'Check your UserName, please!';
                        mes2 = 'Check your Password, please!';
                      }
                      if (name.text != "Admin" && pas.text == '0000') {
                        mes1 = 'Check your UserName, please!';
                        mes2 = '';
                      }
                      if (name.text == 'Admin' && pas.text != "0000") {
                        mes2 = 'Check your Password, please!';
                        mes1 = '';
                      }
                    },
                    child: Text("LogIn"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
