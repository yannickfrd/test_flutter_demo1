import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context ) {
    return AppBar(
      leading: const IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black54,
            size: 20,
          ),
          onPressed: null
      ),
      centerTitle: true,
      title: Text(
        'Explore',
        style: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w800
        ),
      ),
      actions: const [
        IconButton(
            icon: Icon(
              Icons.favorite_outline_rounded,
              color: Colors.black54,
              size: 20,
            ),
            onPressed: null
        ),
        IconButton(
            icon: Icon(
              Icons.place,
              color: Colors.black54,
              size: 20,
            ),
            onPressed: null
        ),
      ],
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
