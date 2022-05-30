import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/recipe_hive.dart';
import '../../service/recipe_box.dart';

bool checkisFavorite(String id) {
  bool isInTheBox = false;
  for (var boxes in RecipeBox.getFavorties().values) {
    if (boxes.id == id) {
      isInTheBox = true;
      break;
    }
  }
  return isInTheBox;
}

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.recipe, this.isFeatured = false})
      : super(key: key);
  final RecipeHive recipe;
  final bool isFeatured;

  @override
  Widget build(BuildContext context) {
    final box = RecipeBox.getFavorties();
    bool isFavorite = checkisFavorite(recipe.id);

    return Scaffold(
      backgroundColor: const Color(0xFFEEECDF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFEEECDF),
            centerTitle: false,
            pinned: false,
            snap: false,
            floating: true,
            actions: [
              StatefulBuilder(
                builder: (ctx, setState) => IconButton(
                  // splashRadius: 30.0,
                  icon: isFavorite
                      ? const Icon(
                          Icons.star,
                          size: 30,
                          color: Color(0xFF355D3A),
                        )
                      : const Icon(
                          Icons.star_border,
                          size: 30,
                          color: Color(0xFF355D3A),
                        ),
                  onPressed: () {
                    if (!isFavorite) {
                      box.add(recipe);
                      setState(() {
                        isFavorite = checkisFavorite(recipe.id);
                      });
                    } else {
                      recipe.delete();
                      setState(() {
                        isFavorite = checkisFavorite(recipe.id);
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      if (isFeatured) ...[
                        Hero(
                          tag: recipe.name,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(40)),
                            child: Image(
                              height: 300.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(recipe.image),
                            ),
                          ),
                        ),
                      ] else ...[
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(40)),
                          child: Image(
                            height: 300.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(recipe.image),
                          ),
                        ),
                      ],
                      Container(
                        padding: EdgeInsets.only(top: 250),
                        child: Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.9),
                                      spreadRadius: -4,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  color: const Color(0xFF393738),
                                  child: SizedBox(
                                      width: 320,
                                      height: 110,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          // ignore: prefer_const_constructors
                                          Text(
                                            recipe.name,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.kitchen_rounded,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                  Text(
                                                    ' Prep Time: ' +
                                                        recipe.prepTime,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.schedule,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                  Text(
                                                    ' Cook Time: ' +
                                                        recipe.cookTime,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Column(
                    children: [
                      Align(
                        child: Container(
                          height: 35,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xFF355D3A)),
                          child: Align(
                              child: Text(
                            'Ingredients',
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  for (var ingredient in recipe.ingredients) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0, right: 45),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "•",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                ingredient,
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF393738)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0),
                  ],
                  const SizedBox(height: 20.0),
                  Column(
                    children: [
                      Align(
                        child: Container(
                          height: 35,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xFF355D3A)),
                          child: Align(
                              child: Text(
                            'Instructions',
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  for (int i = 0; i < recipe.instructions.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 45, right: 45),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${i + 1}.",
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF393738)),
                          ),
                          const SizedBox(width: 5.0),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                recipe.instructions[i],
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF393738)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
