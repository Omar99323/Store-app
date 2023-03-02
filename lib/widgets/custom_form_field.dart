import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.controler,
      required this.label,
      required this.starticon,
      this.endicon,
      required this.type,
      required this.validator,
      this.onsubmit,
      this.ontap,
      this.endIconOnPressed});

  final TextEditingController controler;
  final String label;
  final IconData starticon;
  final IconData? endicon;
  final TextInputType type;
  final String? Function(String?)? validator;
  final void Function(String)? onsubmit;
  final void Function()? ontap;
  final void Function()? endIconOnPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      validator: validator,
      keyboardType: type,
      onTap: ontap,
      onFieldSubmitted: onsubmit,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
        prefixIcon: Icon(starticon),
        suffixIcon: IconButton(
          icon: Icon(endicon),
          onPressed: endIconOnPressed,
        ),
      ),
    );
  }
}
