import 'package:projetoum/models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      icone: 'images/Bitcoin.svg.png',
      nome: 'Bitcoin',
      preco: 164300.00,
      sigla: 'BTC',
    ),

    Moeda(
      icone: 'images/1027.png',
      nome: 'Ethereum',
      preco: 14300.00,
      sigla: 'ETH',
    ),

    Moeda(
      icone: 'images/Binance Coin.png',
      nome: 'Binance Coin',
      preco: 4300.00,
      sigla: 'BNB',
    ),

    Moeda(
      icone: 'images/sasd.png',
      nome: 'Solana',
      preco: 64300.00,
      sigla: 'SOL',
    ),

    Moeda(
      icone: 'images/usdt.png',
      nome: 'Tether',
      preco: 300.00,
      sigla: 'USDT',
    ),

    Moeda(icone: 'images/4172.png', nome: 'Terra', preco: 30.00, sigla: 'LUNA'),

    Moeda(icone: 'images/4195.png', nome: 'FTT', preco: 3.00, sigla: 'FTT'),

    Moeda(
      icone: 'images/8757.png',
      nome: 'Safemoon',
      preco: 0.30,
      sigla: 'SFO',
    ),

    Moeda(
      icone: 'images/12689.png',
      nome: 'Squid Game',
      preco: 0.50,
      sigla: 'SQUID',
    ),

    Moeda(
      icone: 'images/BitConnect.png',
      nome: 'Bitconnect',
      preco: 1.50,
      sigla: 'BNT',
    ),
  ];
}
