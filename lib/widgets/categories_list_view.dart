import 'category_card.dart';
import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(image: 'assets/images/sports.png', categoryName: 'Sports'),
    CategoryModel(image: 'assets/images/health.png', categoryName: 'Health'),
    CategoryModel(image: 'assets/images/science.png', categoryName: 'Science'),
    CategoryModel(image: 'assets/images/general.png', categoryName: 'General'),
    CategoryModel(image: 'assets/images/entertaiment.png',categoryName: 'Entertainment'),
    CategoryModel(image: 'assets/images/busniss.png', categoryName: 'business'),
    CategoryModel(image: 'assets/images/technology.png',categoryName: 'Technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
