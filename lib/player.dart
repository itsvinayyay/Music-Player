import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/Constants.dart';

class player_page extends StatefulWidget {
  const player_page({Key? key}) : super(key: key);

  @override
  State<player_page> createState() => _player_pageState();
}

class _player_pageState extends State<player_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kcontainer,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
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
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: -230,
              child: player_drawer(),
            )
          ],
        ),
      ),
    );
  }
}

class player_drawer extends StatefulWidget {
  const player_drawer({Key? key}) : super(key: key);

  @override
  State<player_drawer> createState() => _player_drawerState();
}

class _player_drawerState extends State<player_drawer> {
  final audioPlayer = AudioPlayer();
  bool playing = false;
  IconData Playbtn = FontAwesomeIcons.play;
  late AudioPlayer _player;
  AudioCache? cache;

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  Widget slider() {
    return Slider.adaptive(
      activeColor: Color(0xFFAA66F5),
      inactiveColor: Color(0xFFF1E7FF),
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      min: 0,
      onChanged: (value) async {
        final position = Duration(seconds: value.toInt());
        await audioPlayer.seek(position);
        await audioPlayer.resume();
      },
    );
  }

  void seekTosec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        playing = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    final player = AudioCache(prefix: 'assets/');
    final url = await player.load('ipad.wav');
    audioPlayer.setSourceUrl(
      url.path,
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color(0xFFFFFFFF),
      ),
      height: ((3 * height) / 4) + 280,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.minus,
            size: 50,
            color: Color(0xFFD4CED7),
          ),
          Container(
            child: Image.asset('images/ch.png'),
            decoration: kcontainer.copyWith(
              borderRadius: BorderRadius.circular(20),
            ),
            width: 250,
            height: 250,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "ipad",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 34,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "The Chainsmokers",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          slider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.backwardStep,
                  size: 28,
                  color: Color(0xFFAA66F5),
                ),
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xFFAA66F5),
                child: IconButton(
                  icon: Icon(
                      playing ? FontAwesomeIcons.pause : FontAwesomeIcons.play),
                  iconSize: 35,
                  color: Colors.white,
                  onPressed: () async {
                    if (playing) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.forwardStep,
                  size: 28,
                  color: Color(0xFFAA66F5),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 28,
          ),
          Container(
            height: 90,
            width: 400,
            decoration: BoxDecoration(
                color: Color(0xFF26063E),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                  topLeft: Radius.circular(150),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Color(0xFFAD68F8),
                    size: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
