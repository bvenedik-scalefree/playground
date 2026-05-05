{%- set yaml_metadata -%}
source_model: 
  TPCH: 'PART'
hashed_columns: 
    hk_part_h:
        - p_partkey
    hd_part_tpch_n_s:
        is_hashdiff: true
        columns:
          - p_name
          - p_mfgr
          - p_brand
          - p_type
          - p_size
          - p_container
          - p_retailprice
          - p_comment
ldts: "TO_TIMESTAMP('2026-04-16T12:00:00.000')"
rsrc: "'TPCH_SF10||PART'"
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