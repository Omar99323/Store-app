import 'package:flutter/material.dart';
import '../models/onboard_model.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({
    super.key,
    required this.model,
  });

  static String id = 'OnBoardPage' ;

  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5,bottom: 100,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Image.asset(model.image),
            ),
          ),
          Text(
            model.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.body,
            style:Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
