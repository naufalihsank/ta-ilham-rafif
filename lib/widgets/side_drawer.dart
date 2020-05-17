import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  String pageRouteName;
  SideDrawer(this.pageRouteName);
  @override
  State<StatefulWidget> createState() {
    return _SideDrawerState();
  }
}

class _SideDrawerState extends State<SideDrawer> {
  bool _isDashboard = false;
  bool _isAbout = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 0.7 * deviceHeight,
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  selected: widget.pageRouteName == '/home' ? true : false,
                  title: Text(
                    'Dashboard',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.info),
                  selected: widget.pageRouteName == '/about' ? true : false,
                  title: Wrap(
                    children: <Widget>[
                      Text(
                        'About',
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/about');
                  },
                ),
                Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
