import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({this.name, this.image, this.avatar});
  final String name;
  final String image;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            Container(
              height: 50.0,
              width: double.infinity,
              color: Colors.pink,
            ),
            Container(
              alignment: Alignment(-1.0, -1.0),
              margin: EdgeInsets.only(left: 20.0),
              transform: Matrix4.translationValues(0.0, -40.0, 0.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatar),
                radius: 50,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -30.0, 0.0),
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    'IZONE Member',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Text(
                'Some Images:',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Wrap(
                children: <Widget>[
                  Image(
                    image: NetworkImage(avatar),
                    height: 200.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                  ),
                  Image(
                    image: NetworkImage(image),
                    height: 200.0,
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
