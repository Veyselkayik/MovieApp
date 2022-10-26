import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_project/controller/controller.dart';
import 'package:movie_project/mixin/color_mixin.dart';

import '../widgets/cast.dart';

class MyMovieProject extends StatefulWidget {
  const MyMovieProject({Key? key}) : super(key: key);

  @override
  State<MyMovieProject> createState() => _MyMovieProjectState();
}

class _MyMovieProjectState extends State<MyMovieProject> with ColorMixin {
  MovieController movieController= Get.put(MovieController()) ;
  final title = '  Title';
  final movieContents = 'İçerik';
  final imdbPoint = 'İMDB 7';
  final movieDirector = 'Director  :';
  final movieGenre = 'Genre  :';
  final movieYear = 'Release  :';
  final appBarImage = 'https://picsum.photos/200/300';
  final summary ='PLOT SUMMARY';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Image.network(movieController.movieModel?.poster ?? appBarImage, fit: BoxFit.cover),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                color: gunmetal,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(flex:3,
                                child: Text(movieController.movieModel?.title ??
                              title,
                              style: Theme.of(context).textTheme.headline5,
                            )),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Text(
                                    movieController.movieModel?.imdbRating ??
                                    imdbPoint,
                                      style:
                                          Theme.of(context).textTheme.headline5),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Expanded(child: Text(summary,style: Theme.of(context).textTheme.subtitle1,)),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            child: ListView(children: [
                              Text(
                                movieController.movieModel?.plot ??
                                movieContents,
                                  style: Theme.of(context).textTheme.subtitle2),
                            ]),
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(top:15,bottom:5),
                        child: castWidget(),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              movieDirector,
                                style: Theme.of(context).textTheme.subtitle1)),
                        Expanded(
                            flex: 3,
                            child: Text(
                              movieController.movieModel?.director ??
                              movieDirector,
                                style: Theme.of(context).textTheme.subtitle1)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              movieGenre,
                                style: Theme.of(context).textTheme.subtitle1)),
                        Expanded(
                            flex: 3,
                            child: Text(
                              movieController.movieModel?.genre ??
                              movieGenre,
                                style: Theme.of(context).textTheme.subtitle1)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(movieYear,
                                style: Theme.of(context).textTheme.subtitle1)),
                        Expanded(
                            flex: 3,
                            child: Text(
                              movieController.movieModel?.year ??
                              movieYear,
                                style: Theme.of(context).textTheme.subtitle1)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}