import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lector de Archivos de Texto',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _fileContent = 'Cargando contenido...';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTextFile();
  }

  Future<void> _loadTextFile() async {
    try {
      // Cargar el archivo de texto desde assets
      String content = await rootBundle.loadString('archivos_texto/PRUEBA.txt');
      
      setState(() {
        _fileContent = content;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _fileContent = 'Error al cargar el archivo: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividad 2 - Archivo de Texto'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contenido del archivo PRUEBA.txt:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // Mostrar el contenido del archivo
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Text(
                          _fileContent,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Botón para recargar (opcional)
            Center(
              child: ElevatedButton(
                onPressed: _loadTextFile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Recargar Archivo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
