import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Settings.dart';
import 'package:top_ten/splash_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 70.0,
                    child: Text(
                      'Code4Fun',
                      style: TextStyle(fontSize: 25),
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.remove('isLoggedIn');
                    // await prefs.remove('isLanguage');
                    // await prefs.remove('isDark');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  },
                  child: Text("LogOut")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Settings();
                        },
                      ),
                    );
                  },
                  child: Text("Settings")),
            ],
          ),
        ),);
  }
}
