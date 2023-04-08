with

    fonte_funcionarios_territorios as (

        select * from {{ source('erp', 'employee_territories') }}
    )
    , renomear as (
        select
            cast (employee_id	as int) as id_funcionario_territorio
            , cast (territory_id	as int)	as id_territorio	
        from fonte_funcionarios_territorios
    )
select *
from renomear