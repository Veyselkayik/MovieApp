import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_project/controller/controller.dart';
import 'package:movie_project/mixin/color_mixin.dart';
import 'package:movie_project/screen/movie_project1.dart';
import 'package:lottie/lottie.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with ColorMixin {

  @override
  void initState() {
    super.initState();

  }
  MovieController movieController = Get.put(MovieController());
  final movieName = 'STAR WARS';
  String _search = "";
  final randomImage ='https://picsum.photos/200/300';
  final searchResult ='SEARCH RESULT';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gunmetal,
      appBar: AppBar(
        title: Text(searchResult),
      ),
      body: movieController.isFound.value ? ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                height: 130,
                child: InkWell(
                  onTap: () async{
                  await  movieController.fetchMovie(
                        movieController.movieSearchList?.search?[index].imdbID ?? 'imdbıd');
                    Get.to(MyMovieProject());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: darkCharcoal,
                    child: Row(children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            child: Image.network(movieController.movieSearchList?.search?[index].poster ??
                              randomImage,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(
                                flex: 1,
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Text(movieController.movieSearchList?.search?[index].title ??
                                    movieName,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(movieController.movieSearchList?.search?[index].year ??
                                    '2022',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(color: Colors.grey.shade500),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(movieController.movieSearchList?.search?[index].imdbID ??
                                    'IMDB 7.2',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(color: Colors.grey.shade500),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                )),
          );
        },
      ) : Lottie.asset("assets/lottie/search.json"),
    );
  }
}
