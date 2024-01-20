SELECT product_id, product_name, category_id
FROM products
WHERE category_id = (SELECT category_id FROM products WHERE product_id = 123);

