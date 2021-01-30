create temporary function hash_compute as 'Hashstring';

CREATE TABLE orders (
    order_uid  BIGINT,
    product_name String,
    price      DECIMAL(32, 2),
    order_time TIMESTAMP(3)
) WITH (
    'connector' = 'datagen'
);
 

select hash_compute(product_name) from orders;