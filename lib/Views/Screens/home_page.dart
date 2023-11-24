import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_db_miner_pr/Views/Screens/quotes.dart';

import '../../Models/category.dart';
import '../Utils/list.dart';


class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int select = -1;
  String? sname;
  String? images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
        itemCount: 21,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              category c1 = category(
                  name: imagelist[i]['category'],
                  image: imagelist[i]['Image'],
                  id: imagelist[i]['id']);
              Get.to(quotes(), arguments: c1);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(
                    imagelist[i]['Image'],
                  ),fit: BoxFit.cover
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}