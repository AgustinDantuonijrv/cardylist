import 'package:flutter/material.dart';
import 'package:cardylist/widget/course_item_widget.dart';

import 'data.dart';
import 'model/courseitem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Lista Cursos';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        home: MainPage(title: title),
      );
}

class Segundaruta extends StatelessWidget {
  // aca queremos mostrar un video para cada curso dependiendo del index clickeado
  @override
  Widget build(BuildContext context) {
    //final Data items = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          // title: Text(items.title),
          ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Vista del Curso"),
        // child: Text(items.title),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final key = GlobalKey<AnimatedListState>();

  final items = List.from(Data.courseList);

  var index = 0;
  var i = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) =>
                    buildItem(items[index], index, animation),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: buildInsertButton(),
            ),
          ],
        ),
      );

  Widget buildItem(item, int index, Animation<double> animation) =>
      CourseItemWidget(
          item: item,
          animation: animation,
          onClicked: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Segundaruta()),
            );
          }
          //Navigator.push(
          //context,
          //MaterialPageRoute(builder: (context) => SecondRoute())
          );

  Widget buildInsertButton() => RaisedButton(
        child: Text(
          'Ingresar un Item a la lista',
          style: TextStyle(fontSize: 20),
        ),
        color: Colors.white,
        onPressed: () => insertItem(index, Data.courseList[i = i + 1]),
      );

  void insertItem(int index, CourseItem item) {
    items.insert(index, item);
    key.currentState.insertItem(index);

    print("entre y el valor del index quedó en:" + index.toString());
  }

  void removeItem(int index) {
    final item = items.removeAt(index);

    key.currentState.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );
  }
}
