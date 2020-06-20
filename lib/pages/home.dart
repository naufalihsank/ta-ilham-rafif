import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ta_ilham_rafif/model/dataResource.dart';
import 'package:ta_ilham_rafif/widgets/side_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import '../FirebaseMessaging/firebaseMessaging.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  dynamic apiRuang1;
  dynamic suhuRuang1;
  dynamic apiRuang2;
  dynamic suhuRuang2;
  dynamic gasRuang2;
  dynamic apiRuang3;
  dynamic suhuRuang3;
  dynamic pompaAir;
  dynamic kipasPembuangan;
  dynamic daruratDepan;
  dynamic daruratBelakang;
  dynamic ruangKebakaran;

  FirebaseApp app;
  DatabaseReference itemRefApiRuang1;
  DatabaseReference itemRefSuhuRuang1;
  DatabaseReference itemRefApiRuang2;
  DatabaseReference itemRefSuhuRuang2;
  DatabaseReference itemRefGasRuang2;
  DatabaseReference itemRefApiRuang3;
  DatabaseReference itemRefSuhuRuang3;
  DatabaseReference itemRefPintuDaruratDepan;
  DatabaseReference itemRefPintuDaruratBelakang;
  DatabaseReference itemRefPompaAir;
  DatabaseReference itemRefKipasPembuangan;
  DatabaseReference itemRefRuangKebakaran;

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
    itemRefApiRuang1 = database.reference().child('Ruangan1/Api');
    itemRefApiRuang1.onChildAdded.listen(_onEntryChangedApiRuang1);
    itemRefApiRuang1.onChildChanged.listen(_onEntryChangedApiRuang1);
    itemRefSuhuRuang1 = database.reference().child('Ruangan1/Suhu');
    itemRefSuhuRuang1.onChildAdded.listen(_onEntryChangedSuhuRuang1);
    itemRefSuhuRuang1.onChildChanged.listen(_onEntryChangedSuhuRuang1);
    itemRefApiRuang2 = database.reference().child('Ruangan2/Api');
    itemRefApiRuang2.onChildAdded.listen(_onEntryChangedApiRuang2);
    itemRefApiRuang2.onChildChanged.listen(_onEntryChangedSuhuRuang1);
    itemRefSuhuRuang2 = database.reference().child('Ruangan2/Suhu');
    itemRefSuhuRuang2.onChildAdded.listen(_onEntryChangedSuhuRuang2);
    itemRefSuhuRuang2.onChildChanged.listen(_onEntryChangedSuhuRuang2);
    itemRefGasRuang2 = database.reference().child('Ruangan2/Gas');
    itemRefGasRuang2.onChildAdded.listen(_onEntryChangedGasRuang2);
    itemRefGasRuang2.onChildChanged.listen(_onEntryChangedGasRuang2);
    itemRefApiRuang3 = database.reference().child('Ruangan3/Api');
    itemRefApiRuang3.onChildAdded.listen(_onEntryChangedApiRuang3);
    itemRefApiRuang3.onChildChanged.listen(_onEntryChangedApiRuang3);
    itemRefSuhuRuang3 = database.reference().child('Ruangan3/Suhu');
    itemRefSuhuRuang3.onChildAdded.listen(_onEntryChangedSuhuRuang3);
    itemRefSuhuRuang3.onChildChanged.listen(_onEntryChangedSuhuRuang3);
    itemRefPintuDaruratBelakang =
        database.reference().child('Pintu daruat/2PintuBelakang');
    itemRefPintuDaruratBelakang.onChildAdded
        .listen(_onEntryChangedPintuDaruratBelakang);
    itemRefPintuDaruratBelakang.onChildChanged
        .listen(_onEntryChangedPintuDaruratBelakang);
    itemRefPintuDaruratDepan =
        database.reference().child('Pintu daruat/1PintuDepan');
    itemRefPintuDaruratDepan.onChildAdded
        .listen(_onEntryChangedPintuDaruratDepan);
    itemRefPintuDaruratDepan.onChildChanged
        .listen(_onEntryChangedPintuDaruratDepan);
    itemRefPompaAir = database.reference().child('Sistem pemadam Api/1Pompa');
    itemRefPompaAir.onChildAdded.listen(_onEntryChangedPompaAir);
    itemRefPompaAir.onChildChanged.listen(_onEntryChangedPompaAir);
    itemRefKipasPembuangan =
        database.reference().child('SistemKebocoranGas/2Exhaust');
    itemRefKipasPembuangan.onChildAdded.listen(_onEntryChangedKipasPembuangan);
    itemRefKipasPembuangan.onChildChanged
        .listen(_onEntryChangedKipasPembuangan);
    itemRefRuangKebakaran =
        database.reference().child('Sistem pemadam Api/3LokasiKebakaran');
    itemRefRuangKebakaran.onChildAdded.listen(_onEntryChangedRuangKebakaran);
    itemRefRuangKebakaran.onChildChanged.listen(_onEntryChangedRuangKebakaran);
  }

  _onEntryChangedApiRuang1(Event event) {
    setState(() {
      apiRuang1 = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedSuhuRuang1(Event event) {
    setState(() {
      suhuRuang1 = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedApiRuang2(Event event) {
    setState(() {
      apiRuang2 = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedSuhuRuang2(Event event) {
    setState(() {
      suhuRuang2 = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedGasRuang2(Event event) {
    setState(() {
      gasRuang2 = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedApiRuang3(Event event) {
    setState(() {
      apiRuang3 = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedSuhuRuang3(Event event) {
    setState(() {
      suhuRuang3 = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedPintuDaruratBelakang(Event event) {
    setState(() {
      daruratBelakang = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedPintuDaruratDepan(Event event) {
    setState(() {
      daruratDepan = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedPompaAir(Event event) {
    setState(() {
      pompaAir = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedKipasPembuangan(Event event) {
    setState(() {
      kipasPembuangan = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  _onEntryChangedRuangKebakaran(Event event) {
    setState(() {
      ruangKebakaran = DataResource.fromSnapShot(event.snapshot).value;
    });
  }

  Widget _buildRoomCard(
      String title, String temperature, String fire, Color mainColor) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final fontStyle = TextStyle(color: Colors.white);
    if (temperature != null) {
      temperature = temperature.substring(0, 1);
    } else {
      temperature = '';
    }
    fire = fire == "Api terdeteksi" ? "Ada" : "Tidak ada";
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
                    temperature + '°C',
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
                          gasRuang2 != null ? gasRuang2 : '',
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

  Widget _buildChildActuator(String title, String status) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final fontStyle = TextStyle(color: Colors.white, fontSize: 12);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 0.46 * deviceWidth,
      height: 0.3 * deviceWidth,
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
            title,
            style: fontStyle,
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: deviceWidth * 0.05,
          ),
          Text(
            status != null ? status : '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
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
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildChildActuator('Pompa Air', pompaAir),
              _buildChildActuator('Kipas Pembuangan', kipasPembuangan)
            ],
          ),
          SizedBox(
            height: deviceWidth * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildChildActuator('Pintu Darurat Depan', daruratDepan),
              _buildChildActuator('Pintu Darurat Belakang', daruratBelakang),
            ],
          )
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
                  color: ruangKebakaran == 'Ruangan 1'
                      ? Color(0xffd35656)
                      : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: deviceWidth * 0.4,
                height: deviceWidth * 0.4,
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                        color: ruangKebakaran == 'Ruangan 1'
                            ? Colors.white
                            : Colors.black,
                        fontSize: 28),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ruangKebakaran == 'Ruangan 2'
                      ? Color(0xffd35656)
                      : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: deviceWidth * 0.4,
                height: deviceWidth * 0.4,
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                        color: ruangKebakaran == 'Ruangan 2'
                            ? Colors.white
                            : Colors.black,
                        fontSize: 28),
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
                  color: ruangKebakaran == 'Ruangan 3'
                      ? Color(0xffd35656)
                      : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: deviceWidth * 0.4,
                height: deviceWidth * 0.4,
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                        color: ruangKebakaran == 'Ruangan 3'
                            ? Colors.white
                            : Colors.black,
                        fontSize: 28),
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
        _buildRoomCard('Ruangan 1', suhuRuang1, apiRuang1, Color(0xfff67280)),
        _buildRoomCard('Ruangan 2', suhuRuang2, apiRuang2, Color(0xffc06c84)),
        _buildRoomCard('Ruangan 3', suhuRuang3, apiRuang3, Color(0xff6c567b)),
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
            _buildHeader(_scaffoldKey),
            FirebaseMessagingInstance()
          ],
        ));
  }
}
