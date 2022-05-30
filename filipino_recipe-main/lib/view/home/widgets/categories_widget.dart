import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../provider/home_provider.dart';
import '../../category/category_view.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    if (provider.categoryState == CategoryState.loading) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 4,
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    } else if (provider.categoryState == CategoryState.error) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 4,
          child: const Center(child: Text('Error getting data')),
        ),
      );
    } else {
      List picture = [
        "https://cdn.discordapp.com/attachments/965609625309302794/979248786037678090/unknown_1.png",
        "https://media.discordapp.net/attachments/965609625309302794/979248787082055680/unknown_5.png",
        "https://media.discordapp.net/attachments/965609625309302794/979261391976411186/icons8-cheesecake-96.png",
        "https://media.discordapp.net/attachments/965609625309302794/979248786817839204/unknown_4.png",
        "https://media.discordapp.net/attachments/965609625309302794/979086208003088404/unknown.png",
        "https://media.discordapp.net/attachments/965609625309302794/979248786616504340/unknown_3.png",
      ];

      List color = [
        Color(0xFFADE8C8),
        Color(0xFFDED0A5),
        Color(0xFFFFF6E1),
        Color(0xFFF3CFCB),
        Color(0xFFFCB585),
        Color(0xFFB7E0EF),
      ];
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: 1.6625,
        ),
        delegate: SliverChildBuilderDelegate(
          (ctx, i) {
            return Ink(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => CategoryView(
                        category: provider.category[i].name,
                      ),
                    ),
                  );
                },
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 100,
                    width: 150,
                    child: Card(
                        color: color[i],
                        elevation: 5,
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          picture[i],
                          width: 25,
                          height: 25,
                        )),
                  ),
                ]),
              ),
            );
          },
          childCount: provider.category.length,
          addAutomaticKeepAlives: true,
        ),
      );
    }
  }
}
