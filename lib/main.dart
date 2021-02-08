import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrollbar tests',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Test1(),
      ),
    );
  }
}

class Test1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateColor.resolveWith((states) => Colors.red),
        trackBorderColor: MaterialStateColor.resolveWith((states) => Colors.green),
        trackColor: MaterialStateColor.resolveWith((states) => Colors.blue),
      ),
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        thickness: 12,
        radius: Radius.circular(8),
        child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(' - ${index+1} - '),
                subtitle: Text('Scrollbar tests'),
                tileColor: index % 2 == 0 ? Colors.white70: Colors.white10,
              );
            }),
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScrollbarPainter(
        color: Colors.red,
        trackBorderColor: Colors.green,
        trackColor: Colors.blue,
        fadeoutOpacityAnimation: const AlwaysStoppedAnimation<double>(1.0),
      ),
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        radius: Radius.circular(8),
        thickness: 12,
        child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(' - ${index+1} - '),
                subtitle: Text('Scrollbar tests'),
                tileColor: index % 2 == 0 ? Colors.white70: Colors.white10,
              );
            }),
      ),
    );
  }
}
