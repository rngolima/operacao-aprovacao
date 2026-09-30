import 'package:flutter/material.dart';

/// Item individual de um ramo do mapa mental
class MapaMentalItem {
  final String titulo;
  final String descricao;
  final String? exemplo;
  final String? mnemonico;

  const MapaMentalItem({
    required this.titulo,
    required this.descricao,
    this.exemplo,
    this.mnemonico,
  });
}

/// Ramo estruturado do mapa mental temático
class MapaMentalRamo {
  final String tituloRamo;
  final String subtitulo;
  final Color corRamo;
  final IconData icone;
  final List<MapaMentalItem> itens;

  const MapaMentalRamo({
    required this.tituloRamo,
    required this.subtitulo,
    required this.corRamo,
    required this.icone,
    required this.itens,
  });
}

/// Modelo completo do Mapa Mental Tático do CRAVOU
class MapaMentalData {
  final String titulo;
  final String conceitoCentral;
  final String regraDeOuro;
  final List<MapaMentalRamo> ramos;

  const MapaMentalData({
    required this.titulo,
    required this.conceitoCentral,
    required this.regraDeOuro,
    required this.ramos,
  });
}
