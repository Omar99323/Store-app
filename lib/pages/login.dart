import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/login_cubit/login_cubit.dart';
import 'package:store_app/cubits/login_cubit/login_state.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/pages/register.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_form_field.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});
  static String id = 'LogInPage';

  @override
  Widget build(BuildContext context) {
    var emailcontrol = TextEditingController();
    var passwordcontrol = TextEditingController();
    var loginFormkey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: BlocConsumer<LogInCubit, LogInStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: loginFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
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
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                          onpress: () {
                            if (loginFormkey.currentState!.validate()) {
                              BlocProvider.of<LogInCubit>(context).userLogin(
                                email: emailcontrol.text,
                                password: passwordcontrol.text,
                              );
                            }
                          },
                          buttonchild: state is LogInLoadingState
                              ? CircularProgressIndicator(
                                  color: white,
                                )
                              : Text(
                                  'LOGIN',
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
                              'Don\'t have an account ?',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RegisterPage.id);
                              },
                              child: const Text('REGISTER'),
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
