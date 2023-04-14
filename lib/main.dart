import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mks_coding_movie/bloc/movie_bloc.dart';
import 'package:mks_coding_movie/common/constants.dart';
import 'package:mks_coding_movie/presentation/pages/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc()..add(GetMovieEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: kColorScheme, scaffoldBackgroundColor: kRichBlack),
        home: const MoviePage(),
      ),
    );
  }
}
