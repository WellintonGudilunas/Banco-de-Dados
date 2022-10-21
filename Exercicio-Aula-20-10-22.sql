use northwind;
#### Nome: Wellinton Rafael Gudilunas
#### RGM: 29632633
#### Data: 20/10/2022
#### EXERCICIO 1 LETRA A
select 
    employees.first_name as primeiro_nome_vendedor, 
    products.product_name as nome_do_produto,
    order_details.quantity as quantidade_vendida,
    order_details.unit_price as preço_unitário,
    order_details.discount as desconto,
	((order_details.quantity * order_details.unit_price) - order_details.discount) as subTotal
from
	orders inner join order_details on orders.id = order_details.order_id
    inner join employees on orders.employee_id = employees.id
    inner join products on order_details.product_id = products.id
    order by subTotal;
    
#### EXERCICIO 1 LETRA B
select 
    employees.first_name as Nome_Vendedor, 
	customers.first_name as Nome_Cliente,
    products.product_name as Nome_produto,
    order_details.quantity as quantidade,
    order_details.unit_price as preço,
    order_details.discount as desconto,
	((order_details.quantity * order_details.unit_price) - order_details.discount) as subTotal
from
	orders inner join order_details on orders.id = order_details.order_id
    inner join employees on orders.employee_id = employees.id
    inner join products on order_details.product_id = products.id
    inner join customers on orders.customer_id = customers.id
    order by employees.first_name;
    
#Exercício 2 LETRA A
select  
	products.product_name as Nome_do_produto,
    purchase_order_details.quantity as quantidade,
    purchase_order_details.unit_cost as preço_unidade,
    purchase_order_details.date_received as data_recebimento,
    ((purchase_order_details.unit_cost * purchase_order_details.quantity)) as subtotal
    
from purchase_order_details
    inner join purchase_orders on purchase_order_details.purchase_order_id = purchase_orders.id
    inner join products on purchase_order_details.product_id = products.id;

#Exercício 2 LETRA B
select
	suppliers.company as fornecedor,
	products.product_name as Nome_do_produto,
    purchase_order_details.quantity as quantidade,
    purchase_order_details.unit_cost as preço_unidade,
    purchase_order_details.date_received as data_recebimento,
    ((purchase_order_details.unit_cost * purchase_order_details.quantity)) as subtotal
from purchase_order_details
    inner join purchase_orders on purchase_order_details.purchase_order_id = purchase_orders.id
    inner join products on purchase_order_details.product_id = products.id
    inner join suppliers on purchase_orders.supplier_id = suppliers.id
	order by suppliers.company;
	
#exercicios 3 Letra A
select 
	employees.first_name as nome_vendedor,
    sum(order_details.unit_price * order_details.quantity) as total_vendido
from orders
	inner join order_details on orders.id = order_details.order_id
    inner join employees on orders.employee_id = employees.id
    group by employees.first_name
    order by employees.first_name;

#exercicios 3 Letra B

select 
	employees.first_name as nome_vendedor,
    avg(order_details.unit_price * order_details.quantity) as total_vendido
from orders
	inner join order_details on orders.id = order_details.order_id
    inner join employees on orders.employee_id = employees.id
    group by employees.first_name
    order by employees.first_name;



#exercicios 3 Letra C
select 
	customers.first_name as nome_cliente,
    sum(order_details.unit_price * order_details.quantity) as total_comprado
from orders
	inner join order_details on orders.id = order_details.order_id
    inner join customers on orders.customer_id = customers.id
    group by customers.first_name
    order by customers.first_name;

#exercicios 3 Letra E
	
select
	suppliers.company as empresa,
    sum(purchase_order_details.quantity * purchase_order_details. unit_cost) as total_gasto
from purchase_order_details
    inner join purchase_orders on purchase_order_details.purchase_order_id = purchase_orders.id
    inner join products on purchase_order_details.product_id = products.id
    inner join suppliers on purchase_orders.supplier_id = suppliers.id
    group by suppliers.company;
	

	





