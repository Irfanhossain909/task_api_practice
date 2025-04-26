import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  const CustomImageSlider({super.key, required this.imageUrls});

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items:
              widget.imageUrls.map((url) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
          options: CarouselOptions(
            height: 170,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.imageUrls.asMap().entries.map((entry) {
                bool isActive = _currentIndex == entry.key;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 24 : 8, // active hole lamba, nahole chhoto
                  height: 8,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.blue : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(
                      8,
                    ), // rectangle with round edge
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
