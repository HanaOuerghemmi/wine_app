import 'package:flutter/material.dart';
import 'package:wine_app/models/wine_model.dart';
import 'package:wine_app/pages/widgets/wine_card.dart';

Widget buildCard(BuildContext context, List<WineModel> model) {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 4,
        mainAxisSpacing: 15, // spacing between rows
        crossAxisSpacing: 15, // spacing between columns
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return WineCard(
          wine: model[index],
        );
      });
}
