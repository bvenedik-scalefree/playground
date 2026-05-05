{%- set yaml_metadata -%}
source_model: 
  TPCH: 'LINEITEM'
hashed_columns: 
    hk_orders_part_supplier_nl:
        - l_orderkey
        - l_partkey
        - l_suppkey
        - l_linenumber
    hk_orders_h:
        - l_orderkey
    hk_part_h:
        - l_partkey
    hk_supplier_h:
        - l_suppkey
ldts: "TO_TIMESTAMP('2026-04-16T12:00:00.000')"
rsrc: "'TPCH_SF10||LINEITEM'"
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict['source_model'],
                    ldts=metadata_dict['ldts'],
                    rsrc=metadata_dict['rsrc'],
                    hashed_columns=metadata_dict['hashed_columns'],
                    derived_columns=none,
                    missing_columns=none,
                    prejoined_columns=none,
                    include_source_columns=true) }}