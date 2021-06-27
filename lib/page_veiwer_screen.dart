import 'package:flutter/material.dart';
import 'package:isaui/main.dart';


// https://pub.dev/packages/page_view_indicator


class Data {
  final String title;
  final String desc;
  final String imgUrl;
  final IconData iconData;

  Data(
      {required this.title,
      required this.desc,
      required this.imgUrl,
      required this.iconData});
}

class PvScreen extends StatefulWidget {
  @override
  _PvScreenState createState() => _PvScreenState();
}

class _PvScreenState extends State<PvScreen> {
  final List<Data> myData = [
    Data(
        title: 'title',
        desc: 'desc',
        imgUrl: "assets/1.jpg",
        iconData: Icons.add_alert),
    Data(
        title: 'title2',
        desc: 'desc2',
        imgUrl: "assets/2.jpg",
        iconData: Icons.offline_bolt_sharp),
  ];

  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/a': (ctx) => MyHomePage(),
      },
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              children: myData
                  .map((page) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage(page.imgUrl),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(page.iconData),
                            SizedBox(
                              height: 25,
                            ),
                            Text(page.title),
                            SizedBox(
                              height: 25,
                            ),
                            Text(page.desc),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            Builder(
              builder: (ctx) => Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    // delayed
                    Future.delayed(Duration(seconds: 2),
                        () => Navigator.of(ctx).pushReplacementNamed('/a'));
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(
                        color: _pageIndex == 1 ? Colors.orange : Colors.red),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
