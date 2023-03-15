import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_state.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/models/home_model.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageCubit, HomepageStates>(
      builder: (context, state) {
        List<ProductModel> likedProducts =
            BlocProvider.of<HomepageCubit>(context).favoriteProducts;
        return Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: likedProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return FavoriteProduct(
                model: likedProducts[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
          ),
        );
      },
    );
  }
}

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({super.key, required this.model});

  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(model.image),
            ),
            if (model.discount != 0)
              Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    'DISCOUNT',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      '${model.price.toString()}' r'$',
                      style: TextStyle(
                        color: maincolor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (model.discount != 0)
                      Text(
                        '${model.oldprice.toString()}' r'$',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const Spacer(),
                    LikeButton(
                      size: 30,
                      likeBuilder: (isLiked) {
                        return CircleAvatar(
                          backgroundColor:
                              BlocProvider.of<HomepageCubit>(context)
                                      .allProductsFavorites[model.id]!
                                  ? maincolor
                                  : Colors.grey,
                          child: Icon(
                            Icons.thumb_up_alt_rounded,
                            color: BlocProvider.of<HomepageCubit>(context)
                                    .allProductsFavorites[model.id]!
                                ? white
                                : dark,
                          ),
                        );
                      },
                      onTap: (isLiked) async {
                        BlocProvider.of<HomepageCubit>(context)
                            .addOrDeleteFavorite(model.id, context);
                        return !isLiked;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
