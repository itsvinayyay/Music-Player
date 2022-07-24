import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player/Constants.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  bool Showmenu = false;
  @override
  Widget build(BuildContext context) {
    var Threshold = 50;
    return GestureDetector(
      onPanEnd: (details) {
        if (details.velocity.pixelsPerSecond.dy > Threshold) {
          this.setState(() {
            Showmenu = false;
          });
        } else if (details.velocity.pixelsPerSecond.dy < -Threshold) {
          this.setState(() {
            Showmenu = true;
          });
        }
      },
      child: Container(
        decoration: kcontainer,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   backgroundColor: Color(0xFFB55BFD),
          //   foregroundColor: Colors.white,
          // ),
          body: GestureDetector(
            onPanEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy > Threshold) {
                this.setState(() {
                  Showmenu = false;
                });
              } else if (details.velocity.pixelsPerSecond.dy < -Threshold) {
                this.setState(() {
                  Showmenu = true;
                });
              }
            },
            child: Stack(
              children: [
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // margin: EdgeInsets.only(left: 15, top: 100),
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.gripLines,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'F');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 80),
                        child: Container(
                          child: Text(
                            "Good Morning!",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 22,
                          top: 20,
                        ),
                        child: Text(
                          "Vinay",
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 22,
                            top: 60,
                          ),
                          child: Container(
                            child: Image.asset(
                              "images/g.png",
                            ),
                          )),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 300),
                  left: 0,
                  bottom: (Showmenu)
                      ? -230
                      : -((3 * (MediaQuery.of(context).size.height)) / 4),
                  child: bottom_drawer(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class bottom_drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: width,
        height: ((3 * height) / 4) + 230,
        color: Color(0xFFFFFFFF),
        child: Column(
          children: [
            Icon(
              FontAwesomeIcons.minus,
              size: 50,
              color: Color(0xFFD4CED7),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text("Featured Plays!",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 22,
                    )),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 165,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: fullcontainer(
                            imagename: "images/a.png",
                            itsdecoration: kcontainer,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: fullcontainer(
                            imagename: "images/s.png",
                            itsdecoration: kcontainer,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: fullcontainer(
                            imagename: "images/c.png",
                            itsdecoration: kcontainer,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: fullcontainer(
                            imagename: "images/j.png",
                            itsdecoration: kcontainer,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: fullcontainer(
                            imagename: "images/tay.png",
                            itsdecoration: kcontainer,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: fullcontainer(
                            imagename: "images/char.png",
                            itsdecoration: kcontainer,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: fullcontainer(
                            imagename: "images/o.png",
                            itsdecoration: kcontainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, bottom: 0),
                child: Text(
                  "Recents!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 380,
              height: 350,
              child: ListView(
                children: [
                  Container(
                    decoration: kcontainer.copyWith(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 60,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'T');
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.purpleAccent,
                          child: Image.asset(
                            "images/c.png",
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'ipad - Chainsmokers',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: kcontainer,
                      width: 280,
                      height: 60,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.purpleAccent,
                          child: Image.asset(
                            "images/j.png",
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Hold On - Justin bieber',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: kcontainer,
                      width: 280,
                      height: 60,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.purpleAccent,
                          child: Image.asset(
                            "images/s.png",
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Past Life - Selena Gomez ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
