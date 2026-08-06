import 'package:flutter/material.dart';

void main() {
  runApp(const CompraSmartApp());
}

class CompraSmartApp extends StatelessWidget {
  const CompraSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CheckYourCaloriesSmart',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: const Color(0xffF6F8FB),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productos = [
      {"nombre": "Leche", "comprado": true},
      {"nombre": "Huevos", "comprado": false},
      {"nombre": "Arroz", "comprado": true},
      {"nombre": "Pollo", "comprado": false},
      {"nombre": "Aceite", "comprado": false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CheckYourCaloriesSmar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "¡Buenos días, Mireya! ",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Organiza tus compras familiares",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: const [

                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.green,
                      size: 45,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Presupuesto semanal",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      "Q800",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Disponible: Q800",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Lista de compras",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CheckboxListTile(
                      value: productos[index]["comprado"] as bool,
                      onChanged: (_) {},
                      activeColor: Colors.green,
                      title: Text(
                        productos[index]["nombre"] as String,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text("Agregar producto"),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Continuar",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}