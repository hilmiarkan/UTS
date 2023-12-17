import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Holtikultura',
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
      ),
      home: FutureBuilder(
        future: fetchExercises(), // Panggil fungsi fetchExercises
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Ubah ke ListViewPage dengan parameter exercises dari API
            return GridViewPage(exercises: snapshot.data as List<Exercise>);
          }
        },
      ),
    );
  }
}

Future<List<Exercise>> fetchExercises() async {
  final response = await http.get(
    Uri.parse(
        'https://tanaman-ade36-default-rtdb.firebaseio.com/exercises.json'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> exercisesJson = json.decode(response.body);

    List<Exercise> exercises = exercisesJson
        .map((exerciseJson) => Exercise.fromJson(exerciseJson))
        .toList();

    return exercises;
  } else {
    throw Exception('Failed to load exercises');
  }
}

class ExerciseItem {
  final String title;
  final String subtitle;
  final String description;

  ExerciseItem({
    required this.title,
    required this.subtitle,
    required this.description,
  });

  factory ExerciseItem.fromJson(Map<String, dynamic> json) {
    return ExerciseItem(
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
    );
  }
}

class Exercise {
  final String title;
  final String image;
  final List<ExerciseItem> items;
  final Color color;
  final List<String> itemImages;

  Exercise({
    required this.title,
    required this.image,
    required this.items,
    required this.color,
    required this.itemImages,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsJson = json['items'];
    final List<ExerciseItem> items =
        itemsJson.map((itemJson) => ExerciseItem.fromJson(itemJson)).toList();

    return Exercise(
      title: json['title'],
      image: json['image'],
      items: items,
      color: Color(int.parse(json['color'].substring(1, 7), radix: 16) +
          0xFF000000), // Konversi warna dari format hex ke Color
      itemImages: List<String>.from(json['itemImages']),
    );
  }
}

class GridViewPage extends StatelessWidget {
  final List<Exercise> exercises;

  const GridViewPage({required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Silahkan pilih tipe holtikultura',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 26.0,
              ),
              child: GridView.builder(
                padding: const EdgeInsets.only(
                  top: 16.0,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: exercises.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListViewPage(
                            exercise: exercises[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: exercises[index].color,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Image.network(
                                exercises[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  exercises[index].title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 28.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewPage extends StatelessWidget {
  final Exercise exercise;

  const ListViewPage({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(exercise.title),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 10, 0, 0),
        ),
        titleTextStyle: TextStyle(
          color: exercise.color,
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 16.0),
          itemCount: exercise.items.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(16.0),
                elevation: 2.0,
                shadowColor: Color.fromARGB(102, 255, 255, 255),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          exercise: exercise,
                          itemIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE9E9E9),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                          ),
                          child: Image.network(
                            exercise.itemImages[index],
                            height: 120.0,
                            width: 120.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exercise.items[index].title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  exercise.items[index].subtitle,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Exercise exercise;
  final int itemIndex;

  const DetailPage({
    required this.exercise,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    ExerciseItem exerciseItem = exercise.items[itemIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(exerciseItem.title),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 10, 0, 0),
        ),
        titleTextStyle: TextStyle(
          color: exercise.color,
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Transform.rotate(
                angle: -0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  child: Image.network(
                    exercise.itemImages[itemIndex],
                    height: 200.0,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exerciseItem.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    exerciseItem.subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    exerciseItem.description,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
