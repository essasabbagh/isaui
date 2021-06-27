import 'package:flutter/material.dart';
import 'package:isaui/page_veiwer_screen.dart';
// import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme:
          ThemeData(accentColor: Colors.lime, canvasColor: Colors.amberAccent),
      darkTheme:
          ThemeData(accentColor: Colors.grey, canvasColor: Colors.redAccent),
      home: PvScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List images = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
  ];
  List letters = [
    "a",
    "b",
    "c",
    "d",
  ];

  var _selectedLetter;

  int? _character = 0;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton(
                hint: Text(' Select a letter:'),
                value: _selectedLetter,
                onChanged: (newValue) {
                  setState(() {
                    _selectedLetter = newValue;
                  });
                },
                items: letters.map((letter) {
                  return DropdownMenuItem(
                    child: Text(letter),
                    value: letter,
                  );
                }).toList()),
            ExpansionTile(
              title: Text('Choise'),
              backgroundColor: Colors.lightBlue,
              children: [
                Divider(
                  color: Colors.black45,
                ),
                ListTile(
                  title: Text('Title'),
                  subtitle: Text('sub title'),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.receipt),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('fuck'),
                        duration: Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
            // CarouselSlider(
            //     items: images.map((e) {
            //       return Container(
            //           width: double.infinity,
            //           height: 150,
            //           margin: EdgeInsets.symmetric(horizontal: 10),
            //           child: Image.asset(
            //             e,
            //           ));
            //     }).toList(),
            //     options: CarouselOptions(
            //         autoPlay: true,
            //         initialPage: 1,
            //         enlargeCenterPage: true,
            //         scrollDirection: Axis.vertical)),
            SelectableText(
              'data',
              showCursor: true,
              toolbarOptions: ToolbarOptions(copy: true, selectAll: true),
            ),
            SizedBox(
              height: 25,
            ),
            // CarouselSlider.builder(
            //     itemCount: images.length,
            //     itemBuilder: (BuildContext context, int index, int real) {
            //       return Container(
            //           width: double.infinity,
            //           height: 150,
            //           margin: EdgeInsets.symmetric(horizontal: 10),
            //           child: Image.asset(
            //             images[index],
            //           ));
            //     },
            //     options: CarouselOptions(autoPlay: true, initialPage: 1,)),
            Radio(value: 'value', groupValue: 0, onChanged: (val) {}),
            Checkbox(
                value: isChecked,
                onChanged: (val) {
                  setState(() {
                    isChecked = val;
                  });
                }),
            CheckboxListTile(
                title: Text('my check'),
                value: isChecked,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (val) {
                  setState(() {
                    isChecked = val;
                  });
                }),
            RadioListTile(
              title: Text('Lafayette'),
              value: 3,
              controlAffinity: ListTileControlAffinity.trailing,
              groupValue: _character,
              onChanged: (int? val) {
                setState(() {
                  _character = val;
                });
              },
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                final AlertDialog alert = AlertDialog(
                  title: Text('Title'),
                  content: Text('lorem  '),
                  actions: [
                    TextButton(onPressed: () {}, child: Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No')),
                  ],
                );
                showDialog(
                    context: context,
                    builder: (_) => alert,
                    barrierDismissible: false);
              },
              child: Text('data'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('fuck'),
                    duration: Duration(seconds: 3),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  ),
                );
              },
              child: Text('Snack'),
            ),
          ],
        ),
      ),
    );
  }
}
