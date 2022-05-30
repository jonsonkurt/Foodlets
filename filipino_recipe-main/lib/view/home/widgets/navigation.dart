import 'package:filipino_recipe/view/home/home_view.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:filipino_recipe/model/recipe_hive.dart';
import 'package:filipino_recipe/provider/category_provider.dart';
import 'package:filipino_recipe/provider/home_provider.dart';
import 'package:filipino_recipe/provider/search_provider.dart';
import 'package:filipino_recipe/view/home/home_view.dart';
import 'package:filipino_recipe/view/favorites/favorites_view.dart';
import 'package:filipino_recipe/view/home/widgets/about.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    FavoritesView(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 236, 223, 1),
      appBar: AppBar(
        title: const Icon(
          Icons.restaurant_menu,
          size: 40,
          color: Color.fromRGBO(53, 93, 58, 1),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          PopupMenuButton(
            icon: Container(
              margin: const EdgeInsets.only(left: 30),
              padding: const EdgeInsets.all(0),
              child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://media.discordapp.net/attachments/965609625309302794/980670217506148352/Foodlets.jpg?width=593&height=593')),
            ),
            iconSize: 100,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Logout"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print("Logout.");
              }
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(0)),
          color: const Color.fromRGBO(53, 93, 58, 1),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[300]!,
              gap: 1,
              activeColor: const Color.fromRGBO(53, 93, 58, 1),
              iconSize: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: const Color.fromRGBO(238, 236, 223, 1),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.star,
                  text: 'Favorites',
                ),
                GButton(
                  icon: Icons.info,
                  text: 'Info',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
