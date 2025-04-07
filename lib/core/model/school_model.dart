import 'package:smart_watch/core/constants/images.dart';

class SchoolModel {
  String title;
  String image;

  SchoolModel({
    required this.title,
    required this.image,
  });
}

List<SchoolModel> schoolList = [
  SchoolModel(title: 'الكعبان المشتركة للبنات', image: Images.school1),
  SchoolModel(title: 'الخور الثانوية للبنات', image: Images.school2),
  SchoolModel(title: 'الكعبان المشتركة للبنين', image: Images.school3),
  SchoolModel(title: 'الخور الابتدائية للبنين', image: Images.school4),
  SchoolModel(title: 'مدرسة الغويرية المشتركة للبنات', image: Images.school5),
];
