import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:suitmediatestquestion/screens/global_view_model.dart';
import 'package:suitmediatestquestion/screens/second_screen.dart';
import 'package:suitmediatestquestion/widgets/widgets.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GlobalViewModel>(
        builder: (context, value, child) => Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 116,
                    width: 116,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image/ic_photo.png")),
                    ),
                  ),
                  sizedBoxHeight(58),
                  TextFormField(
                    controller: value.nameC,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Name",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16, color: const Color(0x6867775C)),
                      contentPadding: const EdgeInsets.only(
                        left: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  sizedBoxHeight(22),
                  TextFormField(
                    controller: value.polindromeC,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Palindrome",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16, color: const Color(0x6867775C)),
                      contentPadding: const EdgeInsets.only(
                        left: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  sizedBoxHeight(45),
                  SizedBox(
                    height: 41,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Check",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        value.isPolindrome(value.polindromeC.text, context);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF2B637B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  sizedBoxHeight(15),
                  SizedBox(
                    height: 41,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () async {
                        await value.changeName(value.nameC.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SecondScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF2B637B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
