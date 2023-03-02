import 'package:flutter/material.dart';
import '../models/onboard_model.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({
    super.key,
    required this.model,
  });
  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 80,
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
