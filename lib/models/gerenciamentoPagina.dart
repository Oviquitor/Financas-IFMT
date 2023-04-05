import 'package:flutter/material.dart';

class GerenciamentoPagina {
  PageController _pageController;
  int paginaAtual = 0;
  GerenciamentoPagina(this._pageController);

  void setPage(int pagina) {
    if (pagina == paginaAtual) return;
    paginaAtual = pagina;
    _pageController.jumpToPage(pagina);
  }
}