import 'package:latlong/latlong.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class TestModel {
  final int num;
  final LatLng latLng;

  TestModel({this.num, this.latLng});
}


List<TestModel> testModel = [
  TestModel(num: 1, latLng: LatLng(52.5200, 13.4050)),
  TestModel(num: 20, latLng: LatLng(52.3759, 9.7320)),
  TestModel(num: 30, latLng: LatLng(50.1109, 8.6821)),
  TestModel(num: 40, latLng: LatLng(48.1351, 11.5820)),
  TestModel(num: 5, latLng: LatLng(49.39881299, 8.6724)),

];