import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/book_details/presentation/ui/book_details_screen.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/home/models/books_model.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/widgets/banner.dart';
import 'package:bookia/features/home/presentation/ui/widgets/book_card.dart';
import 'package:bookia/features/home/presentation/ui/widgets/home_header.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onNavigateToCart;
  const HomeScreen({super.key, this.onNavigateToCart});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8F9),
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(),

              20.verticalSpace,

              const HomeBanner(),

              30.verticalSpace,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Best Seller',
                    style: AppTextStyles.dmRegular24.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),

              12.verticalSpace,

              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is GetBestSellerLoading ||
                      current is GetBestSellerSuccess ||
                      current is GetBestSellerError,
                  builder: (context, state) {
                    if (state is GetBestSellerLoading) {
                      return Skeletonizer(
                        enabled: true,
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.67,
                                mainAxisSpacing: 14.h,
                                crossAxisSpacing: 12.w,
                              ),
                          itemBuilder: (context, index) => BookCard(
                            product: Products(
                              name: 'name',
                              price: '33',
                              image: 'https://i.pinimg.com/1200x/53/d6/93/53d69362d28551bcaf218d064224c474.jpg',
                            ),
                            isFavorite: false,
                          ),
                        ),
                      );
                    } else if (state is GetBestSellerSuccess) {
                      final products = state.products ?? [];

                      if (products.isEmpty) {
                        return const Center(child: Text('No books found'));
                      }

                      return BlocBuilder<WishlistCubit, WishlistState>(
                        builder: (context, wishlistState) {
                          final wishlistProducts =
                              wishlistState is WishlistSuccess
                              ? wishlistState.wishlistData?.products ?? []
                              : [];

                          return GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.67,
                                  mainAxisSpacing: 14.h,
                                  crossAxisSpacing: 12.w,
                                ),
                            itemBuilder: (context, index) {
                              final product = products[index];

                              final isFavorite = wishlistProducts.any(
                                (item) => item.id == product.id,
                              );

                              return BookCard(
                                product: product,
                                isFavorite: isFavorite,
                                onTap: () {
                                  final productId = product.id;

                                  if (productId == null) return;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                            productId: productId,
                                          ),
                                    ),
                                  );
                                },

                                onBuy: () async {
                                  final productId = product.id;
                                  if (productId == null) return;

                                  final success = await context
                                      .read<CartCubit>()
                                      .addToCart(productId);

                                  if (!context.mounted) return;

                                  if (success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Book added to cart successfully',
                                        ),
                                      ),
                                    );

                                    onNavigateToCart?.call();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Failed to add book to cart',
                                        ),
                                      ),
                                    );
                                  }
                                },

                                onAddToWishlist: () async {
                                  final productId = product.id;
                                  if (productId == null) return;

                                  final cubit = context.read<WishlistCubit>();

                                  final success = isFavorite
                                      ? await cubit.removeFromWishlist(
                                          productId,
                                        )
                                      : await cubit.addToWishlist(productId);

                                  if (!context.mounted) return;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        success
                                            ? (isFavorite
                                                  ? 'Book removed from Wishlist'
                                                  : 'Book added to Wishlist successfully')
                                            : 'Wishlist operation failed',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('Failed to load books'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
