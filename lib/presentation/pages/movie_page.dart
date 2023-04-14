import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mks_coding_movie/api/service.dart';
import 'package:mks_coding_movie/bloc/movie_bloc.dart';
import 'package:mks_coding_movie/common/constants.dart';
import 'package:mks_coding_movie/models/movie.dart';
import 'package:mks_coding_movie/presentation/widgets/card_movie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late List<Item> itemList;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kRichBlack,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Image.asset(
              'assets/logo.png',
              width: 30.0,
              height: 35.0,
              fit: BoxFit.cover,
            ),
          ),
          actions: [
            InkWell(
              child: const Icon(
                Icons.search,
                size: 25.0,
              ),
              onTap: () {},
            ),
            const SizedBox(
              width: 10.0,
            ),
            Image.asset(
              'assets/profile.png',
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Movies',
            ),
            Tab(
              text: 'TV Shows',
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: kGrey,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Eksplorasi'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: 'Downloads'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
          backgroundColor: kRichBlack,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Now Playing Movies',
                style: kHeading5,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                  height: 280.0,
                  child: BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                      if (state is MovieLoading) {
                        return CircularProgressIndicator();
                      }
                      if (state is MovieSuccess) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: CardMovie(item: state.movie[index]),
                              );
                            });
                      }
                      return const Center(
                        child: Text('No Data'),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
