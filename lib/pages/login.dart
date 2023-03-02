import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LOGIN',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'login now to browse our hot offers',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            
          ],
        ),
      ),
    );
  }
}
