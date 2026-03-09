import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assets App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividad 1 - Imágenes'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Título para imagen local
            const Text(
              'Imagen Local:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // IMAGEN LOCAL (desde assets)
            Image.asset(
              'assets/images/que-es-ingenieria-de-sistemas.jpg',  // Ruta de la imagen local
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            
            const SizedBox(height: 30),
            
            // Título para imagen de internet
            const Text(
              'Imagen desde Internet:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // IMAGEN DESDE INTERNET (URL)
            Image.network(
              'https://virtual.uao.edu.co/hubfs/Imported_Blog_Media/MicrosoftTeams-image.jpg',  
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}