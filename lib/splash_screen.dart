import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_ten/home_page.dart';
import 'logInPage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _naigateToHome();
  }

  _naigateToHome() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isloggedin = prefs.getBool('isLoggedIn');
    if (isloggedin == true) {
      await Future.delayed(Duration(seconds: 3));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );

    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogInPage()),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundImage: AssetImage('king.png'),
                radius: 80,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Hello ",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: Colors.black,
                backgroundColor: Colors.white,
              )
            ],
          ),
        ),);
  }
}
