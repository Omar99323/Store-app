import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_state.dart';
import 'package:store_app/widgets/favorite_product.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var favcbt = BlocProvider.of<HomepageCubit>(context);
    return BlocBuilder<HomepageCubit, HomepageStates>(
      builder: (context, state) {
        return state is GetFavoritesLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: favcbt.favoriteProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FavoriteProduct(
                      model: favcbt.favoriteProducts[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                ),
              );
      },
    );
  }
}
