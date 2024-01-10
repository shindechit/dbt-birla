{{
    config (
        schema = 'testing',
        store_failures = true
    ) 
}}

with orders as 
    (    
    select * from {{ ref( 'stg_orders' ) }}  
    )  

select order_id, 
       sum(total_price) ordertotal from orders  
group by order_id 
having (ordertotal<=870)


