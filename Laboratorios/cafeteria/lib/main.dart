import 'package:flutter/material.dart';

void main() {
  runApp(const CafeteriaApp());
}

class CafeteriaApp extends StatelessWidget {
  const CafeteriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Pedido',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepOrange,
      ),
      home: const PedidoScreen(),
    );
  }
}

class PedidoScreen extends StatefulWidget {
  const PedidoScreen({super.key});

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  int cantCafe = 0;
  int cantSandwich = 0;
  int cantJugo = 0;

  final double precioCafe = 10.00;
  final double precioSandwich = 25.00;
  final double precioJugo = 12.00;

  void _modificarCantidad(String producto, int cambio) {
    setState(() {
      if (producto == 'cafe') {
        cantCafe += cambio;
        if (cantCafe < 0) cantCafe = 0;
      } else if (producto == 'sandwich') {
        cantSandwich += cambio;
        if (cantSandwich < 0) cantSandwich = 0; 
      } else if (producto == 'jugo') {
        cantJugo += cambio;
        if (cantJugo < 0) cantJugo = 0;
      }
    });
  }

  void _vaciarPedido() {
    setState(() {
      cantCafe = 0;
      cantSandwich = 0;
      cantJugo = 0;
    });
  }

  double get _total {
    return (cantCafe * precioCafe) + (cantSandwich * precioSandwich) + (cantJugo * precioJugo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi pedido', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade100,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProductoPedido(
                nombre: 'Café',
                precio: precioCafe,
                cantidad: cantCafe,
                onDecrement: () => _modificarCantidad('cafe', -1),
                onIncrement: () => _modificarCantidad('cafe', 1),
              ),
              const Divider(),
              ProductoPedido(
                nombre: 'Sándwich',
                precio: precioSandwich,
                cantidad: cantSandwich,
                onDecrement: () => _modificarCantidad('sandwich', -1),
                onIncrement: () => _modificarCantidad('sandwich', 1),
              ),
              const Divider(),
              ProductoPedido(
                nombre: 'Jugo',
                precio: precioJugo,
                cantidad: cantJugo,
                onDecrement: () => _modificarCantidad('jugo', -1),
                onIncrement: () => _modificarCantidad('jugo', 1),
              ),
              
              const Spacer(),
              
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Q${_total.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.deepOrange),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _vaciarPedido,
                  icon: const Icon(Icons.delete_outline_rounded),
                  label: const Text('Vaciar pedido', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.red.shade50,
                    foregroundColor: Colors.red,
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Q${precio.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove_circle_outline_rounded),
                iconSize: 32,
                color: Colors.grey.shade600,
              ),
              SizedBox(
                width: 35,
                child: Text(
                  '$cantidad',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add_circle_outline_rounded),
                iconSize: 32,
                color: Colors.deepOrange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}