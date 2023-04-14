import 'package:flutter/material.dart';
import 'package:mks_coding_movie/common/constants.dart';

class CardDetailMovie extends StatelessWidget {
  const CardDetailMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/movie.jpg',
            height: 300.0,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'The Glory',
                      style: kTitle,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '(2021)',
                      style: kTitle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text(
                      'Cast',
                      style: kHeading5,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Song Hye Kyo',
                      style: kSubtitle.copyWith(color: kMikadoYellow),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Ratings',
                  style: kHeading5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
