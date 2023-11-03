import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ridesharing_personal/AllWidgets/divider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ridesharing_personal/configmaps.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "/mainscreen";

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  late GoogleMapController newGoogleMapController;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  late Position currentPosition;

  var geolocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Main Screen',
          style: TextStyle(
            fontSize: 30
          ),
        ),
      ),
      drawer:Container(
        color: Colors.white,
        width: 255,
        child: Drawer(
          child: ListView(
            children: [
              //Drawer header
              Container(
                height: 165,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset('images/user_icon.png', height: 65, width: 65,),
                      SizedBox(width: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Profile Name', style: TextStyle(fontSize: 15, fontFamily: "Brand-Bold"),),
                          SizedBox(height: 6,),
                          Text('Visit Profile'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              DividerWidget(),
              SizedBox(height: 30,),
              //Drawer Body
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History', style: TextStyle(fontSize: 15),),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Visit Profile', style: TextStyle(fontSize: 15),),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About', style: TextStyle(fontSize: 15),),
              ),
            ],
          )
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.45,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: MainScreen._kGooglePlex,
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  onMapCreated: (GoogleMapController controller){
                    _controllerGoogleMap.complete(controller);
                    newGoogleMapController = controller;

                    final apiKey = ConfigApis.googleMapsAPIKey;
                    locatePosition();
                  },
                ),
              ),
            ),
            //hamburguer Botton
            Positioned(
              top: 45,
              left: 20,
              child: GestureDetector(
                onTap:(){
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow:[
                      BoxShadow(
                        color:Colors.black,
                        blurRadius: 6,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      )
                    ]
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.menu, color: Colors.black,),
                    radius: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 400.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight:Radius.circular(18.0),),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                      offset: Offset(0.7,0.7),
                    )
                  ]
                ),
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0,),
                  child: ListView(
                    children: [
                      SizedBox(height: 6.0,),
                      Text('Hi There, ', style:TextStyle(fontSize: 12.0,),),
                      Text('Where to?, ', style:TextStyle(fontSize: 20.0, fontFamily: "Brands-Bpñd"),),
                      SizedBox(height: 20.0,),
                      Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                                offset: Offset(0.7,0.7),
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.blueAccent,),
                              SizedBox(width: 10.0,),
                              Text('Search Drop Off'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Icon(Icons.home, color: Colors.grey,),
                            SizedBox(width: 8.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Add Home'),
                                SizedBox(height: 4.0,),
                                Text('Your live home address',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      DividerWidget(),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Icon(Icons.work, color: Colors.grey,),
                            SizedBox(width: 12.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Add Work'),
                                SizedBox(height: 4.0,),
                                Text('Your office address',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0),)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
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