import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_project/Screen/movie_project1.dart';
import 'package:movie_project/controller/controller.dart';
import 'package:movie_project/model/movie_list_model.dart';

class MovieList extends StatelessWidget {
  MovieList({Key? key, required MovieListModel model})
      : _model = model,
        super(key: key);

  MovieListModel _model;

  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movieController.recommendedList?.search?.length ?? 1,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (() async {
            await movieController
                .fetchMovie(_model.search?[index].imdbID ?? "tt1201607");
            Get.to(MyMovieProject());
          }),
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            _model.search?[index].poster ??
                                "https://picsum.photos/200/300",
                            width: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.cover,
                          ))),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                          width: 100,
                          child: Text(
                            _model.search?[index].title ?? "Error 404 Found",
                            style: Theme.of(context).textTheme.subtitle1,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
