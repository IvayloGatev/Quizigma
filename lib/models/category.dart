import 'package:flutter/material.dart';

// A class, which stores information about the quiz category.
class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.white,
  });
}
