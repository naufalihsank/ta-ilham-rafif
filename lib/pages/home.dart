import 'package:flutter/material.dart';
import 'package:ta_ilham_rafif/widgets/side_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Widget _buildRoomCard(
      String title, String temperature, String fire, Color mainColor) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final fontStyle = TextStyle(color: Colors.white);
    return Container(
      margin: EdgeInsets.only(
        left: deviceWidth * 0.025,
        right: deviceWidth * 0.025,
        top: deviceWidth * 0.025,
      ),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 5.0,
          )
        ],
      ),
      width: deviceWidth * 0.4,
      padding: EdgeInsets.all(deviceWidth * 0.05),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: fontStyle,
          ),
          Divider(
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Suhu',
                    style: fontStyle,
                  ),
                  Text(
                    temperature,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
              title == 'Ruangan 2'
                  ? Column(
                      children: <Widget>[
                        Text(
                          'Gas',
                          style: fontStyle,
                        ),
                        Text(
                          '5',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    )
                  : SizedBox(),
              Column(
                children: <Widget>[
                  Text(
                    'Api',
                    style: fontStyle,
                  ),
                  Text(
                    fire,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActuator() {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        left: deviceWidth * 0.025,
        right: deviceWidth * 0.025,
        top: deviceWidth * 0.025,
      ),
      decoration: BoxDecoration(
        color: Color(0xffd35656),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 5.0,
          )
        ],
      ),
      height: 100,
    );
  }

  Widget _pageContent() {
    final deviceHeight = MediaQuery.of(context).size.height;
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        SizedBox(
          height: deviceHeight * 0.06,
        ),
        _buildRoomCard('Ruangan 1', '37', '2', Color(0xfff67280)),
        _buildRoomCard('Ruangan 2', '27', '0', Color(0xffc06c84)),
        _buildRoomCard('Ruangan 3', '35', '3', Color(0xff6c567b)),
        _buildActuator()
      ],
    );
  }

  Widget _buildHeader(GlobalKey<ScaffoldState> key) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        top: deviceHeight * 0.03,
        left: deviceWidth * 0.04,
        right: deviceWidth * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xff6f0000),
              size: 30,
            ),
            onPressed: () => key.currentState.openDrawer(),
          ),
          Text(
            'Fire Detection',
            style: TextStyle(
              color: Color(0xff6f0000),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        drawer: SideDrawer('/home'),
        body: Stack(
          children: <Widget>[
            Container(
              width: deviceWidth,
              height: deviceHeight,
              color: Colors.white,
            ),
            _pageContent(),
            _buildHeader(_scaffoldKey)
          ],
        ));
  }
}
