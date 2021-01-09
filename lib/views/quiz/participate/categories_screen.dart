import 'package:flutter/material.dart';
import 'package:quizigma/models/category_item.dart';
import 'package:quizigma/models/categories.dart';
import 'package:google_fonts/google_fonts.dart';

/*This file takes data from categories.dart and shows them on screen. 
The user can choose a category and it will then bring them to a list
of quizzes for the selected category.*/

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        shadowColor: Colors.black,
        title: Text('Categories',
            style: GoogleFonts.cabin(
                color: Colors.white, fontWeight: FontWeight.w700)),
      ),
      body: GridView(
        primary: false,
        padding: const EdgeInsets.all(20),
        children: CATEGORIES
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
