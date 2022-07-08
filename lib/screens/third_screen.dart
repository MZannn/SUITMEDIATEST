import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'global_view_model.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<GlobalViewModel>(context, listen: false).getAllDataUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            size: 30,
            color: Color(0xff554AF0),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Third Screen',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF04021D)
          ),
        ),
      ),
      body: Consumer<GlobalViewModel>(builder: (context, value, child) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
          ),
          itemCount: value.alldataUser.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                value.changePeopleName(
                    '${value.alldataUser[index].firstName} ${value.alldataUser[index].lastName}',
                    context);
              },
              leading: Container(
                width: 49,
                height: 49,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://picsum.photos/200/${index + 200}',
                    ),
                  ),
                ),
              ),
              title: Text(
                '${value.alldataUser[index].firstName} ${value.alldataUser[index].lastName}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                value.alldataUser[index].email,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
