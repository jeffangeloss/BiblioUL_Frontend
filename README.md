# UL BiblioApp

## Enunciado

Una empresa <b>tecnológica está desarrollando</b> una aplicación de lectura digital para gestionar una biblioteca virtual y el comportamiento de sus lectores. Cada usuario lector debe registrar sus datos personales, co-mo nombres, apellidos, correo electrónico, fecha de nacimiento, foto de perfil, sexo (masculino o feme-nino) y nacionalidad. Esta nacionalidad incluye además del nombre del país, el gentilicio masculino y femenino, así como una imagen de su bandera. Para facilitar el acceso a la plataforma desde diferentes me-dios, los lectores pueden registrar múltiples dispositivos, identificando para cada uno la marca y el tipo de dispositivo (como e-reader, tablet o smartphone).

La biblioteca debe incluir un amplio catálogo de libros, con información como título, ISBN, número de pá-ginas, año de publicación, año de edición, sinopsis, y una imagen de portada. Cada libro pertenece a una editorial específica, de la cual se registra su nombre y logo. Además, los libros pueden clasificarse en múl-tiples géneros (como ciencia ficción, romance o terror) y estar asociados a uno o más autores, cuyos datos incluyen nombre completo, fecha de nacimiento y una imagen. Los lectores pueden calificar (1,2,3,4 o 5) y comentar los libros que han leído, indicando su opinión y la fecha en que dejaron su reseña.

Ejemplo de lista:

+ Elemento 1
+ Elemento 2

## Base de Datos

La base de datos es Sqlite3 y el esquema es el siguiente:

```sql
PRAGMA foreign_keys = ON;

-- Tabla sexs
CREATE TABLE sexs (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20)
);

-- Tabla nationalities
CREATE TABLE nationalities (
    id INTEGER PRIMARY KEY,
    country_name VARCHAR(100),
    male_demonym VARCHAR(100),
    female_demonym VARCHAR(100),
    flag_image TEXT
);

-- Tabla users
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    birth_date DATE,
    profile_picture TEXT,
    sex_id INTEGER,
    nationality_id INTEGER,
    FOREIGN KEY (sex_id) REFERENCES sexs(id),
    FOREIGN KEY (nationality_id) REFERENCES nationalities(id)
);

-- Tabla device_types
CREATE TABLE device_types (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50)
);

-- Tabla devices
CREATE TABLE devices (
    id INTEGER PRIMARY KEY,
    brand VARCHAR(100),
    device_type_id INTEGER,
    user_id INTEGER,
    FOREIGN KEY (device_type_id) REFERENCES device_types(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tabla publishers
CREATE TABLE publishers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    logo TEXT
);

-- Tabla books
CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    isbn VARCHAR(20),
    pages INTEGER,
    publication_year INTEGER,
    edition_year INTEGER,
    synopsis VARCHAR(300),
    cover_image VARCHAR(100),
    publisher_id INTEGER,
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);

-- Tabla genres
CREATE TABLE genres (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100)
);

-- Tabla authors
CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    full_name VARCHAR(255),
    birth_date DATE,
    picture TEXT
);

-- Tabla reviews
CREATE TABLE reviews (
    id INTEGER PRIMARY KEY,
    rating SMALLINT,
    comment TEXT,
    review_date TIMESTAMP,
    user_id INTEGER,
    book_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Tabla intermedia books_genres
CREATE TABLE books_genres (
    book_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (book_id, genre_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- Tabla intermedia books_authors
CREATE TABLE books_authors (
    book_id INTEGER,
    author_id INTEGER,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);
```

| Campo | Tipo        | Descripción                           |
| ----- | ----------- | ------------------------------------- |
| id    | INTEGER     | Identificador único del sexo          |
| name  | VARCHAR(20) | Nombre del sexo (masculino, femenino) |

El diagrama es el siguiente:

![Diagrama de base de datos](./docs/der.png)
