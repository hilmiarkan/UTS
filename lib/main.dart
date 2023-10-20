import 'package:flutter/material.dart';

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
      home: GridViewPage(),
    );
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
}

class GridViewPage extends StatelessWidget {
  final List<Exercise> _exercises = [
    Exercise(
      title: 'Hias',
      image: 'assets/icons/hias.png',
      items: [
        ExerciseItem(
          title: 'Bunga Matahari',
          subtitle: 'Simbol Kebahagiaan',
          description:
              'Bunga matahari, dengan warna kuning cerah dan bentuk yang unik.',
        ),
        ExerciseItem(
          title: 'Mawar',
          subtitle: 'Simbol Cinta dan Kecantikan',
          description: 'Mawar, dengan aroma dan keindahannya yang khas.',
        ),
        ExerciseItem(
          title: 'Melati',
          subtitle: 'Simbol Kesucian',
          description:
              'Melati, dengan aroma yang harum dan bentuk yang elegan.',
        ),
        ExerciseItem(
          title: 'Anggrek',
          subtitle: 'Simbol Kebesaran dan Keindahan',
          description: 'Anggrek, dengan berbagai warna dan bentuk yang unik.',
        ),
        ExerciseItem(
          title: 'Tulip',
          subtitle: 'Simbol Kebanggaan dan Kejayaan',
          description:
              'Tulip, dengan warna-warna yang cerah dan bentuk yang elegan.',
        ),
      ],
      itemImages: [
        'assets/images/hias/bungamatahari.png',
        'assets/images/hias/mawar.png',
        'assets/images/hias/melati.png',
        'assets/images/hias/anggrek.png',
        'assets/images/hias/tulip.png',
      ],
      color: const Color(0xFF32C759),
    ),
    Exercise(
      title: 'Buah',
      image: 'assets/icons/buah.png',
      items: [
        ExerciseItem(
          title: 'Apel',
          subtitle: 'Buah Segar dan Bergizi',
          description: 'Apel, dengan rasa yang manis dan segar.',
        ),
        ExerciseItem(
          title: 'Mangga',
          subtitle: 'Buah Tropis yang Lezat',
          description: 'Mangga, dengan rasa yang manis dan aroma yang khas.',
        ),
        ExerciseItem(
          title: 'Jeruk',
          subtitle: 'Buah Segar yang Kaya Vitamin C',
          description: 'Jeruk, dengan rasa yang asam dan segar.',
        ),
        ExerciseItem(
          title: 'Semangka',
          subtitle: 'Buah Segar yang Menyegarkan',
          description: 'Semangka, dengan rasa yang manis dan segar.',
        ),
        ExerciseItem(
          title: 'Pisang',
          subtitle: 'Buah yang Kaya Nutrisi',
          description:
              'Pisang, dengan rasa yang manis dan tekstur yang lembut.',
        ),
      ],
      itemImages: [
        'assets/images/buah/apel.png',
        'assets/images/buah/mangga.png',
        'assets/images/buah/jeruk.png',
        'assets/images/buah/semangka.png',
        'assets/images/buah/pisang.png',
      ],
      color: const Color(0xFFE4A2EE),
    ),
    Exercise(
      title: 'Sayur',
      image: 'assets/icons/sayur.png',
      items: [
        ExerciseItem(
          title: 'Bayam',
          subtitle: 'Sayuran yang Kaya Nutrisi',
          description:
              'Bayam, dengan kandungan zat besi dan vitamin yang tinggi.',
        ),
        ExerciseItem(
          title: 'Kangkung',
          subtitle: 'Sayuran yang Segar dan Lezat',
          description:
              'Kangkung, dengan rasa yang segar dan tekstur yang renyah.',
        ),
        ExerciseItem(
          title: 'Terong',
          subtitle: 'Sayuran yang Cocok untuk Berbagai Masakan',
          description: 'Terong, dengan rasa yang lezat dan tekstur yang empuk.',
        ),
        ExerciseItem(
          title: 'Tomat',
          subtitle: 'Sayuran yang Kaya Antioksidan',
          description:
              'Tomat, dengan rasa yang asam dan kandungan likopen yang tinggi.',
        ),
        ExerciseItem(
          title: 'Wortel',
          subtitle: 'Sayuran yang Kaya Vitamin A',
          description:
              'Wortel, dengan rasa yang manis dan kandungan vitamin A yang tinggi.',
        ),
      ],
      itemImages: [
        'assets/images/sayur/bayam.png',
        'assets/images/sayur/kangkung.png',
        'assets/images/sayur/terong.png',
        'assets/images/sayur/tomat.png',
        'assets/images/sayur/wortel.png',
      ],
      color: const Color(0xFFEE4562),
    ),
    Exercise(
      title: 'Obat',
      image: 'assets/icons/obat.png',
      items: [
        ExerciseItem(
          title: 'Daun Sirih',
          subtitle: 'Ramuan Herbal untuk Kesehatan Mulut',
          description:
              'Daun sirih, dengan kandungan antiseptik dan antioksidan yang tinggi.',
        ),
        ExerciseItem(
          title: 'Temulawak',
          subtitle: 'Ramuan Herbal untuk Pencernaan',
          description:
              'Temulawak, dengan rimpang berwarna kuning dan aroma khasnya.',
        ),
        ExerciseItem(
          title: 'Lidah Buaya',
          subtitle: 'Ramuan Herbal untuk Kesehatan Kulit',
          description:
              'Lidah buaya, dengan kandungan gel yang dapat melembapkan kulit.',
        ),
        ExerciseItem(
          title: 'Jahe',
          subtitle: 'Ramuan Herbal untuk Kesehatan Pencernaan',
          description:
              'Jahe, dengan kandungan gingerol yang dapat meredakan masalah pencernaan.',
        ),
        ExerciseItem(
          title: 'Kunyit',
          subtitle: 'Ramuan Herbal untuk Kesehatan Jantung',
          description:
              'Kunyit, dengan kandungan kurkumin yang dapat menjaga kesehatan jantung.',
        ),
      ],
      itemImages: [
        'assets/images/obat/daunsirih.png',
        'assets/images/obat/temulawak.png',
        'assets/images/obat/lidahbuaya.png',
        'assets/images/obat/jahe.png',
        'assets/images/obat/kunyit.png',
      ],
      color: const Color(0xFF42ABFF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print('Building GridViewPage');
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
                itemCount: _exercises.length,
                itemBuilder: (BuildContext context, int index) {
                  print('Building item $index');
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListViewPage(
                            exercise: _exercises[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: _exercises[index].color,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Image.asset(
                                _exercises[index].image,
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
                                  _exercises[index].title,
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
          //add top padding
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
                          title: exercise.items[index].title,
                          image: exercise.itemImages[index],
                          subtitle: exercise.items[index].subtitle,
                          description: exercise.items[index].description,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFD0D5DD),
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              bottomLeft: Radius.circular(16.0),
                            ),
                            child: Container(
                              width: 130.0,
                              height: 90.0,
                              child: Image.asset(
                                exercise.itemImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            //to make this strecth to the end of the row

                            child: Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Text(
                                exercise.items[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
  final String title;
  final String image;
  final String subtitle;
  final String description;

  const DetailPage({
    required this.title,
    required this.image,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // change back icon color and text color to black
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 10, 0, 0),
        ),
        //change font color and style
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 10, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Transform.rotate(
                angle: -0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  child: Image.asset(
                    image,
                    height: 200.0,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
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
