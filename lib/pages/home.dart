import 'package:flutter/material.dart';
import 'package:ta_ilham_rafif/model/dataResource.dart';
import 'package:ta_ilham_rafif/widgets/side_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool pompaAir = false;
  bool kipasPembuangan = false;
  bool daruratDepan = false;
  bool daruratBelakang = false;
  dynamic coba;

  FirebaseApp app;
  DatabaseReference itemRefRuang1;

  @override
  void initState() {
    super.initState();
    getFirebase();
  }

  void getFirebase() async {
    app = await FirebaseApp.configure(
      name: "ta_ilham_rafif",
      options: FirebaseOptions(
        googleAppID: "1:548257860191:android:31136769f1a481e15969ea",
        apiKey: "AIzaSyCZgyvNjSGZtoREEsv8zFeB8VtoqVuoLas",
        databaseURL: "https://tarafifm.firebaseio.com",
      ),
    );
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    itemRefRuang1 = database.reference().child('Test');
    itemRefRuang1.onChildAdded.listen(_onEntryChanged);
    itemRefRuang1.onChildChanged.listen(_onEntryChanged);
    // itemRefGate2.onChildChanged.listen(_onEntryChangedKontrolTab);
  }

  _onEntryChanged(Event event) {
    setState(() {
      coba = DataResource.fromSnapShot(event.snapshot).value;
      print(coba);
    });
  }

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
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
      child: Column(
        children: <Widget>[
          Text(
            'Actuator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Pompa Air',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Switch(
                value: pompaAir,
                onChanged: (bool value) {
                  setState(() {
                    pompaAir = value;
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Kipas Pembuangan',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Switch(
                value: kipasPembuangan,
                onChanged: (bool value) {
                  setState(() {
                    kipasPembuangan = value;
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Pintu Darurat Depan',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Switch(
                value: daruratDepan,
                onChanged: (bool value) {
                  setState(() {
                    daruratDepan = value;
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Pintu Darurat Belakang',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Switch(
                value: daruratBelakang,
                onChanged: (bool value) {
                  setState(() {
                    daruratBelakang = value;
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoomMap() {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
        left: deviceWidth * 0.025,
        right: deviceWidth * 0.025,
        top: deviceWidth * 0.025,
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xff616f39),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 5.0,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Denah',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Divider(
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: deviceWidth * 0.4,
                height: deviceWidth * 0.4,
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffd35656),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: deviceWidth * 0.4,
                height: deviceWidth * 0.4,
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: deviceWidth * 0.4,
                height: deviceWidth * 0.4,
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff616f39),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: deviceWidth * 0.4,
                height: deviceWidth * 0.4,
              )
            ],
          )
        ],
      ),
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
        _buildActuator(),
        _buildRoomMap(),
        SizedBox(
          height: deviceHeight * 0.05,
        )
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
