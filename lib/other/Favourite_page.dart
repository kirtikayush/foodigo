import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FoodCard.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      body:
          favorites.isEmpty
              ? Center(
                child: Text(
                  'No favorites yet!',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
              : GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6, // adjust to match your FoodCard layout
                ),
                itemBuilder: (context, index) {
                  var item = favorites[index];
                  return FoodCard(
                    title: item['title'],
                    subtitle: item['subtitle'],
                    rating: item['rating'],
                    image: item['image'],
                    description: item['description'],
                    deliveryTime: item['deliveryTime'],
                    price: item['price'],
                    isFavorited: true,
                    onFavoriteToggle: () {
                      // Optional: remove from favorites if tapped here
                    },
                  );
                },
              ),
    );
  }
}
