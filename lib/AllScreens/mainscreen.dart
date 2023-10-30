import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ridesharing_personal/AllWidgets/divider.dart';

class MainScreen extends StatelessWidget {
  static const String idScreen = "/mainscreen";

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Screen',
          style: TextStyle(
            fontSize: 30
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller){
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;
            },
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 320.0,
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
                    SizedBox(height: 10.0,),
                    Row(
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
                    SizedBox(height: 10.0,),
                    DividerWidget(),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Icon(Icons.home, color: Colors.grey,),
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
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}