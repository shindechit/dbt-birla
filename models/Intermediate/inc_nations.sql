/*
{{ config(materialized='incremental', unique_key='nation_id',
incremental_strategy='delete+insert',
query_tag='inc_run-04')}}
*/
/*  working as  merge  operation */ 
{{ config(materialized='incremental', unique_key='nation_id', 
query_tag='inc_run-05')}}

select * from {{ ref('stg_nations') }}
