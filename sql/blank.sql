SELECT DISTINCT 
cat.nome AS cliente,
ir.id AS matricula,
cata.fantasia AS unidade,
'Segtruck' AS empresa

FROM silver.insurance_registration AS ir
LEFT JOIN silver.insurance_reg_set irs ON irs.parent = ir.id
LEFT JOIN silver.insurance_status ins ON ins.id = irs.id_status 
LEFT JOIN silver.representante r ON r.codigo=irs.id_unity
LEFT JOIN silver.cliente cli ON cli.codigo=ir.customer_id
LEFT JOIN silver.catalogo cata ON cata.cnpj_cpf=r.cnpj_cpf
LEFT JOIN silver.catalogo cat ON cat.cnpj_cpf=cli.cnpj_cpf

WHERE ins.id=7

-----------------------------------------------------------
UNION ALL
-----------------------------------------------------------

SELECT DISTINCT 
cat.nome AS cliente,
ir.id AS matricula,
cata.fantasia AS unidade,
'Stcoop' AS empresa

FROM stcoop.insurance_registration AS ir
LEFT JOIN stcoop.insurance_reg_set irs ON irs.parent = ir.id
LEFT JOIN stcoop.insurance_status ins ON ins.id = irs.id_status 
LEFT JOIN stcoop.representante r ON r.codigo=irs.id_unity
LEFT JOIN stcoop.cliente cli ON cli.codigo=ir.customer_id
LEFT JOIN stcoop.catalogo cata ON cata.cnpj_cpf=r.cnpj_cpf
LEFT JOIN stcoop.catalogo cat ON cat.cnpj_cpf=cli.cnpj_cpf

WHERE ins.id=7

-----------------------------------------------------------
UNION ALL
-----------------------------------------------------------

SELECT DISTINCT 
cat.nome AS cliente,
ir.id AS matricula,
cata.fantasia AS unidade,
'Viavante' AS empresa

FROM viavante.insurance_registration AS ir
LEFT JOIN viavante.insurance_reg_set irs ON irs.parent = ir.id
LEFT JOIN viavante.insurance_status ins ON ins.id = irs.id_status 
LEFT JOIN viavante.representante r ON r.codigo=irs.id_unity
LEFT JOIN viavante.cliente cli ON cli.codigo=ir.customer_id
LEFT JOIN viavante.catalogo cata ON cata.cnpj_cpf=r.cnpj_cpf
LEFT JOIN viavante.catalogo cat ON cat.cnpj_cpf=cli.cnpj_cpf

WHERE ins.id=7

