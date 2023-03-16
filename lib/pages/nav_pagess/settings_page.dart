import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_cubit.dart';
import 'package:store_app/cubits/app_cubit/whole_app_state.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_state.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/helpers/help_methods/logout.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_form_field.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var namecontrol = TextEditingController();
    var emailcontrol = TextEditingController();
    var phonecontrol = TextEditingController();
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return BlocBuilder<HomepageCubit, HomepageStates>(
          builder: (context, state) {
            var appCubet = BlocProvider.of<WholeAppCubit>(context);
            var hpcbt = BlocProvider.of<HomepageCubit>(context);
            namecontrol.text = hpcbt.profilemodel!.data!.name;
            emailcontrol.text = hpcbt.profilemodel!.data!.email;
            phonecontrol.text = hpcbt.profilemodel!.data!.phone;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFormField(
                      controler: namecontrol,
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
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
