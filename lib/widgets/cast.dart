import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_project/controller/controller.dart';

class castWidget extends StatefulWidget {
  const castWidget({Key? key}) : super(key: key);

  @override
  State<castWidget> createState() => _castWidgetState();
}

class _castWidgetState extends State<castWidget> {
  MovieController movieController= Get.put(MovieController()) ;
  @override
  Widget build(BuildContext context) {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset("assets/pngpp.png"),
                                  ))),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                              movieController.splittedActors[0] ??
                                      'Veysel Kayık',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            ),
                                            
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset("assets/pngpp.png"),
                                  ))),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text( movieController.splittedActors[1] ??'Ezgi DOĞAN',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,),
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset("assets/pngpp.png"),
                                  ))),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text( movieController.splittedActors[2] ??'Emrecan Şimşek',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,),
                                  )),
                            ],
                          ),
                        ],
                      );
  }
}