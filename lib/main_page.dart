import 'package:flutter/material.dart';

import 'story.dart';
import 'story_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/main_title.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      autofocus: false,
                      controller: nameController,
                      style: TextStyle(fontSize: 20.0),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Your Name',
                          alignLabelWithHint: true),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: RaisedButton(
                          child: Text(
                            'Start Your Adventure',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () {
                            String name = nameController.text;
                            // Go to story with the name
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StoryPage(pages[0]),
                                    settings: RouteSettings(arguments: name)));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
