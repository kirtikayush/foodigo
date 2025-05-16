import 'package:flutter/material.dart';

import '../constants/variables.dart';
import 'FoodCard.dart';

class FoodAvailable extends StatefulWidget {
  final List<Map<String, dynamic>> favoritedItems;
  final void Function(Map<String, dynamic>) onFavoriteToggle;
  final String searchQuery;

  const FoodAvailable({
    super.key,
    required this.favoritedItems,
    required this.onFavoriteToggle,
    required this.searchQuery,
  });

  @override
  State<FoodAvailable> createState() => _FoodAvailableState();
}

class _FoodAvailableState extends State<FoodAvailable> {
  @override
  Widget build(BuildContext context) {
    final filteredItems =
        foodItems.where((item) {
          final title = item['title'].toLowerCase();
          return title.contains(widget.searchQuery.toLowerCase());
        }).toList();

    return Column(
      children: [
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            physics: const ScrollPhysics(),
            shrinkWrap: false,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
            children:
                filteredItems.map((item) {
                  return FoodCard(
                    title: item['title'],
                    subtitle: item['subtitle'],
                    rating: item['rating'],
                    image: item['image'],
                    description: item['description'],
                    deliveryTime: item['deliveryTime'],
                    price: item['price'],
                    isFavorited: widget.favoritedItems.contains(item),
                    onFavoriteToggle: () {
                      setState(() {
                        if (widget.favoritedItems.contains(item)) {
                          widget.favoritedItems.remove(item);
                        } else {
                          widget.favoritedItems.add(item);
                        }
                      });
                    },
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
