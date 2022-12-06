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
          viewModel.getNowPlaying();
          viewModel.getGenreList();
        },
        onPageView: (context, viewModel) {
          return Scaffold(
            backgroundColor: const Color(0xff0B101A),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // MODELVIEW A BİŞET EKLEDİĞİN ZAMAN
                  // WATCH AKTİF ET
                  SafeArea(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      //color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Image.asset(
                              "assets/d.png",
                              width: 50.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 190,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
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
                          ),
                          Image.asset(
                            "assets/ra.png",
                            width: 90.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 10.0, top: 20.0, bottom: 5.0),
                    child: Text(
                      "Best Genre",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      //color: Colors.black,
                      child: Observer(builder: (context) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.genresResponse?.genres?.length,
                          itemBuilder: (context, index) {
                            return viewModel.isLoading
                                ? const CircularProgressIndicator()
                                : InkWell(
                                    onTap: () {
                                      viewModel.setGenresId(viewModel
                                          .genresResponse!.genres![index].id
                                          .toString());
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.all(10.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 8.0),
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white10,
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: Text(
                                        viewModel.genresResponse!.genres![index]
                                            .name!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                          },
                        );
                      })),

                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      color: Colors.black,
                      child: Observer(builder: (context) {
                        return viewModel.isLoading
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    viewModel.popularResponse?.results?.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              DetailPageView(
                                                  id: viewModel.popularResponse!
                                                      .results![index].id
                                                      .toString()),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          margin: const EdgeInsets.all(10.0),
                                          width: 150.0,
                                          height: 400.0,
                                          decoration: BoxDecoration(
                                              color: Colors.white10,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Image.network(
                                            "https://image.tmdb.org/t/p/original" +
                                                viewModel
                                                    .popularResponse!
                                                    .results![index]
                                                    .posterPath!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                      })),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text(
                      "Now Playing",
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
                      child: Observer(builder: (context) {
                        return viewModel.isLoading
                            ? CircularProgressIndicator()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    viewModel.nowPlayingModel?.results?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    margin: const EdgeInsets.all(10.0),
                                    width: 150.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/original" +
                                          viewModel.nowPlayingModel!
                                              .results![index].backdropPath!,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                      })),
                ],
              ),
            ),
          );
        });
  }
}
