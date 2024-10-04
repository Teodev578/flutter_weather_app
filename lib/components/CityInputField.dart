import 'package:flutter/material.dart';

class CityInputField extends StatelessWidget {
  final Function(String)
      onCitySubmitted; // Fonction à exécuter lors de la soumission du nom de la ville

  CityInputField({required this.onCitySubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Entrez le nom de la ville',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0), // Changer le radius ici
          ),
          suffixIcon: Icon(Icons.search), // Icône de recherche
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            onCitySubmitted(value); // Exécution de la fonction passée
          }
        },
      ),
    );
  }
}
