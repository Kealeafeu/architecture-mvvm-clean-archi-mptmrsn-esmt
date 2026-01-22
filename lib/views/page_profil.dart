import 'package:flutter/material.dart';

// Définition d'un widget d'écran appelé PageProfil.
// Comme il est "Stateful", il peut gérer un état interne
// qui peut évoluer au cours de la vie du widget.
class PageProfil extends StatefulWidget {
  const PageProfil({super.key}); // Constructeur avec clé optionnelle

  @override
  State<PageProfil> createState() => _PageProfilState();
}

// Classe associée qui contient l'état du widget PageProfil.
// C'est ici que l'on définit la logique et l'interface graphique.
class _PageProfilState extends State<PageProfil> {
  @override
  Widget build(BuildContext context) {
    // Pour l'instant, on affiche simplement un widget Placeholder.
    // Placeholder est un widget Flutter qui sert de repère visuel
    // (une boîte grise avec une croix diagonale).
    // Il est utile pendant le développement pour marquer une zone
    // où l'on ajoutera plus tard du contenu réel.
    return const Placeholder();
  }
}