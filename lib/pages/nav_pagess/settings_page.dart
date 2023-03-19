import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_cubit.dart';
import 'package:store_app/cubits/app_cubit/whole_app_state.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_state.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/helpers/help_methods/logout.dart';
import 'package:store_app/helpers/help_methods/show_snackbar.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_form_field.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fkey = GlobalKey<FormState>();
    var namecontrol = TextEditingController();
    var emailcontrol = TextEditingController();
    var phonecontrol = TextEditingController();

    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return BlocConsumer<HomepageCubit, HomepageStates>(
          listener: (context, state) {
            if (state is UpdateProfileSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                snackmessage(
                  state.model.message,
                  Colors.green,
                ),
              );
            } else if (state is UpdateProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                snackmessage(
                  state.error,
                  Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            var appCubet = BlocProvider.of<WholeAppCubit>(context);
            var hpcbt = BlocProvider.of<HomepageCubit>(context);
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: fkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state is UpdateProfileLoading)
                          const LinearProgressIndicator(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          controler: namecontrol,
                          value: hpcbt.profilemodel!.data!.name,
                          starticon: Icons.account_box_rounded,
                          label: 'Name',
                          type: TextInputType.name,
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                          },
                          isPassword: false,
                          themecolor: appCubet.isdark ? white : dark,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomFormField(
                          controler: emailcontrol,
                          value: hpcbt.profilemodel!.data!.email,
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
                          controler: phonecontrol,
                          value: hpcbt.profilemodel!.data!.phone,
                          starticon: Icons.phone_android,
                          label: 'Phone Number',
                          type: TextInputType.phone,
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            }
                          },
                          isPassword: false,
                          themecolor: appCubet.isdark ? white : dark,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          onpress: () {
                            if (fkey.currentState!.validate()) {
                              hpcbt.updateProfile(
                                name: namecontrol.text,
                                email: emailcontrol.text,
                                phone: phonecontrol.text,
                              );
                            }
                          },
                          buttonchild: appCubet.isdark
                              ? Text(
                                  'Update Profile',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: white,
                                  ),
                                )
                              : Text(
                                  'Update Profile',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: dark,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                          onpress: () {
                            appCubet.changeAppTheme();
                          },
                          buttonchild: appCubet.isdark
                              ? Text(
                                  'Light Mode',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: white,
                                  ),
                                )
                              : Text(
                                  'Dark Mode',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: dark,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                          onpress: () {
                            logOut(context);
                          },
                          buttonchild: Text(
                            'LOGOUT',
                            style: TextStyle(
                              fontSize: 20,
                              color: appCubet.isdark ? white : dark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
