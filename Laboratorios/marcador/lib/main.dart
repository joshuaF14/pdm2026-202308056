import 'package:flutter/material.dart';

void main() {
  runApp(const MarcadorApp());
}

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador Deportivo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MarcadorScreen(),
    );
  }
}

class MarcadorScreen extends StatefulWidget {
  const MarcadorScreen({super.key});

  @override
  State<MarcadorScreen> createState() => _MarcadorScreenState();
}

class _MarcadorScreenState extends State<MarcadorScreen> {
  int scoreA = 0;
  int scoreB = 0;

  void _incrementarA() {
    setState(() {
      scoreA++;
    });
  }

  void _decrementarA() {
    if (scoreA > 0) { 
      setState(() {
        scoreA--;
      });
    }
  }

  void _incrementarB() {
    setState(() {
      scoreB++;
    });
  }

  void _decrementarB() {
    if (scoreB > 0) { 
      setState(() {
        scoreB--;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      scoreA = 0;
      scoreB = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    String mensaje = "Empate";
    
    Color colorA = Colors.grey.shade300;
    Color colorB = Colors.grey.shade300;

    if (scoreA > scoreB) {
      mensaje = "Va ganando Equipo A";
      colorA = Colors.green.shade400; 
    } else if (scoreB > scoreA) {
      mensaje = "Va ganando Equipo B";
      colorB = Colors.green.shade400; 
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador Deportivo'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mensaje,
                style: const TextStyle(
                  fontSize: 26, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTeamCard(
                    nombre: 'Equipo A',
                    puntos: scoreA,
                    colorFondo: colorA,
                    onIncrement: _incrementarA,
                    onDecrement: _decrementarA,
                  ),
                  _buildTeamCard(
                    nombre: 'Equipo B',
                    puntos: scoreB,
                    colorFondo: colorB,
                    onIncrement: _incrementarB,
                    onDecrement: _decrementarB,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              
              ElevatedButton.icon(
                onPressed: _reiniciar,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Reiniciar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamCard({
    required String nombre,
    required int puntos,
    required Color colorFondo,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ]
      ),
      child: Column(
        children: [
          Text(
            nombre,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            '$puntos',
            style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 16),
        
          Row(
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove_circle_outline_rounded),
                iconSize: 38,
                color: Colors.black87,
              ),
              IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add_circle_outline_rounded),
                iconSize: 38,
                color: Colors.black87,
              ),
            ],
          )
        ],
      ),
    );
  }
}