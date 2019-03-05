import 'package:flutter/material.dart';
import '../screen/ProfileScreen.dart';
import '../constant/member.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  List members = Member.izone;

  void _filterMember(str) {
    List newMember = Member.izone;
    List result = [];
    RegExp regExp = RegExp("${str.toString()}", caseSensitive: false);
    for (var i = 0; i < newMember.length; i++) {
      if(regExp.hasMatch(newMember[i]['name'])) {
        result.add(newMember[i]);
      }
    }
    this.setState(() {
      members = result;
    });
  }

  List<Widget> _createMemberList(members, context) {
    int length = members.length;
    List<Widget> list = List<Widget>();
    for (var i = 0; i < length; i++) {
      list.add(Container(
        margin: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                          name: members[i]['name'],
                          avatar: members[i]['avatar'],
                          image: members[i]['image'],
                        )));
          },
          child: CircleAvatar(
            radius: 43.0,
            backgroundImage: NetworkImage(members[i]['avatar']),
          ),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Izone'),
              accountEmail: Text('The best zone in the universe'),
            ),
            ListTile(
              onTap: () => Navigator.popAndPushNamed(context, '/home'),
              leading: Icon(Icons.favorite),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 60.0),
              color: Colors.pink,
              child: Column(
                children: <Widget>[
                  Text(
                    'IZ*ONE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55.0,
                    ),
                  ),
                  Text(
                    'the best zone in the universe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -25.0, 0.0),
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onSubmitted: (String str) {
                  _filterMember(str);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search Something',
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
              child: Text(
                'Members:',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.0),
              child: Wrap(
                children: _createMemberList(members, context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
