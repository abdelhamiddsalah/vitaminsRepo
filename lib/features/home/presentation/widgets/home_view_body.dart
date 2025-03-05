import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/routing/routes.dart';
import 'package:vitamins/core/styles/text_styles.dart';
import 'package:vitamins/features/home/presentation/cubits/fetchdealproducts/cubit/fetxhdealproducts_cubit.dart';
import 'package:vitamins/features/home/presentation/cubits/fetchdealproducts/cubit/fetxhdealproducts_state.dart';
import 'package:vitamins/features/home/presentation/widgets/item_body_inhome.dart';
import 'package:vitamins/features/home/presentation/widgets/rowtexts_in_homepae.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchDealProductsCubit()..fetchProducts(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _HeaderSection(),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Rowtextsinhomepage(
                    text1: 'All Products',
                    text2: 'View',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.productspage);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Image.asset(
                    Assets.imagesHomeOfferImageSection,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 20.0),
                  const Rowtextsinhomepage(
                    text1: 'Deal of the day',
                    text2: 'View all',
                  ),
                  const SizedBox(height: 20.0),
                  const _DealProductsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(Assets.imagesRectangle, fit: BoxFit.fill),
        ),
        Positioned(
          top: 20.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 120.0,
          left: 20.0,
          right: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Rahul',
                style: TextStyles.textinhomestack.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                'Welcome to Nilkanth Medical Store',
                style: TextStyles.textinhomestack,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DealProductsSection extends StatelessWidget {
  const _DealProductsSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDealProductsCubit, FetchDealProductsState>(
      builder: (context, state) {
        if (state is FetchDealProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchDealProductsLoaded) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.9,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ItemBodyInHome(product: state.products[index]);
            },
          );
        } else if (state is FetchDealProductsError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('No data'));
      },
    );
  }
}
