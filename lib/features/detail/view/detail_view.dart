import 'package:flutter/material.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B101A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [Image.asset("assets/settings.png")],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 30.0),
            child: Stack(
              children: [
                Container(
                  width: 500.0,
                  height: 400.0,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                ),
                Image.network(
                  "https://images.unsplash.com/photo-1634828221818-503587f33d02?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1065&q=80",
                  fit: BoxFit.fill,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
