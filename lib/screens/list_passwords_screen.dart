import 'package:flutter/material.dart';

class PasswordListScreen extends StatelessWidget {
  const PasswordListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de negócios mockados
    final businesses = [
      'Banco Central',
      'Restaurante Gourmet',
      'Farmácia Saúde',
      'Supermercado Local',
      'Loja de Roupas',
      'Café Expresso',
      'Academia Fit',
      'Cinema Central',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Senhas')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3 / 2,
          ),
          itemCount: businesses.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    businesses[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
