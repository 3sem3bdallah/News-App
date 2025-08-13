import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/widgets/news_list_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey.shade100,
        title: Text(
          category.categoryName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [NewsListView(category: category.categoryName)],
        ),
      ),
    );
  }
}
