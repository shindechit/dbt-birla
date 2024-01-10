/*
with source as (
    select * from {{ source('src', 'lineitems') }}
),
changed as (
    select
        seq_lineitem.nextval  as order_item_id ,
       L_ORDERKEY as order_id  ,
	L_PARTKEY as part_id ,
	L_SUPPKEY as supplier_id ,
	L_LINENUMBER as line_number,
	L_QUANTITY  as quantity ,
	L_EXTENDEDPRICE as extended_price ,
	L_DISCOUNT  as discount_percentage,
	L_TAX  as tax_rate ,
	L_RETURNFLAG  as return_flag,
	L_LINESTATUS as status_code ,
	L_SHIPDATE  as ship_date ,
	L_COMMITDATE as commit_date ,
	L_RECEIPTDATE  as receipt_date ,
	L_SHIPINSTRUCT  as ship_instruct  ,
	L_SHIPMODE as ship_mode  ,
	L_COMMENT  as  comment
 
    from source
)
 
select * from changed 
*/


{# install dbt-utils #}
 
with source as (
 
    select * from {{ source('src', 'lineitems') }}
 
),
 
changed as (
 
    select
 
        -- ids
        {{ dbt_utils.surrogate_key(['l_orderkey', 'l_linenumber']) }}
            as order_item_id,
        l_orderkey as order_id,
        l_partkey as part_id,
        l_suppkey as supplier_id,
 
        -- descriptions
        l_linenumber as line_number,
        l_comment as comment,
        l_shipmode as ship_mode,
        l_shipinstruct as ship_instructions,
        -- numbers
        l_quantity as quantity,
        l_extendedprice as extended_price,
        l_discount as discount_percentage,
        l_tax as tax_rate,
        -- status
        l_linestatus as status_code,
        l_returnflag as return_flag,
        -- dates
        l_shipdate as ship_date,
        l_commitdate as commit_date,
        l_receiptdate as receipt_date
 
    from source
 
)
 
select * from changed 
