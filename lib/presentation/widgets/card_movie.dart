import 'package:flutter/material.dart';
import 'package:mks_coding_movie/api/service.dart';
import 'package:mks_coding_movie/common/constants.dart';
import 'package:mks_coding_movie/models/movie.dart';

class CardMovie extends StatelessWidget {
  final Item item;
  CardMovie({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      width: 200.0,
      color: KBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Card(
              child: Image.network(
                item.image!,
                height: 200,
                // width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                left: 5.0,
                child: Image.asset(
                  'assets/logo.png',
                  height: 30.0,
                  width: 30.0,
                ))
          ]),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.info,
                size: 30.0,
              ),
              Icon(
                Icons.more_vert,
                size: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
