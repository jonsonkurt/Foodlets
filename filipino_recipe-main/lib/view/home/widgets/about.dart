import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final double coverHeight = 170;
  final double profileHeight = 130;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 236, 223, 1),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildLogoImage(),
        )
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: const Color.fromRGBO(238, 236, 223, 1),
        child: Image.network(
          'https://images.unsplash.com/photo-1536489885071-87983c3e2859?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildLogoImage() => Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(238, 236, 223, 1),
            borderRadius: const BorderRadius.all(Radius.circular(500.0)),
            border: Border.all(
              color: const Color.fromRGBO(238, 236, 223, 1),
              width: 5.0,
            )),
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: const Color.fromRGBO(238, 236, 223, 1),
          backgroundImage: const NetworkImage(
            'https://media.discordapp.net/attachments/965609625309302794/980670217506148352/Foodlets.jpg?width=593&height=593',
          ),
        ),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 15),
          Text('FOODLETS',
              style: GoogleFonts.inter(
                color: const Color(0xFF393738),
                fontSize: 35,
                fontWeight: FontWeight.w900,
              )),
          const SizedBox(height: 5),
          Text(
            'Filipino Recipe App',
            style: GoogleFonts.inter(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          buildAbout()
        ],
      );
  Widget buildAbout() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const SizedBox(height: 16),
            Text(
              'Foodlets is an Android application that provides users with simplified recipes that are easy to understand and easy to make. These recipes can be accessed even when the user is offline with the assistance of something that they carry with them all the time and therefore can access it at anyplace and any time. The system provides users with simplified recipes that are easy to understand and easy to make.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.inter(fontSize: 18, height: 1.2),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 65,
                  width: 1,
                ),
                buildSocialIcon(Icons.email),
                const SizedBox(
                  height: 30,
                  width: 1,
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildSocialIcon(IconData icon) => Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromARGB(255, 39, 71, 40),
              child: Center(
                  child: Icon(
                icon,
                size: 28,
                color: const Color.fromRGBO(238, 236, 223, 1),
              )),
            ),
            Text(
              '  FoodletsRecipes@gmail.com',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF393738),
              ),
            ),
          ],
        ),
      );
}
