with source as (
    select * from {{ source('src', 'parts') }} part join 
                  {{ source('src','partsupps') }} partsupp on 
        part.p_partkey = partsupp.ps_partkey 
),
changed as (
    select
       -- ids
        p_partkey as part_id,
        -- descriptions
        p_name as name,
        p_mfgr as manufacturer,
        p_brand as brand,
        p_type as type,
        p_size as size,
        p_container as container,
         -- amounts
        p_retailprice as retail_price,
        p_comment as comment,
       
        -- supplier
        ps_suppkey as supplier_id,
        ps_availqty as available_quantity,
        ps_supplycost as cost
    from source
)
 
select * from changed
