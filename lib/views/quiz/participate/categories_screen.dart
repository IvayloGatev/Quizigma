import 'package:flutter/material.dart';
import 'package:quizigma/models/category_item.dart';
import 'package:quizigma/models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        shadowColor: Colors.black,
        title: const Text('Categories'),
      ),
      body: GridView(
        primary: false,
        padding: const EdgeInsets.all(20),
        //crossAxisSpacing: 10,
        //mainAxisSpacing: 10,
        //crossAxisCount: 2,
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.title,
                catData.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
