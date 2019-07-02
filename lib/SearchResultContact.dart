import 'package:barber/Objects/SearchResultObjects.dart';
import 'package:barber/BarberFromFirebase.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchResultContact extends StatefulWidget {
  final Barber barber;
  _SearchResultContactState createState() => _SearchResultContactState();

  SearchResultContact({Key key, this.barber}) : super(key: key);
}

class _SearchResultContactState extends State<SearchResultContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchResultObjects.getTopLabel("Contact details"),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8, top: 8),
              child: Text(
                widget.barber.name,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8),
              child: Text(
                widget.barber.address,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                widget.barber.phone,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(54.9069, -1.3838),
                  zoom: 13
                ),
                markers: _getMarkers(),
              ),
            ),
          ),
        )
      ],
    );
    }

    Set<Marker> _getMarkers(){
      return <Marker>[
        Marker(markerId: MarkerId('Marker_1'),
        position: LatLng(54.907,-1.383)),
        
      ].toSet();
    }

}
