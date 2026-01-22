import 'package:flutter/material.dart';

// Définition d'un widget d'écran appelé PageCompteur.
// Comme il est "Stateful", il peut gérer un état interne
// qui pourra évoluer (par exemple un compteur qui s'incrémente).
class PageCompteur extends StatefulWidget {
  const PageCompteur({super.key}); // Constructeur avec clé optionnelle

  @override
  State<PageCompteur> createState() => _PageCompteurState();
}

// Classe associée qui contient l'état du widget PageCompteur.
// C'est ici que l'on définit la logique et l'interface graphique.
class _PageCompteurState extends State<PageCompteur> {
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