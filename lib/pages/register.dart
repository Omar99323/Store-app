import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_cubit.dart';
import 'package:store_app/cubits/register_cubit/register_cubit.dart';
import 'package:store_app/cubits/register_cubit/register_state.dart';
import 'package:store_app/pages/login.dart';
import 'package:store_app/widgets/custom_form_field.dart';
import 'package:store_app/widgets/custom_button.dart';
import '../helpers/show_snackbar.dart';
import 'package:store_app/helpers/consts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  Widget build(BuildContext context) {
    var registerFormkey = GlobalKey<FormState>();
    var emailcontrol = TextEditingController();
    var passwordcontrol = TextEditingController();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(snackmessage(
              state.succesMsg,
              Colors.green,
            ));
            Navigator.pushNamed(context, LogInPage.id);
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(snackmessage(
              state.error,
              Colors.red,
            ));
          }
        },
        builder: (context, state) {
          var appCubet = BlocProvider.of<WholeAppCubit>(context);
          var registerCbt = BlocProvider.of<RegisterCubit>(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: registerFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'Register now to our community',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                          },
                          isPassword: false,
                          themecolor: appCubet.isdark ? white : dark,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomFormField(
                          controler: passwordcontrol,
                          starticon: Icons.lock,
                          endicon: registerCbt.visablity,
                          endIconOnPressed: () {
                            registerCbt.changePasswordVisability();
                          },
                          label: 'Password',
                          type: TextInputType.visiblePassword,
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                          },
                          isPassword: registerCbt.isPass,
                          themecolor: appCubet.isdark ? white : dark,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                          onpress: () {
                            if (registerFormkey.currentState!.validate()) {
                              registerCbt.userRegister(
                                email: emailcontrol.text,
                                password: passwordcontrol.text,
                                name: 'oar2',
                                phone: '01010101010564846846',
                              );
                            }
                          },
                          buttonchild: state is RegisterLoadingState
                              ? CircularProgressIndicator(
                                  color: white,
                                )
                              : Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: white,
                                  ),
                                ),
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
            ),
          );
        },
      ),
    );
  }
}
