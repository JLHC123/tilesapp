import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tile Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TileScreen()
    );
  }
}

class TileScreen extends StatefulWidget {
  const TileScreen({super.key});

  @override
  State<TileScreen> createState() => _TileScreenState();
}

class _TileScreenState extends State<TileScreen> {
  int tileCount = 0;

  void _addTile() {
    setState(() {
      tileCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grid of Tiles'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: tileCount == 0
          ? const Center(
          child: Text(
            'Press button to make tiles',
            style: TextStyle(fontSize: 24),
          ),
        )
            : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
            padding: const EdgeInsets.all(10),
            itemCount: tileCount,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(tileNumber: index + 1),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: _addTile,
          child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int tileNumber;

  const DetailScreen({super.key, required this.tileNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tile $tileNumber')),
      body: Center(
        child: Text(
          'You selected Tile $tileNumber',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}