import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location.dart';
import 'maps.dart';

class Initialise extends StatefulWidget {
  const Initialise({super.key});

  @override
  State<Initialise> createState() => _InitialiseState();
}

class _InitialiseState extends State<Initialise> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    getLocation();
   
  }

  void getLocation() async {
    await location.getCurrentLocation();
     // ignore: use_build_context_synchronously
     Navigator.push(context, MaterialPageRoute(builder: (context) => Maps(location.latitude,location.longitude) ));
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(color: Colors.black),
      ),
    );
  }
}
