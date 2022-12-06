import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:movie_app_mobx/core/base/base_view.dart';
import 'package:movie_app_mobx/core/const/apikey.dart';
import 'package:movie_app_mobx/features/detail/view/detail_view.dart';
import 'package:movie_app_mobx/features/home/view/view_model/home_view_model.dart';

final getIt = GetIt.instance;

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onDispose: (viewModel) {},
        viewModel: HomeViewModel(),
        onInit: (viewModel) {},
        // onUpdateWidget: (viewModel) async {
        //   log("ON UPDATE WIDGET");
        //   viewModel.isLoading = true;
        //   await viewModel.getPopularMovies();
        //   await viewModel.getNowPlaying();
        //   await viewModel.getGenreList();
        //   viewModel.isLoading = false;
        // },
        // onInit: (HomeViewModel viewModel) async {
        //   log("INIT");
        //   viewModel.isLoading = true;
        //   await viewModel.getPopularMovies();
        //   await viewModel.getNowPlaying();
        //   await viewModel.getGenreList();
        //   viewModel.isLoading = false;
        // },
        onPageView: (context, viewModel) {
          /// BU ŞEKİLDE DE ÇÖZEBİLİRSİN INITE GİRMEDİĞİ İÇİN BURADA ÇEKTİM VERİLERİ NULLSA GİRERE DEĞİLSE GİRMEZ ZATEN
          /// bu sağlıklı mı
          /// ÇOK DEĞİL AMA HAYAT KURTARIR ACİL Bİ DURUMDA HIZLI ÇÖZÜM OLARAK YAPABİLİRSİN
          /// HATA ÇIKARIR MI ? ÇIKARMAZ
          /// İYİ KOD MU ? DEĞİL
          /// ÇÖZÜM MÜ ? İHTİYACINI KARŞIYOR MU ? EVET,bunu anlatırmısın anlamadım onpageview neydi bide
          /// içime sinmedi en saglıklısı ne bide bizim basemodel yalan mı oldu
          /// base model kullanacaksan get it kullanmalısın
          /// şuan aklma gelen en temiz çözüm bu şekilde
          /// göster get itkonusabilrisin sesinia ctum
          /// hayır konuşmıcam ya konus az gelio coka z ya hi gelmşoki
          // if (viewModel.genresResponse == null ||
          //     viewModel.popularResponse == null ||
          //     viewModel.nowPlayingModel == null) {
          //   viewModel.getData();
          // }

          return Scaffold(
            backgroundColor: const Color(0xff0B101A),
            body: SingleChildScrollView(
              child: Observer(builder: (context) {
                return Column(
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
                                        viewModel.setIsGenre(true);

                                        viewModel.getGenreListBody(viewModel
                                            .genresResponse!.genres![index].id
                                            .toString());
                                        // viewModel.setGenresId(viewModel
                                        //     .genresResponse!.genres![index].id
                                        //     .toString());
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

                                        // ben null check yap demiştim yapmadın mı ?
                                        // TODO:
                                        child: Text(
                                          viewModel.genresResponse!
                                              .genres![index].name!,
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
                        // color: Colors.black,
                        child: Observer(builder: (context) {
                          return viewModel.isLoading
                              ? Center(child: CircularProgressIndicator())
                              : viewModel.isGenre
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: viewModel
                                          .genresIdResponse?.items?.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            // Navigator.push<void>(
                                            //   context,
                                            //   MaterialPageRoute<void>(
                                            //     builder: (BuildContext
                                            //             context) =>
                                            //         DetailPageView(
                                            //             id: viewModel
                                            //                 .popularResponse!
                                            //                 .results![index]
                                            //                 .id
                                            //                 .toString()),
                                            //   ),
                                            // );
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                width: 150.0,
                                                height: 400.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.white10,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                // TODO:
                                                child: Image.network(
                                                  viewModel
                                                              .genresIdResponse!
                                                              .items![index]
                                                              .posterPath !=
                                                          null
                                                      ? "https://image.tmdb.org/t/p/original" +
                                                          viewModel
                                                              .genresIdResponse!
                                                              .items![index]
                                                              .posterPath!
                                                      : "https://www.bogatepemandira.com/images/urunler/test-urun--145-16082397730-1000.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: viewModel
                                          .popularResponse?.results?.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder: (BuildContext
                                                        context) =>
                                                    DetailPageView(
                                                        id: viewModel
                                                            .popularResponse!
                                                            .results![index]
                                                            .id
                                                            .toString()),
                                              ),
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                width: 150.0,
                                                height: 400.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.white10,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                // TODO:
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
                                  itemCount: viewModel
                                      .nowPlayingModel?.results?.length,
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
                                        "${IMG_URL + viewModel.nowPlayingModel!.results![index].backdropPath!}" ??
                                            "https://images.unsplash.com/photo-1669799369787-23c78e3975df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                );
                        })),
                  ],
                );
              }),
            ),
          );
        });
  }
}

/// SORUN ŞUYDU
/// BİZİM BASE MODEL SAYFA İLK AÇILDIĞI ZAMAN GİDİP VERİLERİ ÇAĞIRIP GETİRİYOR
/// INITSTATE GİRİP
///
/// AMA CTRL S YAPTIĞIM ZAMAN
/// BUİLD KISMI ÇALIŞIR
/// BİZİM BUİLD İÇİNDE BASE YAPISI OLDUĞU İÇİN GİDİP TEKAR VIEWMODELİ ÇAĞIRIYOR
/// INITSTATE SAYFA SADECE AÇILDIĞI ZAMAN GİRDİĞİ İÇİN TEKRAR GİRMİYOR
/// TEKRAR GİRMEDİĞİ İÇİN VERİLER GELMİYOR (DOOLDURULMUYOR)
/// O YÜZDEN DE NULL GEGLİYOR
/// evet bunu anladım aklıma gelmişti bidaha initstate girmi cunkı ee burda
/// sureklı ınıtstate kullanıp statefullw widge tkullancaksam mobxın ne onemı kaldı
///
/// BUNUN İÇİN ÇÖZÜM OLURAK GET İT KULLANABİLİRSİN
/// GET İT İLE VIEW MODELİ Bİ KERE ÇAĞIRICAKSIN BÖYLECE BELLEKTE KAYBOLMICAK VEYA DİĞER Bİ ÇÖZÜM
/// AMA SAĞLIKLI DEĞEKİLDE YAPABİLİR
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:movie_app_mobx/core/const/apikey.dart';
// import 'package:movie_app_mobx/features/detail/view/detail_view.dart';
// import 'package:movie_app_mobx/features/home/view/view_model/home_view_model.dart';

// class HomePageView extends StatefulWidget {
//   const HomePageView({super.key});

//   @override
//   State<HomePageView> createState() => _HomePageViewState();
// }

// class _HomePageViewState extends State<HomePageView> {
//   late HomeViewModel viewModel;

//   @override
//   void initState() {
//     viewModel = HomeViewModel();

//     getData();
//     super.initState();
//   }

//   getData() async {
//     viewModel.isLoading = true;
//     await viewModel.getPopularMovies();
//     await viewModel.getNowPlaying();
//     await viewModel.getGenreList();
//     viewModel.isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff0B101A),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // MODELVIEW A BİŞET EKLEDİĞİN ZAMAN
//             // WATCH AKTİF ET
//             SafeArea(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.1,
//                 //color: Colors.amber,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15.0),
//                       child: Image.asset(
//                         "assets/d.png",
//                         width: 50.0,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15.0),
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 190,
//                         height: 30,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             gradient: const LinearGradient(colors: [
//                               Color(0xff0B0D35),
//                               Color(0xff0B0D35)
//                             ])),
//                         child: const Text(
//                           "Search",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: .5),
//                         ),
//                       ),
//                     ),
//                     Image.asset(
//                       "assets/ra.png",
//                       width: 90.0,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 5.0),
//               child: Text(
//                 "Best Genre",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 23.0),
//               ),
//             ),
//             Container(
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 //color: Colors.black,
//                 child: Observer(builder: (context) {
//                   return ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: viewModel.genresResponse?.genres?.length,
//                     itemBuilder: (context, index) {
//                       return viewModel.isLoading
//                           ? const CircularProgressIndicator()
//                           : InkWell(
//                               onTap: () {
//                                 viewModel.setGenresId(viewModel
//                                     .genresResponse!.genres![index].id
//                                     .toString());
//                               },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 margin: const EdgeInsets.all(10.0),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 15.0, vertical: 8.0),
//                                 height: 100.0,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white10,
//                                     borderRadius: BorderRadius.circular(7.0)),

//                                 // ben null check yap demiştim yapmadın mı ?
//                                 // TODO:
//                                 child: Text(
//                                   viewModel
//                                       .genresResponse!.genres![index].name!,
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 17.0,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             );
//                     },
//                   );
//                 })),
//             Container(
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 color: Colors.black,
//                 child: Observer(builder: (context) {
//                   return viewModel.isLoading
//                       ? Center(child: CircularProgressIndicator())
//                       : ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: viewModel.popularResponse?.results?.length,
//                           itemBuilder: (context, index) {
//                             return InkWell(
//                               onTap: () {
//                                 Navigator.push<void>(
//                                   context,
//                                   MaterialPageRoute<void>(
//                                     builder: (BuildContext context) =>
//                                         DetailPageView(
//                                             id: viewModel.popularResponse!
//                                                 .results![index].id
//                                                 .toString()),
//                                   ),
//                                 );
//                               },
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                                     margin: const EdgeInsets.all(10.0),
//                                     width: 150.0,
//                                     height: 400.0,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white10,
//                                         borderRadius:
//                                             BorderRadius.circular(10.0)),
//                                     // TODO:
//                                     child: Image.network(
//                                       "https://image.tmdb.org/t/p/original" +
//                                           viewModel.popularResponse!
//                                               .results![index].posterPath!,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                 })),
//             const Padding(
//               padding: EdgeInsets.only(left: 10.0, top: 20.0),
//               child: Text(
//                 "Now Playing",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24.0),
//               ),
//             ),
//             Container(
//                 //clipBehavior: Clip.antiAliasWithSaveLayer,
//                 height: MediaQuery.of(context).size.height * 0.2,
//                 //color: Colors.black,
//                 child: Observer(builder: (context) {
//                   return viewModel.isLoading
//                       ? CircularProgressIndicator()
//                       : ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: viewModel.nowPlayingModel?.results?.length,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               clipBehavior: Clip.antiAliasWithSaveLayer,
//                               margin: const EdgeInsets.all(10.0),
//                               width: 150.0,
//                               height: 100.0,
//                               decoration: BoxDecoration(
//                                   color: Colors.white10,
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               child: Image.network(
//                                 "${IMG_URL + viewModel.nowPlayingModel!.results![index].backdropPath!}" ??
//                                     "https://images.unsplash.com/photo-1669799369787-23c78e3975df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
//                                 fit: BoxFit.cover,
//                               ),
//                             );
//                           },
//                         );
//                 })),
//           ],
//         ),
//       ),
//     );
//   }
// }
