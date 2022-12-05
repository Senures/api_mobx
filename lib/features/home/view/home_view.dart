import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app_mobx/core/base/base_view.dart';
import 'package:movie_app_mobx/features/detail/view/detail_view.dart';
import 'package:movie_app_mobx/features/home/view/view_model/home_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onDispose: (viewModel) {},
        viewModel: HomeViewModel(),
        onInit: (viewModel) {
          viewModel.getPopularMovies();
        },
        onPageView: (context, viewModel) {
          return Scaffold(
            backgroundColor: const Color(0xff0B101A),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // MODELVIEW A BİŞET EKLEDİĞİN ZAMAN
                  // WATCH AKTİF ET nasıl ya
                  SafeArea(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      //color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/d.png",
                            width: 50.0,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 190,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: const LinearGradient(colors: [
                                  Color(0xff0B0D35),
                                  Color(0xff0B0D35)
                                ])),
                            child: const Text(
                              "Search",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: .5),
                            ),
                          ),
                          Image.asset(
                            "assets/ra.png",
                            width: 100.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  // YEMEK YİCEM GELİRİM.....
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      //color: Colors.black,
                      child: Observer(builder: (context) {
                        return viewModel.isLoading
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                          DetailPageView(id:viewModel.popularResponse!.results![index].id.toString()),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      margin: const EdgeInsets.all(10.0),
                                      width: 150.0,
                                      height: 90.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white10,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/original" +
                                            viewModel.popularResponse!
                                                .results![index].posterPath!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              );
                      })),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text(
                      "Trending Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                  ),
                  Container(
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: MediaQuery.of(context).size.height * 0.2,
                      //color: Colors.black,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 150.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Image.network(
                              "https://images.unsplash.com/photo-1593345216166-6a6cbf185ba0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text(
                      "Best Genre",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      //color: Colors.black,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 150.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10.0)),
                          );
                        },
                      )),
                ],
              ),
            ),
          );
        });
  }
}
