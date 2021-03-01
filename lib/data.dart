import 'model/courseitem.dart';

class Data {
  static final List<CourseItem> courseList = [
    CourseItem(
      title: 'Curso Java',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/en/thumb/3/30/Java_programming_language_logo.svg/141px-Java_programming_language_logo.svg.png',
    ),
    CourseItem(
      title: 'Curso Python',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/110px-Python-logo-notext.svg.png',
    ),
    CourseItem(
      title: 'Curso de Spring',
      urlImage:
          'https://banner2.cleanpng.com/20180713/otv/kisspng-spring-framework-software-framework-modelview-pepper-robot-5b48c128f2f1c1.7505867115314946969951.jpg',
    ),
    CourseItem(
      title: 'Curso de Kubernets',
      urlImage:
          'https://www.logo.wine/a/logo/Kubernetes/Kubernetes-Logo.wine.svg',
    ),
    CourseItem(
      title: 'Curso de Go',
      urlImage: 'https://i.morioh.com/2020/03/24/fa7ceac4ffd5.jpg',
    ),
  ];

  String get title => null;
}
