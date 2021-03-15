use fatura;

/* add some categories */
INSERT INTO categories (id, name, parent_id) VALUES (1, "cat1", 1);
INSERT INTO categories (id, name, parent_id) VALUES (2, "cat2", 2);
INSERT INTO categories (id, name, parent_id) VALUES (3, "cat3", 3);

INSERT INTO categories (id, name, parent_id) VALUES (4, "cat4", 1);
INSERT INTO categories (id, name, parent_id) VALUES (5, "cat5", 1);
INSERT INTO categories (id, name, parent_id) VALUES (6, "cat6", 5);

INSERT INTO categories (id, name, parent_id) VALUES (7, "cat7", 3);

/* add some products */
INSERT INTO products (id, name, image_uri, featured, category_id) VALUES (1, "prod1", "test_uri", false, 1);
INSERT INTO products (id, name, image_uri, featured, category_id) VALUES (2, "prod2", "test_uri", false, 2);
INSERT INTO products (id, name, image_uri, featured, category_id) VALUES (3, "prod3", "test_uri", false, 5);
INSERT INTO products (id, name, image_uri, featured, category_id) VALUES (4, "prod4", "test_uri", false, 6);
INSERT INTO products (id, name, image_uri, featured, category_id) VALUES (5, "prod5", "test_uri", false, 6);

/* add some providers */
INSERT INTO providers (id, name) VALUES (1, 'prov1');
INSERT INTO providers (id, name) VALUES (2, 'prov2');
INSERT INTO providers (id, name) VALUES (3, 'prov3');

/* add some product_providers */
INSERT INTO product_providers (product_id, provider_id, price, available) VALUES (3,1,50,true);
INSERT INTO product_providers (product_id, provider_id, price, available) VALUES (3,2,30,true);
INSERT INTO product_providers (product_id, provider_id, price, available) VALUES (2,1,20,false);
INSERT INTO product_providers (product_id, provider_id, price, available) VALUES (2,3,50,true);
INSERT INTO product_providers (product_id, provider_id, price, available) VALUES (5,1,30,true);
INSERT INTO product_providers (product_id, provider_id, price, available) VALUES (5,2,80,true);
INSERT INTO product_providers (product_id, provider_id, price, available) VALUES (5,3,20,true);







