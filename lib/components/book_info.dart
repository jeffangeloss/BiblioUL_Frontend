// lib/components/book_info.dart
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookInfo extends StatelessWidget {
  final Book book;
  final BuildContext context;

  const BookInfo({super.key, required this.book, required this.context});

  void _onMenuSelected(String value) {
    switch (value) {
      case 'detalle':
        print('detalle');
        break;
      case 'leer':
        // enviar parámetro por parámetro
        // Navigator.pushNamed(context, '/read-book', arguments: {'pdf_url': book.pdfUrl});
        // enivar todo un objeto
        Navigator.pushNamed(context, '/read-book', arguments: book);
        break;
      case 'comentarios':
        print('comentarios');
        break;
      case 'calificar':
        print('calificar');
        break;
    }
  }

  Widget _vertMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: _onMenuSelected,
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: 'detalle',
          child: Text('Ver Detalle'),
        ),
        PopupMenuItem(
          value: 'leer',
          child: Text('Leer'),
        ),
        PopupMenuItem(
          value: 'comentarios',
          child: Text('Ver Comentarios'),
        ),
        PopupMenuItem(
          value: 'calificar',
          child: Text('Calificar'),
        ),
      ],
    );
  }

  Widget _detail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(book.title),
        Text('Páginas ${book.pages}'),
        Text('ISBN: ${book.isbn}'),
        Text('Editorial: ${book.publisher.name}'),
        Text('Año de Publicación: ${book.publicationYear}'),
        Text('Edición: ${book.editionYear}'),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 30,
              child: Image.network(
                book.coverImage,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/book.png',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Expanded(flex: 6, child: Text('')),
            Expanded(
              flex: 60,
              child: _detail(context),
            ),
            Expanded(
              flex: 10,
              child: Center(
                child: _vertMenu(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
