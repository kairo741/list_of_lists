
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

final insertItem = """
INSERT INTO item (name, id_list)
VALUES('Objeto 1',1), ('Objeto 2',1), ('Objeto 3',1),('Objeto 4',1) ,('Objeto 5',1);
""";

final insertLista = """
INSERT INTO lista (name, id_user)
VALUES('Lista 1', 1);
""";

