import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodigo/other/Favourite_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/variables.dart';
import 'other/CategorySelector.dart';
import 'other/FoodList.dart';
import 'other/Profile.dart';
import 'other/nav_icon.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> favoritedItems = [];
  String searchQuery = '';

  void toggleFavorite(Map<String, dynamic> item) {
    setState(() {
      if (favoritedItems.contains(item)) {
        favoritedItems.remove(item);
      } else {
        favoritedItems.add(item);
      }
    });
  }

  void _handleTap(int index) async {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        break; // Already on HomePage
      case 1:
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Profile()),
        );
        break;
      case 2:
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => Scaffold(
                  appBar: AppBar(title: Text('Chat')),
                  body: Center(child: Text('Chat Page')),
                ),
          ),
        );
        break;
      case 3:
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FavoritesPage(favorites: favoritedItems),
          ),
        );
        break;
    }
    setState(() {
      selectedIndex = 0;
    });
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // FAB with circular red border
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        elevation: 8,
        shape: const CircleBorder(
          side: BorderSide(color: Color(0xFFEF2A39), width: 2),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 13.0,
        color: const Color(0xFFEF2A39),
        elevation: 10,
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavIcon(
                index: 0,
                selectedIndex: selectedIndex,
                onTap: _handleTap,
              ),
              NavIcon(
                index: 1,
                selectedIndex: selectedIndex,
                onTap: _handleTap,
              ),
              const SizedBox(width: 48),
              NavIcon(
                index: 2,
                selectedIndex: selectedIndex,
                onTap: _handleTap,
              ),
              NavIcon(
                index: 3,
                selectedIndex: selectedIndex,
                onTap: _handleTap,
              ),
            ],
          ),
        ),
      ),

      // Body with top SafeArea and scrollable content
      body: SafeArea(
        top: true,
        bottom: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;
            double scaledFontSize = screenWidth * 0.05;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenHeight * (28 / figmaHeight),
              ),
              child: Column(
                children: [
                  // Top-centered title
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            'Foodigo',
                            style: GoogleFonts.lobster(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 40,
                                color: Color(0xff3C2F2F),
                              ),
                            ),
                          ),
                          Text(
                            'Order your favourite food!',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: const Color(0xff6A6A6A),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset(
                            'images/HomePage/image8.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30), // More content here...
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: screenWidth * (305 / figmaWidth),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.search,
                                color: Color(0xff3C2F2F),
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      searchQuery = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff3C2F2F),
                                      ),
                                    ),
                                  ),
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3C2F2F),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: IconButton(
                          onPressed: () {
                            // TODO: Implement filter/sorting functionality
                          },
                          icon: Icon(
                            CupertinoIcons.slider_horizontal_3,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  CategorySelector(),
                  SizedBox(height: 25),
                  Expanded(
                    child: FoodAvailable(
                      favoritedItems: favoritedItems,
                      onFavoriteToggle: toggleFavorite,
                      searchQuery: searchQuery,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
