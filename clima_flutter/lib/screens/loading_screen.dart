import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const apiKey = '348095a05a97f48edcfb11be35556758';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Sadece ilk kuruldugunda calisir
  double? latitude;
  double? longitude;

  void initState() async {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }


  @override
  Widget build(BuildContext context) {
    String myMargin = 'abc';
    double? myMarginAsADouble;
    try {
      myMarginAsADouble = double.parse(myMargin);
    } catch (e) {
      print(e);
    }
    //widget her yeniden uretildiginde calisir
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsADouble ?? 30),
        color: Colors.red,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Get Location'),
        ),
      ),
    );
  }
}

//Sadece state yok edildiginde calisir
// void deactivate() {
//   super.deactivate();
//   print('deactivate called');
// }
