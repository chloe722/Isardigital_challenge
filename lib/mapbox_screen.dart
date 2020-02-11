import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:isardigital_challenge/service.dart';
import 'package:latlong/latlong.dart';
import 'package:rxdart/rxdart.dart';

import 'model.dart';

final String token = "pk.eyJ1IjoiY2hsb2U3MjJkIiwiYSI6ImNrNmkxdzI0czAxcjczbWxsd3NlemVqY2IifQ.8oT06blwjqCinx3VMl5ntQ";

class MapBoxScreen extends StatefulWidget {
  @override
  _MapBoxScreenState createState() => _MapBoxScreenState();
}

class _MapBoxScreenState extends State<MapBoxScreen> {

//  BehaviorSubject<Post> postData = BehaviorSubject<Post>()..add(null);

  Future<Post> post;

  List<Marker> _getAllMarkers() {
    //TODO create markers from data
    return testModel.map((e) => Marker(
      point: e.latLng,
      builder: (ctx) =>
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
            ),
            child: Center(child: Text(e.num.toString(),
              style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
          ),
    )).toList();
  }

  @override
  void initState() {
    post = fetchPost();
    super.initState();
  }


  @override
  void dispose() {
//    postData.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          //TODO change to StreamBuilder
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                print('${snapshot.data.title}');
                return FlutterMap(
                  options: MapOptions(
                    center: LatLng(51.1657, 10.4515),
                    zoom: 6.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate: "https://api.tiles.mapbox.com/v4/"
                          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                      additionalOptions: {
                        'accessToken': token,
                        'id': 'mapbox.streets',
                      },
                    ),
                    MarkerLayerOptions(
//                      maxClusterRadius: 120,
//                      size: Size(40,40),
//                      fitBoundsOptions: FitBoundsOptions(
//                        padding: EdgeInsets.all(50),
//                      ),
                      markers: _getAllMarkers(),
//                      polygonOptions: PolygonOptions(
//                        borderColor: Colors.blueAccent,
//                        color: Colors.black,
//                        borderStrokeWidth: 3,
//                      ),
//                      builder: (context, markers) {
//                        return FloatingActionButton(
//                          child: Text(markers.length.toString()),
//                          onPressed: null,
//                        );
//                      },
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }
          ),
        ),
      ),
    );
  }
}
