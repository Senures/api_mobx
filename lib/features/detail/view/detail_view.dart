import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app_mobx/core/base/base_view.dart';

import '../../home/view/view_model/home_view_model.dart';

class DetailPageView extends StatelessWidget {
  final String? id;
  const DetailPageView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onDispose: (viewModel) {},
        viewModel: HomeViewModel(),
        onInit: (viewModel) {
          viewModel.getDetailMovies(id!);
        },
        onPageView: (context, viewModel) {
          return Scaffold(
            backgroundColor: const Color(0xff0B101A),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              actions: [Image.asset("assets/settings.png")],
            ),
            body: Observer(builder: (context) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 30.0),
                    child: Container(
                      width: 500.0,
                      height: 500.0,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Stack(
                        children: [
                          viewModel.isLoading
                              ? CircularProgressIndicator()
                              : Image.network(
                                  "https://image.tmdb.org/t/p/original" +
                                      viewModel.detailResponse!.backdropPath!,
                                  fit: BoxFit.fill,
                                  height: 400.0,
                                ),
                          Positioned(
                              top: 60,
                              left: 20.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/ra.png",
                                    width: 100.0,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, bottom: 10.0),
                                    child: Text(
                                      "American Dad",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/pb.png"),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
          );
        });
  }
}
