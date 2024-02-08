

class RatingModel {
  final String average;
  final String reviews;

  RatingModel({
    required this.average,
    required this.reviews,
  });

  RatingModel.fromJson(Map<String, dynamic> json)
      : average = json['average'],
        reviews = json['reviews'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['reviews'] = this.reviews;
    return data;
  }

}

class WineModel {
  String winery;
  String wine;
  RatingModel rating;
  String location;
  String image;
  int id;

  WineModel({
    required this.winery,
    required this.wine,
    required this.rating,
    required this.location,
    required this.image,
    required this.id,
  });
  factory WineModel.fromJson(Map<String, dynamic> json) {
    return WineModel(
      winery: json['winery'],
      wine: json['wine'],
      rating: RatingModel.fromJson(json['rating']),
      location: json['location'],
      image: json['image'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['winery'] = this.winery;
    data['wine'] = this.wine;
    data['rating'] = this.rating.toJson();
    data['location'] = this.location;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }

}
