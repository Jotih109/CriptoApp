import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projetoum/repositories/moedarepo.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  Color color = Colors.blue;
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String formatCurrency(double value) {
    final parts = value.toStringAsFixed(2).split('.');
    final integerPart = parts[0];
    final centsPart = parts[1];
    final formattedInt = integerPart.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
    return 'R\$ $formattedInt,$centsPart';
  }

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cripto Moedas',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: color,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                color =
                    Colors.primaries[Random().nextInt(Colors.primaries.length)];
              });
            },
            icon: const Icon(Icons.color_lens),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextFormField(
              controller: controller,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                hintText: 'Filtrar lista...',
                suffixIcon: controller.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controller.clear();
                          setState(() {});
                        },
                      ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: (() {
                final filtro = controller.text.trim().toLowerCase();
                if (filtro.isEmpty) return tabela.length;
                return tabela
                    .where((m) => m.nome.toLowerCase().contains(filtro))
                    .length;
              })(),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final filtro = controller.text.trim().toLowerCase();
                final listaFiltrada = filtro.isEmpty
                    ? tabela
                    : tabela
                          .where((m) => m.nome.toLowerCase().contains(filtro))
                          .toList();

                final moeda = listaFiltrada[index];

                return ListTile(
                  leading: Image.asset(moeda.icone, width: 60),
                  title: Text(moeda.nome, style: const TextStyle(fontSize: 22)),
                  subtitle: Text(
                    moeda.sigla,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  trailing: Text(
                    formatCurrency(moeda.preco),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 108, 116, 106),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
