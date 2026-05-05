{%- set yaml_metadata -%}
parent_hashkey: 'hk_orders_h'
src_hashdiff: 'hd_orders_tpch_n_s'
src_payload:
    - o_orderstatus
    - o_totalprice
    - o_orderdate
    - o_orderpriority
    - o_clerk
    - o_shippriority
    - o_comment
source_model: 'stg_orders'
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set parent_hashkey = metadata_dict['parent_hashkey'] -%}
{%- set src_hashdiff = metadata_dict['src_hashdiff'] -%}
{%- set source_model = metadata_dict['source_model'] -%}
{%- set src_payload = metadata_dict['src_payload'] -%}


{{ datavault4dbt.sat_v0(parent_hashkey=parent_hashkey,
                        src_hashdiff=src_hashdiff,
                        source_model=source_model,
                        src_payload=src_payload) }}