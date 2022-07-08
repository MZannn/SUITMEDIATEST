import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:suitmediatestquestion/screens/third_screen.dart';

import 'global_view_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.navigate_before,
            color: Color(0xff554AF0),
            size: 30,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Second Screen',
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF04021D)),
        ),
      ),
      body: Consumer<GlobalViewModel>(builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      value.name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                  child: Text(
                value.userName,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              )),
              SizedBox(
                width: double.infinity,
                height: 41,
                child: ElevatedButton(
                  child: Text(
                    "Choose a User",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThirdScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff2B637B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
