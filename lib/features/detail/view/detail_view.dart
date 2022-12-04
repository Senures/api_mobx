import 'package:flutter/material.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B101A),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [Image.asset("assets/settings.png")],
      ),
      body: Column(
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
                  Image.network(
                    "https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
                    fit: BoxFit.fill,
                    height: 400.0,
                  ),
                  Positioned(
                      top: 20,
                      left: 20.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/ra.png",
                            width: 150.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
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
      ),
    );
  }
}
