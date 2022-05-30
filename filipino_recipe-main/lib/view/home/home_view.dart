import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';
import '../favorites/favorites_view.dart';
import 'widgets/categories_widget.dart';
import 'widgets/featured_widget.dart';
import 'widgets/recent_widget.dart';
import 'widgets/random_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView> {
  final sc = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().initRandom();
    init();
    sc.addListener(() {
      if (sc.offset >= sc.position.maxScrollExtent && !sc.position.outOfRange) {
        if (context.read<HomeProvider>().recent.length < 15) {
          context.read<HomeProvider>().getAdditionalRecent();
        }
      }
    });
  }

  Future<void> init() async {
    await context.read<HomeProvider>().getFeatured();
    await context.read<HomeProvider>().getRandom();
    await context.read<HomeProvider>().getCategory();
    await context.read<HomeProvider>().getRecent();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 236, 223, 1),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 25),
        child: RefreshIndicator(
          onRefresh: init,
          child: CustomScrollView(
            controller: sc,
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
              // App name
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 5.0),
                child: Text(
                  'Foodlets',
                  style: GoogleFonts.inter(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF393738)),
                ),
              )),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 0.0, bottom: 15),
                child: Text(
                  'Filipino Recipe App',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF393738)),
                ),
              )),
              // Featured
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Recipes for You',
                    // overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF393738)),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 185.0,
                  child: FeaturedWidget(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              // Random
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Consumer<HomeProvider>(
                    builder: (ctx, provider, child) {
                      return Text(
                        provider.listRecipe[provider.randomNum],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF393738)),
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 149.0,
                  child: RandomWidget(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 1.0)),
              // Category
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(
                    "Categories",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF393738)),
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.all(10.0),
                sliver: CategoriesWidget(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
