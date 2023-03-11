import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_state.dart';
import 'package:store_app/widgets/home_layout.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomepageCubit, HomepageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is HomepageLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is HomepageError
                ? Center(
                    child: Text(
                      state.error,
                    ),
                  )
                : state is HomepageSuccess
                    ? HomeLayout(
                        model: state.homeModel.data,
                      )
                    : const Center(
                        child: Text(
                          'Something went wrong',
                        ),
                      );
      },
    );
  }
}







