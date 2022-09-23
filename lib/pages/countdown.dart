import 'package:flutter/material.dart';
import 'package:gift/pages/home.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int sec = 0;

  int min = 0;
  bool mi = false;

  int hrs = 0;
  bool hr = false;

  int dys = 0;
  bool dy = false;

  int c = 0;
  @override
  void initState() {
    super.initState();
    DateTime n = DateTime.now();
    DateTime d = DateTime.parse("2022-09-20 00:00:00");
    final t = d.difference(n);
    setState(() {
      c = t.inSeconds;
      if (c > 86399) {
        dys = t.inDays;
      } else {
        dys = 0;
        dy = true;
      }

      if (c > 3599) {
        hrs = t.inHours - (dys * 24);
      } else {
        hrs = 0;
        hr = true;
      }

      if (c > 59) {
        min = t.inMinutes - (t.inHours * 60);
      } else {
        min = 0;
        mi = true;
      }
      sec = t.inSeconds - (t.inMinutes * 60);
    });
    startCounter(context);
  }

  Future<void> startCounter(context) async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        sec--;
        c--;
      });
      if (sec == 0 && !mi) {
        setState(() {
          min--;
          sec = 59;
        });
      }
      if (min == 0 && !hr) {
        setState(() {
          hrs--;
          min = 59;
        });
      }
      if (hrs == 0 && !dy) {
        setState(() {
          dys--;
          hrs = 23;
        });
      }
      if (c < 0) {
        break;
      }
    }
    Navigator.pushNamed(context, HomePage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.blue[700]],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Disp(val: dys.toString(), subtit: "Days"),
              Disp(val: hrs.toString(), subtit: "Hours"),
              Disp(val: min.toString(), subtit: "Minutes"),
              Disp(val: sec.toString(), subtit: "Seconds"),
            ],
          ),
        ),
      ],
    );
  }
}

class Disp extends StatelessWidget {
  const Disp({
    Key key,
    this.val,
    this.subtit,
  }) : super(key: key);
  final String val;
  final String subtit;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 2),
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                  colors: [Colors.indigo[900], Colors.cyan[500]],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          width: 90,
          height: 90,
          child: Center(
              child: Text(
            val,
            style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontFamily: "assets/google_fonts/ff.ttf",
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.white70,
                    blurRadius: 40,
                    // offset: Offset(20, 20),
                  ),
                ],
                decoration: TextDecoration.none),
          )),
        ),
        SizedBox(
          width: 90,
          child: Center(
            child: Text(
              subtit,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                  fontFamily: "assets/google_fonts/ff.ttf",
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
          ),
        )
      ],
    );
  }
}
