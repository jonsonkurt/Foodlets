import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/category_provider.dart';
import 'widgets/category_widget.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<CategoryProvider>().getRecipe(widget.category.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 236, 223, 1),
      body: CustomScrollView(
        slivers: [
          //AppBar
          SliverAppBar(
            backgroundColor: const Color.fromRGBO(238, 236, 223, 1),
            centerTitle: false,
            pinned: false,
            snap: false,
            floating: true,
            title: Text(
              widget.category,
              style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(53, 93, 58, 1)),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 5.0)),
          const CategoryRecipeWidget(),
        ],
      ),
    );
  }
}
