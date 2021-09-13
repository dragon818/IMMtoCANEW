import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class TopSwiper extends StatelessWidget {
  const TopSwiper({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 9 / 16,
      width: MediaQuery.of(context).size.width,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        autoplay: true,
      ),
    );
  }
}
