import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String? originalPrice; // Make originalPrice nullable
  final double rating;

  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    this.originalPrice, // Remove required keyword
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Color.fromARGB(255, 255, 253, 253),
        elevation: 7.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Stack(
          children: [
             Align(
                alignment: Alignment.center,
                child: Image.asset(imagePath,fit: BoxFit.cover,
                width: 100.0, 
                height: 100.0,),
              ),
            
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border, color: Colors.red),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(title,
                      style: GoogleFonts.pontanoSans(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(price,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.w500)),
                      if (originalPrice !=
                          null) // Only display if originalPrice is not null
                        Text(originalPrice!,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough)),
                      const SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.red, size: 20),
                          Text(rating.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
