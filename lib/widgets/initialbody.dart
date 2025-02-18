import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page.dart';

class InitialBody extends StatelessWidget {
  const InitialBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              child: const Text('Get Weather'))
        ],
      ),
    );
  }
}
