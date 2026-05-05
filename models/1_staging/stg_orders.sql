{%- set yaml_metadata -%}
source_model: 
  TPCH: 'ORDERS'
hashed_columns: 
    hk_orders_h:
        - o_orderkey
    hk_customer_h:
        - o_custkey
    hd_orders_tpch_n_s:
        is_hashdiff: true
        columns:
          - o_orderstatus
          - o_totalprice
          - o_orderdate
          - o_orderpriority
          - o_clerk
          - o_shippriority
          - o_comment
    hk_customer_orders_l:
        - o_orderkey
        - o_custkey
ldts: "TO_TIMESTAMP('2026-04-16T12:00:00.000')"
rsrc: "'TPCH_SF10||ORDERS'"
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict['source_model'],
                    ldts=metadata_dict['ldts'],
                    rsrc=metadata_dict['rsrc'],
                    hashed_columns=metadata_dict['hashed_columns'],
                    derived_columns=metadata_dict['derived_columns'],
                    missing_columns=none,
                    prejoined_columns=none,
                    include_source_columns=true) }}