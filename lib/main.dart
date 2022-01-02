import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_demo_1/Presenter/widget/my_app_bar.dart';
import 'package:flutter_demo_1/Presenter/controller/home_controller.dart';

// ignore: constant_identifier_names
const Color d_green = Color(0xFF54D3C2);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels booking',
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
       body: SingleChildScrollView(
         child: Column(
           children: const [
             SearchSection(),
             HotelSection(),
           ],
         ),
       )
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: const Offset(0,3)
                        )
                      ]
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'London',
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none
                      ),
                    ),
                  )
              ),

              const SizedBox(width: 10),

              Container(
                height: 50,
                width: 50,
                  decoration: const BoxDecoration(
                    color: d_green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 4)
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                child: ElevatedButton(
                  onPressed: null,
                  child: const Icon(
                    Icons.search,
                    size: 26,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    primary: d_green
                  ),
                ),
              )
            ],
          ),

           const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose date',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15
                      ),
                    ),
                    Text(
                        '12 Dec - 22 Dec',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 17
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Number of rooms',
                        style: GoogleFonts.nunito(
                          color: Colors.grey,
                          fontSize: 15
                        )
                    ),
                    Text(
                        '1 Room - 2 Adults',
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 17
                        ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
class HotelSection extends StatelessWidget {
  const HotelSection({Key? key}) : super(key: key);
  static final List hotelList = HomeController.getHotel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '550 hotels founds',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 15
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Filters',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 15
                      ),
                    ),
                    const IconButton(
                        onPressed: null,
                        icon: Icon(
                            Icons.filter_list_outlined,
                          color: d_green,
                        ),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList(),
          )
        ],
      ),
    );
  }
}
class HotelCard extends StatelessWidget {
  final Map hotelData;
  const HotelCard(this.hotelData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(18)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 4,
            blurRadius: 6,
            offset: const Offset(0, 3)
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage('assets/img/' + hotelData['picture']),
                fit: BoxFit.cover
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: -10,
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.favorite_outline_rounded,
                      color: d_green,
                      size: 20,
                    ),
                  )
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['title'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800
                  ),
                ),
                Text(
                  '\$ ' + hotelData['price'].toString(),
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['place'],
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                      color: d_green,
                      size: 14,
                    ),
                    Text(
                      hotelData['distance'].toString() + ' km to city',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                Text(
                  'per night',
                  style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
            child: Row(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_border,
                      color: d_green,
                      size: 14,
                    )
                  ],
                ),
                const SizedBox(width: 20),
                Text(
                  hotelData['review'].toString() + ' reviews',
                  style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}