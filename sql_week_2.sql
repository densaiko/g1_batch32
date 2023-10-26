INSERT INTO batch_32.vio
(id, nama, tempat_lahir, tanggal_lahir, background_studi, jarak_rumah, nomor_sepatu)
values
(2, 'Vio W P', 'Cirebon', '1999-08-25', 'Teknik Telekomunikasi', 30, 42),
(3, 'Vio W P', 'Cirebon', '1999-08-25', 'Teknik Telekomunikasi', 30, 42),
(4, 'Rin', 'New York', '1999-08-25', 'Teknik Telekomunikasi', 30, 42),
(5, 'Rafa', 'Jeddah', '1999-08-25', 'Teknik Telekomunikasi', 30, 42)
;

update batch_32.vio set nama = 'Vio W Prinandita' where tempat_lahir = 'Cirebon';


select*from batch_32.vio;

select id, nama, background_studi from batch_32.vio;

select customer_id, customer_city
from batch_32.customer_data cd
where customer_state ='SP'
limit 5;

delete from batch_32.vio
where id = 5;

select *
from batch_32.customer_data
where customer_city like '%paulo%'
limit 10

select upper(customer_city) as city_upper, *
from batch_32.customer_data
where customer_city = lower('sau paulo');
limit 10

select concat(customer_city, ' ', customer_state, ' ', customer_zip_code_prefix) as labels
from batch_32.customer_data

select 
	product_category_name,
	nullif('no category', product_category_name) as product_category_name_ifnull,
	coalesce(product_category_name, 'no category') as product_category_name_cleaned
from batch_32.product_data
where product_category_name is null

select 
	date(order_purchase_timestamp) as view_purchase_date,
	date(date_trunc('month', date(order_purchase_timestamp))) as month_purchase_date,
	date_part('month', date(order_purchase_timestamp)) as month_purchase_date,
	order_purchase_timestamp 
from batch_32.orders_data
where date_part('month', date(order_purchase_timestamp)) = 7

with first_table as
(select o1.order_id, shipping_limit_date,  freight_value,
	o2.customer_id, order_status, order_purchase_timestamp,
	p.product_category_name
from order_items_data as o1
left join orders_data as o2
on o1.order_id = o2.order_id
left join product_data as p
on o1.product_id = p.product_id),
second_table as 
(select f.*, c.customer_city, c.customer_state
from first_table as f
left join customer_data as c
on f.customer_id = c.customer_id)

select*
from second_table