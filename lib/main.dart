// import 'dart:math';

// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 141, 183, 58)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('Home'),
          titleTextStyle: const TextStyle(color: Colors.white),
        ),
        body: const SingleChildScrollView(
            child: Column(children: <Widget>[
          Image(
            image: NetworkImage(
                'https://live.staticflickr.com/7103/7187410672_acf7ddee65_z.jpg'),
            fit: BoxFit.cover,
          ),
          TitleSection(
              placeName: 'Quaid-e-Azam Mazar', location: 'Karachi, Pakistan'),
          ButtonView(),
          TextSection(
            description:
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                'Bernese Alps. Situated 1,578 meters above sea level, it '
                'is one of the larger Alpine Lakes. A gondola ride from '
                'Kandersteg, followed by a half-hour walk through pastures '
                'and pine forest, leads you to the lake, which warms to 20 '
                'degrees Celsius in the summer. Activities enjoyed here '
                'include rowing, and riding the summer toboggan run.',
          ),
          InfoList(),
          GridGallery(),
        ])));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.placeName,
    required this.location,
  });

  final String placeName;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                placeName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(location)
            ],
          )),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text('53')
        ],
      ),
    );
  }
}

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
              name: 'Call', icon: Icons.phone, color: Colors.deepPurple),
          ButtonWithText(
              name: 'Route', icon: Icons.near_me, color: Colors.deepPurple),
          ButtonWithText(
              name: 'Share', icon: Icons.share, color: Colors.deepPurple),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
  });

  final String name;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          name,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(description),
    );
  }
}

class InfoList extends StatelessWidget {
  const InfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Photo Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Call'),
        ),
      ],
    );
  }
}

class GridGallery extends StatelessWidget {
  const GridGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(10, (index) {
        return Center(
          child: Text('Image $index'),
        );
      }),
    );
  }
}
