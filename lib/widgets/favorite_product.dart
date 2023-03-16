import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:like_button/like_button.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/helpers/consts.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({super.key, required this.model});

  final FavoriteModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: 120,
                width: 120,
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
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Spacer(),
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
                            fontSize: 15,
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
      ),
    );
  }
}
