import 'package:list_of_lists/core/utils/base64images.dart';

final createUser = """
CREATE TABLE user(
id INTEGER PRIMARY KEY AUTOINCREMENT
, name VARCHAR (150) NOT NULL
, create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
, status CHAR(1) NOT NULL DEFAULT 'A'
);
""";

final createLista = """
CREATE TABLE lista(
id INTEGER PRIMARY KEY AUTOINCREMENT
, name VARCHAR (150) NOT NULL
, icon INTEGER DEFAULT 0xe385
, id_user INT NOT NULL
, create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
, status CHAR(1) NOT NULL DEFAULT 'A'
, FOREIGN KEY (id_user) REFERENCES user(id)
);
""";

final createItem = """
CREATE TABLE item(
id INTEGER PRIMARY KEY AUTOINCREMENT
, name VARCHAR (150) NOT NULL
, url_photo VARCHAR(300)
, base64_photo VARCHAR(500)
, id_list INT NOT NULL
, create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
, status CHAR(1) NOT NULL DEFAULT 'A'
, FOREIGN KEY (id_list) REFERENCES list(id)
);
""";

///Inserts///

final insertUser = """
INSERT INTO user (name)
VALUES('Kairo');
""";

final insertLista = """
INSERT INTO lista (name, icon,id_user)
VALUES('Lista 1', 0xf6f4,1), ('Lista Fullmetal', 0xe7e5,1), ('Lista Kairo', 0xf85a,1), ('Lista Compras', 0xe216,1);
""";

final insertLista2 = """
INSERT INTO lista (name,id_user)
VALUES('Lista ASDASDASD',1);
""";

final insertItem = """
INSERT INTO item (name, id_list)
VALUES('Objeto 1',4), ('Objeto 2',4), ('Objeto 3',4),('Objeto 4',4) ,('Objeto 5',4);
""";

final insertItem2 = """
INSERT INTO item (name, id_list)
VALUES('Objeto 1',2), ('Objeto 2',3), ('Objeto 3',2),('Objeto 4',3) ,('Objetoasdasd 5',2);
""";

final insertItem3 = """
INSERT INTO item (name, base64_photo, id_list)
VALUES('Objeto 1', '${base64images.IMAGE1}',1), ('Objeto 2', '${base64images.IMAGE3}',1), 
('Objeto 3', '${base64images.IMAGE2}',1),('Objeto 4', '${base64images.IMAGE2}',1) ,
('Objeto 5', '${base64images.IMAGE3}',1);
""";