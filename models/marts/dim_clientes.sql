with
    clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
    )
    , transformacoes as (
        select
            row_number() over (order by id_cliente) as sk_cliente
            , id_cliente /* Como nao houve necessidad de realizar joins as colunas finais foram inseridas aqui*/
            , nome_cliente
            , empresa_cliente
            , endereco_cliente
            , cep_cliente
            , cidade_cliente
            , regiao_cliente
            , pais_cliente
        from clientes
    )
select *
from transformacoes