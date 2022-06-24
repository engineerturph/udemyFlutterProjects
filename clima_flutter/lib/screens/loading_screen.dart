import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Sadece ilk kuruldugunda calisir
  void initState() async {
    super.initState();
    Location location = Location();
    await location.getCurLocation();
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
