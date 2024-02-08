import 'package:flutter/material.dart';
import 'package:wine_app/models/wine_model.dart';

class WinePage extends StatelessWidget {
  final WineModel wine;
  final Widget flag;
  const WinePage({super.key, required this.wine, required this.flag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.network(
              wine.image,
              height: 400,
            ),
            Text(
              wine.winery,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          wine.wine,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      wine.rating.average,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Text('average',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                  ],
                ),
        
                Column(
                  children: [
                    ClipOval(child: SizedBox(height: 40, width: 40, child: flag)),
                    Text(wine.location.split('·')[0],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                  ],
                ),
        
                Column(
                  children: [
                    Text(wine.rating.reviews.split(' ')[0],
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                            Text(wine.rating.reviews.split(' ')[1],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
        
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
