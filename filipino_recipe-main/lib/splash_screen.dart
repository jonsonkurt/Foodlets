import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:filipino_recipe/view/home/widgets/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Navigation(),
      duration: 3000,
      imageSize: 300,
      imageSrc:
          "https://media.discordapp.net/attachments/965609625309302794/980670217506148352/Foodlets.jpg?width=593&height=593",
      backgroundColor: const Color(0xFF393738),
    );
  }
}

// class LoginSignup extends StatefulWidget {
//   const LoginSignup({Key? key}) : super(key: key);

//   @override
//   _LoginSignup createState() => _LoginSignup();
// }

// class _LoginSignup extends State<LoginSignup> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: const BoxConstraints.expand(),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(
//               "https://media.discordapp.net/attachments/965609625309302794/980373162887888906/login_bg.jpg?width=395&height=593"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           alignment: Alignment.center,
//           children: [
//             //
//             // "Tara Kain Tayo!" text
//             Positioned(
//               bottom: 170,
//               left: 50,
//               child: Text(
//                 "Tara\nKain Tayo!",
//                 style: GoogleFonts.inter(
//                     fontSize: 48,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
