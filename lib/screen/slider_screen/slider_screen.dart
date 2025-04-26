import 'package:flutter/material.dart';
import 'package:task_api_leaning_for_project/widgets/app_slider/app_slider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomImageSlider(
              imageUrls: [
                'https://picsum.photos/id/1015/400/300',
                'https://picsum.photos/id/1016/400/300',
                'https://picsum.photos/id/1018/400/300',
              ],
            ),
          ),
        ],
      ),
    );
  }
}
