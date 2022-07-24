import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Home.dart';
import 'player.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Color(0xFF48285E),
    ),
    initialRoute: 'F',
    routes: {
      'F': (context) => user_page(),
      'S': (context) => home_page(),
      'T': (context) => player_page()
    },
  ));
}

class user_page extends StatelessWidget {
  const user_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5B3B71),
            Color(0xFF280841),
            Color(0xFF26063E),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40, top: 60),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black,
                                spreadRadius: 5)
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/img.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      top: 15,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Welcome\n"
                        "Vinay!",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 45),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.house,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'S');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.music,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: const Text(
                    'Player',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'T');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.moneyBillTrendUp,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: const Text(
                    'Trending',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.folderClosed,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: const Text(
                    'Your Library',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
