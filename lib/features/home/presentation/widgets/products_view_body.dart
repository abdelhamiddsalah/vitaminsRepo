import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitamins/features/home/presentation/cubits/fetchcategories/cubit/fetchcategories_cubit.dart';
import 'package:vitamins/core/widgets/title_in_pages.dart';
import 'package:vitamins/features/home/presentation/widgets/item_body_inhome.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_outlined),
              ),
              const SizedBox(height: 10),
              const Titleinpages(text1: 'Categories'),
              const SizedBox(height: 10),
              BlocBuilder<FetchcategoriesCubit, FetchcategoriesState>(
                builder: (context, state) {
                  if (state is FetchcategoriesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FetchcategoriesError) {
                    return Center(child: Text(state.message));
                  } else if (state is FetchcategoriesLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: state.categories.map((category) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 5,
                                offset: const Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Image.network(category.image),
                              Text(category.name.toString()),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 30),
              const Titleinpages(text1: 'All Products'),
              const SizedBox(height: 10),
              BlocBuilder<FetchcategoriesCubit, FetchcategoriesState>(
                builder: (context, state) {
                  if (state is FetchcategoriesLoaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ItemBodyInHome(product: state.products[index]);
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
