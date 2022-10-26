import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_project/controller/controller.dart';
import 'package:movie_project/mixin/color_mixin.dart';
import 'package:movie_project/screen/search.dart';
import 'package:lottie/lottie.dart';
import '../model/movie_list_model.dart';
import '../widgets/movie_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ColorMixin {

  @override
  void initState() {
    super.initState();
      movieController.fetchMovieList('Harry Potter', 'Blade Runner');
  }

  MovieController movieController= Get.put(MovieController()) ;
  TextEditingController textEditingController = TextEditingController();
  final bodyTitle = 'RECOMMENDED FOR YOU';
  final bodyTitle2 = 'TOP RATED';
  final helloTitle = 'Hello, what do you \nwant to watch ?';
  final searchMovie ='Search Movie';
  final loadingLottie = Lottie.asset("assets/lottie/loading.json");

  final randomImage1 =
      'https://i.picsum.photos/id/766/200/300.jpg?hmac=yPmyGIdCe3ag8jlW87DzVijW_xLn1vzaiwrJvIChFcM';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: carolinaBlue,
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: _searchMovie(context)),
          Expanded(
              flex: 7,
              child:Obx(() => movieController.isLoading.value ? loadingLottie: _recommend(context)),)
        ],
      ),
    );
  }

  Container _recommend(BuildContext context) {
    return Container(padding: EdgeInsets.only(top: 30,left: 20,bottom: 20),
              decoration: BoxDecoration(
                  color: gunmetal,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(bodyTitle,style: Theme.of(context).textTheme.subtitle1,)),
                  Expanded(
                    flex: 7,
                    child: MovieList(
                      model: movieController.recommendedList ?? MovieListModel()
                    ),
                  ),
                  Spacer(),
                  Expanded(child: Text(bodyTitle2,style: Theme.of(context).textTheme.subtitle1,)),
                  Expanded(
                    flex: 7,
                    child: MovieList(
                    model: movieController.topList ?? MovieListModel()
                        ),
                  ),
                ],
              ),
            );
  }

  Container _searchMovie(BuildContext context) {
    return Container(
              color: carolinaBlue,
              child: Padding(
                padding: EdgeInsets.only(top:60,right: 20,left: 20),
                child: Column(
                  children: [
                    Expanded(
                        child: Text(
                      helloTitle,
                      style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 30),
                    )),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: textEditingController,
                        decoration: InputDecoration(
                          labelText: searchMovie,
                          prefixIcon:  IconButton(onPressed: ()async{await movieController.fetchSearchMovieList(textEditingController.text);
                            Get.to(SearchPage());}, icon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}

