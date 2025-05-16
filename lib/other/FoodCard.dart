import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProductPage.dart';

class FoodCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final double rating;
  final String? image;
  final String description;
  final String deliveryTime;
  final double price;
  final bool isFavorited;
  final VoidCallback onFavoriteToggle;

  const FoodCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.image,
    required this.description,
    required this.deliveryTime,
    required this.price,
    required this.isFavorited,
    required this.onFavoriteToggle,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  //bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ProductPage(
                  title: widget.title,
                  subtitle: widget.subtitle,
                  rating: widget.rating,
                  image: widget.image!,
                  description: widget.description,
                  deliveryTime: widget.deliveryTime,
                  price: widget.price,
                ),
          ),
        );
      },
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Center(
                child: Image.asset(widget.image!, fit: BoxFit.contain),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 14),
                            SizedBox(width: 4),
                            Text(widget.rating.toString()),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            widget.isFavorited
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color:
                                widget.isFavorited ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            widget.onFavoriteToggle();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
