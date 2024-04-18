import 'package:flutter/material.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget({
    super.key,
    required this.imagePath,
    required this.title, required this.onTap,
  });

  final String imagePath, title;
 
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation:
            5.0, // Set the elevation here. Adjust this value to increase or decrease the shadow.
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top:
                        -40, // Adjust this value to control how much the image should overlap
                    child: Image.asset(
                      imagePath,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top:
                            70.0), // Adjust value to make space for the overlapping image
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
