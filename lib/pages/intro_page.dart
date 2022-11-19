import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
//
// LOGO-------------------------------------------------------------------------
//
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80.0, bottom: 80.0, top: 160.0),
            child: Image.asset('lib/images/avocado.png'),
          ),
//
// Text heading-----------------------------------------------------------------
//
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
//
//subheading--------------------------------------------------------------------
//
          const SizedBox(height: 24),
          const Text("Fresh items everyday",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey)),
//------------------------------------------------------------------------------
          const Spacer(),
//------------------------------------------------------------------------------
//
//Start button------------------------------------------------------------------
//
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            )),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
//-----------------------------
          const Spacer(),
//-----------------------------
        ],
      ),
    );
  }
}
