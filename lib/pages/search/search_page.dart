// lib/pages/search/search_page.dart
import 'package:biblioul/components/book_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './search_controller.dart';

class SearchPage extends StatelessWidget {
  Search2Controller control = Get.put(Search2Controller());

  SearchPage({super.key});

  Widget _bookList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: ListView.builder(
          itemCount: control.books.length,
          itemBuilder: (context, index) {
            final book = control.books[index];

            return BookInfo(
              book: book,
              context: context,
            );
          },
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    final List<Map<String, dynamic>> genresIndex = [];

    // Estados de selección (deberías mover esto a un StatefulWidget o usar StatefulBuilder)
    List<bool> selectedTopics =
        List.generate(control.genres.length, (index) => false);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite que el bottom sheet sea más alto
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Criterios de Búsqueda',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Subtítulo "Tópicos"
                  const Text(
                    'Tópicos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Lista de tópicos (scrollable)
                  // Tags (Chips)
                  Expanded(
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: control.genres.map((genre) {
                        int index = genre.id;
                        String title = genre.name;
                        bool isSelected =
                            control.genresIdsSelected.contains(index);
                        //bool isSelected = false;

                        return ActionChip(
                          label: Text(title),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isSelected) {
                                control.genresIdsSelected.remove(index);
                              } else {
                                control.genresIdsSelected.add(index);
                              }
                            });
                            //print(index);
                            //print(control.genresIdsSelected);
                          },
                          backgroundColor:
                              isSelected ? Colors.green : Colors.white,
                          side: BorderSide(
                            color: isSelected
                                ? Colors.green
                                : Colors.grey.shade400,
                            width: 1.5,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Botones BUSCAR y LIMPIAR
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Lógica para limpiar selección
                            setState(() {
                              control.genresIdsSelected.clear();
                              control.fetchAll();
                              Navigator.pop(context);
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.green),
                            foregroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'LIMPIAR',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Aquí procesas los tópicos seleccionados
                            control.searchByGenresIds();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'BUSCAR',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (control.books.isEmpty) {
          return const Center(
            child: Text("No hay libros"),
          );
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Libros Encontrados: ${control.books.length}'),
                  Row(
                    children: [
                      Icon(Icons.sort),
                      GestureDetector(
                        onTap: () {
                          print('Tap en icono');
                          _showDialog(context);
                        },
                        child: Icon(Icons.filter_1),
                      )
                    ],
                  )
                ],
              ),
            ),
            _bookList(context)
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    control.fetchAll();
    control.fetchAllGenres();
    return _buildBody(context);
  }
}
