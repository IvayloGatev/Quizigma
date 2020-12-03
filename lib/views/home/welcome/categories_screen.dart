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
        title: const Text('Quizigma Categories'),
        
      ),
      body: GridView(
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
