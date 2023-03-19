import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/widgets/category_builder.dart';
import '../../cubits/homepage_cubit/homepage_cubit.dart';
import '../../cubits/homepage_cubit/homepage_state.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageCubit, HomepageStates>(
      builder: (context, state) {
        var catmodel =
            BlocProvider.of<HomepageCubit>(context).categoriesResponseModel;
        return state is HomepageError
            ? Center(
                child: Text(
                  state.error,
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1 / 1,
                ),
                itemCount: catmodel!.data.categories.length,
                itemBuilder: (context, index) => CategoryBuilder(
                  model: catmodel.data.categories[index],
                ),
              );
      },
    );
  }
}
