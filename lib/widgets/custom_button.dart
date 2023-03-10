import 'package:flutter/material.dart';
import 'package:store_app/helpers/consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onpress,
    required this.buttonchild,
  });

  final void Function() onpress;
  final Widget buttonchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: maincolor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(context).size.height / 12,
      width: double.infinity,
      child: Center(
        child: MaterialButton(
          minWidth: double.infinity,
          height: MediaQuery.of(context).size.height / 13,
          onPressed: onpress,
          child:buttonchild ,
        ),
      ),
    );
  }
}
