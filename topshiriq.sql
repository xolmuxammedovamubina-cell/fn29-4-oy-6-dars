DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shops;

CREATE TABLE IF NOT EXISTS shops (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    shop_id INTEGER REFERENCES shops(id)
);

INSERT INTO shops (name, address) VALUES
('Korzinka', 'Tashkent'),
('Makro', 'Fergana'),
('Havas', 'Andijan');

INSERT INTO products (name, price, shop_id) VALUES
('Olma', 18000, 1),
('Nok', 19000, 1),
('Banan', 21000, 1),
('Anor', 22000, 2),
('Uzum', 20000, 2),
('Shaftoli', 23000, 2),
('Behi', 24000, 3),
('Xurmo', 25000, 3),
('Limon', 15000, 3);

SELECT * FROM shops;
SELECT * FROM products;
SELECT * FROM products WHERE shop_id = 1;

UPDATE products SET price = 25000 WHERE id = 1;

UPDATE products SET shop_id = 2 WHERE id = 1;

UPDATE shops SET name = 'Korzinka Plus', address = 'Tashkent City' WHERE id = 1;

DELETE FROM products WHERE id = 1;

SELECT 
    s.name AS shop_name, 
    p.name AS product_name, 
    p.price 
FROM products p
JOIN shops s ON s.id = p.shop_id;

INSERT INTO products (name, price, shop_id) VALUES ('Mandarin', 30000, 99);

DELETE FROM shops WHERE id = 2;
DELETE FROM products WHERE shop_id = 3;
DELETE FROM shops WHERE id = 3;