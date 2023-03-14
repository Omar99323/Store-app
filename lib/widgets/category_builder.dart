import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/categories_model.dart';
import '../cubits/homepage_cubit/homepage_cubit.dart';
import '../cubits/homepage_cubit/homepage_state.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({
    super.key,
    required this.model,
  });
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageCubit, HomepageStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: Image.network(
                  model.image,
                ),
              ),
              Text(
                model.name,
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
