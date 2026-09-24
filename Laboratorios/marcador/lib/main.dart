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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
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
                    Expanded(
                      child: _buildTeamCard(
                        nombre: 'Equipo A',
                        imageUrl: 'https://imgs.search.brave.com/JzhHA6btfJOPaiyA4wXPb6X9Nq6QGf1Ar7nOGUmPWBw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy9j/L2MyL0NTRF9YZWxh/aiVDMyVCQV9NQ19v/ZmZpY2lhbF9sb2dv/LnBuZw',
                        puntos: scoreA,
                        colorFondo: colorA,
                        onIncrement: _incrementarA,
                        onDecrement: _decrementarA,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTeamCard(
                        nombre: 'Equipo B',
                        imageUrl: 'https://imgs.search.brave.com/NFs8LxQvuPr9zG7FwaEYKdWCyAZL3yyhB3hD2QNKdcA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/Z2VyLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS9pbWcvYi9SMjl2/WjJ4bC9BVnZYc0Vn/QTBpWU9oc0o4el9o/TDh3bDR6Mk5lYmEz/SS16aUlwa3hBTHJM/TWZIYmJSNFR2eGVv/dGl1NENEc1hEcXoy/R1FlLXItQ0ZSMTNy/emlvLWN5N0E0NGtV/VHp5RmY5X2tvMjRt/LWZZVmZNVExwdWkw/MS02ekFrcV92N0J6/ZVZRMWdvR2RPcmZ4/NzFHb3pDSG9QX2M4/V1d0WExraEgwSHR3/QmZPRGpXN2JqSkRv/Skp6Y3VsRlZwR1ZB/bDBxUlRIdmcvczE2/MDAwL0FudGlndWEl/MjBHdWF0ZW1hbGEl/MjBGQzUxMngucG5n',
                        puntos: scoreB,
                        colorFondo: colorB,
                        onIncrement: _incrementarB,
                        onDecrement: _decrementarB,
                      ),
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
      ),
    );
  }

  Widget _buildTeamCard({
    required String nombre,
    required String imageUrl,
    required int puntos,
    required Color colorFondo,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  height: 70,
                  width: 70,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.shield, size: 70, color: Colors.black54);
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            nombre,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            '$puntos',
            style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove_circle_outline_rounded),
                iconSize: 32,
                color: Colors.black87,
              ),
              IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add_circle_outline_rounded),
                iconSize: 32,
                color: Colors.black87,
              ),
            ],
          )
        ],
      ),
    );
  }
}