import 'package:flutter/material.dart';
import 'package:mks_coding_movie/presentation/widgets/card_detail_movie.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [CardDetailMovie()],
      ),
    );
  }
}
