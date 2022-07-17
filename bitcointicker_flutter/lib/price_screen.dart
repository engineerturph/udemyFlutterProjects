import 'package:flutter/material.dart';
import 'package:bitcointicker_flutter/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'USD';
  int rateValue = 0;
  CoinData coinData = CoinData();

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in coinData.currenciesList) {
      dropdownItems.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        getData(currency: selectedCurrency);
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    List<Text> pickerItems = [];
    for (String currency in coinData.currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = pickerItems[selectedIndex].data;
        });
        getData(currency: pickerItems[selectedIndex].data);
      },
      children: pickerItems,
    );
  }

  void getData({String? currency = 'USD'}) async {
    var coinData = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=A011ADD2-E24F-471D-82FA-238DE572AABA'));
    var coinDataDecoded = json.decode(coinData.body);
    int result = coinDataDecoded['rate'].round();
    setState(() {
      rateValue = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $rateValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getCupertinoPicker(),
          ),
        ],
      ),
    );
  }
}
