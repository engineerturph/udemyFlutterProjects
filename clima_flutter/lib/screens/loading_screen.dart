import 'package:flutter/material.dart';
import  'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter/services/weather.dart';


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
    var weatherData = await WeatherModel().getLocationWeather();


    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
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
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
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
