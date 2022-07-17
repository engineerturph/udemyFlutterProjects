import 'package:flutter/material.dart';
import 'package:bitcointicker_flutter/coin_data.dart';
import 'package:flutter/cupertino.dart';
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
  List<Widget> paddings = [];

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
        getData(currency2: selectedCurrency);
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

        getPaddings();
      },
      children: pickerItems,
    );
  }

  Future<int> getData(
      {String? currency2 = 'USD', String? currency1 = 'BTC'}) async {
    var coinData = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$currency1/$currency2?apikey=$kApiKey'));
    var coinDataDecoded = json.decode(coinData.body);
    int result = coinDataDecoded['rate'].round();
    setState(() {
      rateValue = result;
    });
    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    getPaddings();
    super.initState();
  }

  void getPaddings() async {
    paddings = [];
    for (String currency in coinData.cryptoList) {
      await getData(currency1: currency, currency2: selectedCurrency);
      paddings.add(
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
                '1 $currency = $rateValue $selectedCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
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
          Column(
            children: paddings,
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
