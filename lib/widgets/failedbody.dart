import 'package:flutter/material.dart';

class FailedFetchWeather extends StatelessWidget {
  const FailedFetchWeather({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Please Check Your Network Connection Or Try Agin"),
    );
  }
}
