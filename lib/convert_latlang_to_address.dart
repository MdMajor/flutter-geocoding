
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  _ConvertLatLangTotAddressState createState() => _ConvertLatLangTotAddressState();
}

class _ConvertLatLangTotAddressState extends State<ConvertLatLangToAddress>{

  String stAddress = '';
  String stAdd = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(stAddress),
          Text(stAdd),
          GestureDetector(
            onTap: ()async{
              //from a query
              List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");

              List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
              setState(() {
                stAddress = locations.last.longitude.toString()+" "+locations.last.latitude.toString();

                stAdd = "${placemarks.reversed.last.country} ${placemarks.reversed.last.locality}";
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: Center(
                  child: Text('Convert'),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}