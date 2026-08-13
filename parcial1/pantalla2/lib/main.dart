import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pantalla 2 - Add Money',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        useMaterial3: true,
      ),
      home: const Pantalla2(),
    );
  }
}

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key});

  @override
  State<Pantalla2> createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
  
  int _selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Atrás presionado'),
                          duration: Duration(milliseconds: 600),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Add money',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 24),

          
              const Text(
                'Select card',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

          
              SizedBox(
                height: 135,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                   
                    _buildCreditCard(
                      index: 0,
                      bgColor: const Color(0xFFCCE852),
                      textColor: Colors.black,
                      cardNumber: '•••• 4568',
                      brandWidget: _buildMastercardLogo(),
                    ),
                    const SizedBox(width: 12),

                  
                    _buildCreditCard(
                      index: 1,
                      bgColor: const Color(0xFF1C1C1E),
                      textColor: Colors.white,
                      cardNumber: '•••• 2478',
                      brandWidget: const Text(
                        'VISA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                
                    _buildCreditCard(
                      index: 2,
                      bgColor: const Color(0xFF3A3A3C),
                      textColor: Colors.white,
                      cardNumber: '•••• 9102',
                      brandWidget: const Text(
                        'VISA',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              const Text(
                'Add money to Neobank',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              _buildOptionTile(
                icon: Icons.sync_rounded,
                title: 'Move your direct deposit',
              ),
              const SizedBox(height: 10),

              _buildOptionTile(
                icon: Icons.swap_horiz_rounded,
                title: 'Transfer from other banks',
              ),
              const SizedBox(height: 10),

              _buildOptionTile(
                icon: Icons.apple_rounded,
                title: 'Apple Pay',
              ),
              const SizedBox(height: 10),

              _buildOptionTile(
                icon: Icons.credit_card_rounded,
                title: 'Debit / Credit Card',
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCreditCard({
    required int index,
    required Color bgColor,
    required Color textColor,
    required String cardNumber,
    required Widget brandWidget,
  }) {
    final bool isSelected = _selectedCardIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCardIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(22),
          border: isSelected
              ? Border.all(color: Colors.black, width: 2.5)
              : Border.all(color: Colors.transparent, width: 2.5),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: isSelected
                      ? textColor
                      : textColor.withValues(alpha: 0.4),
                ),
                brandWidget,
              ],
            ),
            Text(
              cardNumber,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: textColor,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMastercardLogo() {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: const BoxDecoration(
            color: Color(0xFFEB001B),
            shape: BoxShape.circle,
          ),
        ),
        Transform.translate(
          offset: const Offset(-5, 0),
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: const Color(0xFFF79E1B).withValues(alpha: 0.9),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionTile({required IconData icon, required String title}) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Seleccionado: $title'),
              duration: const Duration(milliseconds: 800),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.black, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}