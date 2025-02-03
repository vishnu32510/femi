import 'package:flutter/material.dart';

class TourismCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback callback;
  const TourismCard({super.key, required this.title, required this.image, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 5,
                  spreadRadius: 3)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                height: 120,
                width: 220,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
