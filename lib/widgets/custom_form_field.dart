import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controler,
    required this.label,
    required this.starticon,
    this.endicon,
    required this.type,
    required this.validator,
    this.onsubmit,
    this.ontap,
    this.endIconOnPressed,
    required this.isPassword,
    required this.themecolor,
    this.onchange,
  });

  final TextEditingController controler;
  final String label;
  final IconData starticon;
  final IconData? endicon;
  final bool isPassword;
  final TextInputType type;
  final Color themecolor;
  final String? Function(String?)? validator;
  final void Function(String)? onsubmit;
  final void Function(String)? onchange;
  final void Function()? ontap;
  final void Function()? endIconOnPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      validator: validator,
      keyboardType: type,
      obscuringCharacter: '*',
      obscureText: isPassword,
      onTap: ontap,
      onFieldSubmitted: onsubmit,
      onChanged: onchange,
      style: TextStyle(color: themecolor),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themecolor,
          ),
        ),
        label: Text(
          label,
          style: TextStyle(color: themecolor),
        ),
        prefixIcon: Icon(
          starticon,
          color: themecolor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            endicon,
            color: themecolor,
          ),
          onPressed: endIconOnPressed,
        ),
      ),
    );
  }
}
