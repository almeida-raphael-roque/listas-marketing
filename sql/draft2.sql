SELECT DISTINCT 
cata.fantasia AS unidade,
cat.nome AS cliente,
'Viavante' AS empresa,
ir.id AS matricula,

FROM viavante.insurance_registration AS ir
LEFT JOIN viavante.insurance_reg_set irs ON irs.parent = ir.id
LEFT JOIN viavante.insurance_status ins ON ins.id = irs.id_status 
LEFT JOIN viavante.representante r ON r.codigo=irs.id_unity
LEFT JOIN viavante.cliente cli ON cli.codigo=ir.customer_id
LEFT JOIN viavante.catalogo cata ON cata.cnpj_cpf=r.cnpj_cpf
LEFT JOIN viavante.catalogo cat ON cat.cnpj_cpf=cli.cnpj_cpf

WHERE ins.id=7

