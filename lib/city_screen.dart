import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/city_background.jpg',),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8),BlendMode.dstATop),
            )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Icon(
                        Icons.arrow_back,
                        size: 40.0,
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    child:
                    Text(
                      "It's 🍦 time in San Francisco!",
                    style: kMessageTextStyle,
                    textAlign: TextAlign.right,
                    ),
                    onPressed: (){},

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}