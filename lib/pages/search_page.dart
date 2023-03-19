import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_cubit.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_state.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/widgets/custom_form_field.dart';
import 'package:store_app/widgets/search_product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static String id = 'SearchPage';

  @override
  Widget build(BuildContext context) {
    var searchFormkey = GlobalKey<FormState>();
    var searchcon = TextEditingController();
    var appCubet = BlocProvider.of<WholeAppCubit>(context);
    var hpCubet = BlocProvider.of<HomepageCubit>(context);
    return BlocBuilder<HomepageCubit, HomepageStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: searchFormkey,
              child: Column(
                children: [
                  CustomFormField(
                    controler: searchcon,
                    label: 'Search',
                    starticon: Icons.search,
                    type: TextInputType.text,
                    validator: (value)
                        // ignore: body_might_complete_normally_nullable
                        {
                      if (value!.isEmpty) {
                        return 'The field must not be empty';
                      }
                    },
                    isPassword: false,
                    themecolor: appCubet.isdark ? white : dark,
                    onsubmit: (p0) {
                      if (searchFormkey.currentState!.validate()) {
                        hpCubet.searchproducts(searchText: p0);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  state is SearchLoading
                      ? const Expanded(
                          child: Center(
                            child: LinearProgressIndicator(),
                          ),
                        )
                      : state is SearchSuccess
                          ? Expanded(
                              child: SizedBox(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: hpCubet.searchProducts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SearchProduct(
                                      model: hpCubet.searchProducts[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 20,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
