CREATE DATABASE fatura;
USE fatura;

CREATE TABLE categories(
  id INT NOT NULL,
  name VARCHAR(45),
  parent_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_PARENT_ID_tbl_CATEGORIES FOREIGN KEY (parent_id) REFERENCES categories(id)
);

CREATE TABLE products(
  id INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  image_uri VARCHAR(45),
  featured BOOLEAN DEFAULT false,
  category_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_CATEGORY_ID_tbl_CATEGORIES FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE providers(
  id INT NOT NULL,
  name VARCHAR(45),
  PRIMARY KEY (id)
);

CREATE TABLE product_providers(
  product_id INT NOT NULL,
  provider_id INT NOT NULL,
  price DOUBLE NOT NULL,
  available BOOLEAN,
  CONSTRAINT PK_PRODUCT_PROVIDER PRIMARY KEY (product_id, provider_id),
  CONSTRAINT FK_PRODUCT_ID_tbl_PRODUCTS FOREIGN KEY (product_id) REFERENCES products(id),
  CONSTRAINT FK_PRODUCT_ID_tbl_PROVIDERS FOREIGN KEY (provider_id) REFERENCES providers(id)
);