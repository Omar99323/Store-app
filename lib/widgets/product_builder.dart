import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_state.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/models/home_model.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({
    super.key,
    required this.model,
  });
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageCubit, HomepageStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
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
              Text(
                model.name,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
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
                        fontSize: 15,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  const Spacer(),
                  LikeButton(
                    size: 30,
                    likeBuilder: (isLiked) {
                      return CircleAvatar(
                        backgroundColor: BlocProvider.of<HomepageCubit>(context)
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
        );
      },
    );
  }
}
