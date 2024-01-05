import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var mode = false;
var icon = Icons.light_mode_sharp;
var textMode = "Light";
var font = "FontSize";
var lan = "English";
bool l = false;
double size = 20;
bool? isDark;
bool? isLanguage;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    _navigateMode();
    _navigateLanguage();
  }

  _navigateMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isDark = prefs.getBool('isDark');

    if (isDark == true ) {
      mode = true;
      icon = Icons.mode_night;
      textMode = "Dark  ";
    } else {
      mode = false;
      icon = Icons.light_mode_sharp;
      textMode = "Light";
    }
    setState(() {});
  }
  _navigateLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLanguage = prefs.getBool('isLanguage');
    if (isLanguage == true) {
      lan = "Dari      ";
      l = true;
    } else {
      lan = "English";
      l = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Settings",
      theme: mode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(icon),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    textMode,
                    style: TextStyle(fontSize: size),
                  ),
                  SizedBox(
                    width: 240,
                  ),
                  Switch(
                    value: mode,
                    onChanged: (v) async {
                      final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      if (mode == false) {
                        await prefs.setBool('isDark', true);
                        icon = Icons.mode_night;
                        textMode = "Dark  ";
                        mode = true;
                      } else {
                        await prefs.remove('isDark');
                        icon = Icons.light_mode_sharp;
                        textMode = "Light";
                        mode = false;
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.font_download),
              title: Row(
                children: [
                  Text(
                    font,
                    style: TextStyle(fontSize: size),
                  ),
                  SizedBox(
                    width: 190,
                  ),
                  IconButton(
                    onPressed: () async {
                      setState(() {});
                      size--;
                    },
                    icon: Text(
                      "-",
                      style:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      setState(() {});
                      size++;
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(Icons.language),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    lan,
                    style: TextStyle(fontSize: size),
                  ),
                  SizedBox(
                    width: 220,
                  ),
                  Switch(
                    value: l,
                    onChanged: (v) async {
                      final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      if (l == false) {
                        await prefs.setBool('isLanguage', true);
                        lan = "Dari      ";
                        l = true;
                      } else {
                        await prefs.remove('isLanguage');
                        lan = "English";
                        l = false;
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
