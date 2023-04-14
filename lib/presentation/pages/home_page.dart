import 'package:flutter/material.dart';
import 'package:mks_coding_movie/api/service.dart';
import 'package:mks_coding_movie/common/constants.dart';
import 'package:mks_coding_movie/models/movie.dart';
import 'package:mks_coding_movie/presentation/widgets/card_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  child: FutureBuilder(
                      future: Services.getMovies(),
                      builder: (context, AsyncSnapshot<List<Item>> snapshot) {
                        var state = snapshot.connectionState;
                        if (state == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                Item item = snapshot.data![index];
                                return Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: CardMovie(item: item),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Material(
                                child: Text(snapshot.error.toString()),
                              ),
                            );
                          } else {
                            return const Material(child: Text('as'));
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
