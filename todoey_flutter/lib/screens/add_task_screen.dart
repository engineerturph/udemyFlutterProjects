import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.callBackFunction});
  void Function(String value)? callBackFunction;
  String? innerText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        height: 300.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300),
              ),
              TextField(
                onChanged: (value) {
                  innerText = value;
                },
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: TextButton(
                  onPressed: () {
                    callBackFunction!(innerText!);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.lightBlueAccent),
                    width: double.infinity,
                    height: 60.0,
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
