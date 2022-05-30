import 'package:filipino_recipe/view/detail/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../model/recipe_hive.dart';
import '../../service/recipe_box.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 236, 223, 1),
      body: Align(
        child: SizedBox(
          height: 500,
          width: 400,
          child: ValueListenableBuilder<Box<RecipeHive>>(
            valueListenable: RecipeBox.getFavorties().listenable(),
            builder: (ctx, box, child) {
              final recipe = box.values.toList().cast<RecipeHive>();
              if (recipe.isNotEmpty) {
                return ListView.separated(
                  itemCount: recipe.length,
                  separatorBuilder: (ctx, i) => const Divider(height: 0.0),
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => DetailView(
                              recipe: recipe[i],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 2,
                          bottom: 15,
                          left: 20,
                          right: 20,
                        ),
                        height: 150,
                        width: 200,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(recipe[i].image,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              left: 280,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: IconButton(
                                      onPressed: () {
                                        recipe[i].delete();
                                      },
                                      icon: const Icon(Icons.star,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              top: 90,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 10,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    gradient: LinearGradient(
                                        // begin: Alignment.bottomCenter,
                                        // end: Alignment.topCenter,
                                        colors: [
                                          Colors.green.withOpacity(0.7),
                                          const Color.fromARGB(255, 39, 71, 40)
                                        ])),
                              ),
                            ),
                            Positioned(
                              bottom: 14,
                              left: 1,
                              right: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                    ),
                                    Text(
                                      recipe[i].name,
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 14,
                              left: 37,
                              child: Text(
                                'Cook time: ' + recipe[i].cookTime,
                                style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 4.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  3.0, 3.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('No Favorites added'));
              }
            },
          ),
        ),
      ),
    );
  }
}
