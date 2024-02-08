import 'package:flutter/material.dart';
import 'package:wine_app/models/wine_model.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import 'package:wine_app/pages/wine_page.dart';

class WineCard extends StatelessWidget {
 final  WineModel wine;
  const WineCard({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    List<String> name = wine.location.split('·');
    print(name.toString());
    String countryName = name[0].toLowerCase();
    print(countryName);
    Country country = CountryPickerUtils.getCountryByName(countryName != '' ? countryName.trim() : 'italy');
    Widget iconsCountry = CountryPickerUtils.getDefaultFlagImage(country);
 
    return Container(
      
     // height: 100,
     decoration: BoxDecoration(color: Colors.white),
      child: 
       Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          //image
          GestureDetector(
            onTap:  () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WinePage(wine :wine, flag:  iconsCountry),
          ),
        );
      },
            child: Image.network(wine.image, height: 200,)),
         // wine
          FittedBox(
            child: Text(
              wine.winery,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey
              ), 
              ),
          ),
          //winerey
           wine.wine.length > 20 ? 
            Text( wine.wine.substring(0, 20) + "..",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ), 
             ):
         Text(
           wine.wine,
           textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ), 
           ),
           //Text(name[0].toString()),
          //average + country 
          Positioned(
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [              
                   flagWidget(iconsCountry: iconsCountry),
                    SizedBox(width: 10,),
                    countryName == '' ? Text('italy') :
                    countryName .length > 10 ?  Text(countryName .substring(0, 10) + ".." ):
                 Text(countryName .toString()),
                 ],
               ),
                 Text(wine.rating.average),
               ],
             ),
          )
         ]),
       ),
    );
  }
}

class flagWidget extends StatelessWidget {
  const flagWidget({
    super.key,
    required this.iconsCountry,
  });

  final Widget iconsCountry;

  @override
  Widget build(BuildContext context) {
    return ClipOval(                
     child: SizedBox(
       height: 25,
       width: 25,
       child: iconsCountry)      
     );
  }
}