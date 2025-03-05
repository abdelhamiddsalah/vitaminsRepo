import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitamins/features/home/presentation/cubits/fetchcategories/categries_cubit.dart';
import 'package:vitamins/features/home/presentation/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CategriesCubit()..fetchCategories(),
          child: const ProductsViewBody(),
        ),
      ),
    );
  }
}
