import 'package:flutter/material.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  Widget build(BuildContext context) {
    // var cbt = BlocProvider.of<LogInCubit>(context);
    // var loginFormkey = GlobalKey<FormState>();
    var emailcontrol = TextEditingController();
    var passwordcontrol = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REGISTER',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Login now to browse our hot offers',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomFormField(
                  controler: emailcontrol,
                  starticon: Icons.email_outlined,
                  label: 'Email Address',
                  type: TextInputType.emailAddress,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                  }, isPassword: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  controler: passwordcontrol,
                  starticon: Icons.lock,
                  endicon: Icons.visibility,
                  endIconOnPressed: () {},
                  label: 'Password',
                  type: TextInputType.visiblePassword,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                  }, isPassword: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  buttonchild: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                  onpress: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('LOGIN'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
