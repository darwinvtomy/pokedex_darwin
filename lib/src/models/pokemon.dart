import 'package:flutter/material.dart';
import 'dart:math';

final colors = [
  Colors.amber.shade50,
  Colors.blue.shade100,
  Colors.green.shade100,
  Colors.red.shade100,
  Colors.orange.shade100,
  Colors.lime.shade100,
  Colors.teal.shade100,
  Colors.lightGreen.shade100,
  Colors.purple.shade100,
  Colors.blue.shade100,
  Colors.indigo.shade100,
  Colors.yellow.shade100,
  Colors.cyan.shade100,
  Colors.brown.shade100
];
class Pokemon {
  String name;
  String url;
  String id;
  Color color;

  Pokemon({this.name, this.url, this.color });

  Pokemon.fromJson(Map<String, dynamic> json)  {
    final paths = json['url'].toString().split('/');
    var randomColorIndex = new Random().nextInt(colors.length);
    name = json['name'];
    url = json['url'];
    color = colors[randomColorIndex];
    id = paths[paths.length - 2].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['id'] = this.id;
    data['color'] = this.color;
    return data;
  }
}
