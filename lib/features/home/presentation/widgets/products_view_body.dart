import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitamins/features/home/presentation/cubits/fetchcategories/categries_cubit.dart';
import 'package:vitamins/core/widgets/title_in_pages.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            BlocBuilder<CategriesCubit, CategriesState>(
              builder: (context, state) {
                if (state is CategriesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategriesError) {
                  return Center(child: Text(state.message));
                } else if (state is CategriesLoaded) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: state.categories.map((category) {
                      return Container(
                        width: 100,
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                                ),
                              child: Text(category.name.toString()),
                            ),
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
         /*   BlocBuilder<FetxhdealproductsCubit, FetxhdealproductsState>(
              builder: (context, state) {
                if (state is FetxhdealproductsLoaded) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: state.products,
                    itemBuilder: (context, index) {
                      return ItemBodyInHome(product: state.products[index]);
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
