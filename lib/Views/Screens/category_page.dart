import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/local_json_controller.dart';
import '../../Controller/quotes_title_controller.dart';
import '../../Controller/theme_controller.dart';
import '../../Models/category.dart';
import '../Utils/attributes.dart';
import '../Utils/databese_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<CategoryDatabaseModel>>? getalldata;
  LocalJsonController localjsoncontroller = Get.put(LocalJsonController());
  ThemeController _themeController = Get.put(ThemeController());

  final List<Color> ColorList = [
    Colors.cyan,
    Colors.pink,
    Colors.deepPurple,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blueAccent,
    Colors.orange,
    Colors.brown,
    Colors.indigo,
    Colors.teal,
    Colors.purple,
    Colors.yellowAccent,
    Colors.pinkAccent,
    Colors.blueGrey,
    Colors.tealAccent,
    Colors.lightGreenAccent,
    Colors.deepPurpleAccent
  ];

  List<String> imagePaths = [
    "assets/images/Motivation.png",
    "assets/images/Inspirational.png",
    "assets/images/Love.png",
    "assets/images/Friendship.png",
    "assets/images/Success.png",
    "assets/images/Happiness.png",
    "assets/images/Wisdom.png",
    "assets/images/Funny.png",
    "assets/images/Life.png",
    "assets/images/Strength.png",
    "assets/images/Hope.png",
    "assets/images/Faith.png",
    "assets/images/Family.png",
    "assets/images/Dream.png",
    "assets/images/Education.png",
    "assets/images/Time.png",
    "assets/images/Leadership.png",
    "assets/images/Change.png",
    "assets/images/Positive.png",
    "assets/images/Encouraging.png",
    "assets/images/Determination.png",
    "assets/images/Confidence.png",
    "assets/images/Self-Love.png",
    "assets/images/Growth.png",
    "assets/images/Patience.png",
    "assets/images/Heartbreak.png",
    "assets/images/Self-care.png",
    "assets/images/Mindset.png",
    "assets/images/Creativity.png",
  ];

  @override
  void initState() {
    super.initState();
    getalldata = DBHelper.dbHelper.fatchAllCategory();
  }

  TitleController titleController = Get.put(TitleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              accountName: const Text('John Doe'),
              accountEmail: const Text('johndoe@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                backgroundImage: NetworkImage(
                    "https://thumbs.dreamstime.com/b/portraitportrait-lion-sunglasses-wearing-suit-tie-standing-over-solid-green-background-generative-ai-portrait-285422048.jpg"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle drawer item tap for Home
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle drawer item tap for Settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Get.toNamed("/");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.list_rounded),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        title: const Text("Premium Quotes", style: TextStyle()),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () {
              // _themeController.toggleTheme();
              (Get.isDarkMode)
                  ? Get.changeTheme(ThemeData.light(useMaterial3: true))
                  : Get.changeTheme(ThemeData.dark(useMaterial3: true));
            },
            icon: const Icon(Icons.light),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed("/FvtScreen");
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
        // centerTitle: true,
      ),
      body: FutureBuilder(
        future: getalldata,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<CategoryDatabaseModel>? data = snapshot.data;
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("NO DATA AVAILABLE"),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(14),
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 40,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        titleController
                            .setCategoryName(data[index].category_name);
                        getAllQuotes = DBHelper.dbHelper
                            .fatchAllQuotes(id: data[index].id);
                        Get.toNamed("/second");
                      },
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.3,
                            decoration: BoxDecoration(
                              color: ColorList[index % ColorList.length]
                                  .withOpacity(0.35),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: ColorList[index % ColorList.length]
                                      .withOpacity(0.10),
                                  width: 8),
                            ),
                            child: Image.asset(
                              imagePaths[index % imagePaths.length],
                              scale: 10,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          Text(
                            data[index].category_name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
