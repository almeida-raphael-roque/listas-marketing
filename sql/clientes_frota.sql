SELECT DISTINCT
cat.nome AS cliente,
cat.pessoa AS pessoa,
COUNT(
    COALESCE(iv.board, it.board, itt.board)
    ) AS qtd_placas,
en.fone1 AS fone1,
en.fone2 AS fone2,
en.e_mail AS email,
ir.id AS matricula,
cata.fantasia AS unidade,
'Segtruck' AS empresa

FROM silver.insurance_registration AS ir
LEFT JOIN silver.insurance_reg_set irs ON irs.parent = ir.id
LEFT JOIN silver.insurance_reg_set_coverage irsc ON irsc.parent = irs.id
LEFT JOIN silver.insurance_reg_set_cov_trailer irsct ON irsct.parent = irsc.id

LEFT JOIN silver.insurance_vehicle iv ON iv.id = irsc.id_vehicle
LEFT JOIN silver.insurance_trailer it ON it.id = irsct.id_trailer
LEFT JOIN silver.insurance_trailer itt ON itt.id = irsc.id_trailer

LEFT JOIN silver.insurance_status ins ON ins.id = irs.id_status 
LEFT JOIN silver.insurance_status insc ON insc.id = irsc.id_status

LEFT JOIN silver.representante r ON r.codigo=irs.id_unity
LEFT JOIN silver.cliente cli ON cli.codigo=ir.customer_id
LEFT JOIN silver.catalogo cata ON cata.cnpj_cpf=r.cnpj_cpf
LEFT JOIN silver.catalogo cat ON cat.cnpj_cpf=cli.cnpj_cpf
LEFT JOIN silver.endereco en ON en.cnpj_cpf = cat.cnpj_cpf

WHERE ins.id=7
AND insc.id=11
AND COALESCE(iv.board, it.board, itt.board) IS NOT NULL

GROUP BY 
cat.nome,
cat.pessoa,
en.fone1,
en.fone2,
en.e_mail,
ir.id,
cata.fantasia,
'Segtruck'

HAVING 
COUNT(
    COALESCE(iv.board, it.board, itt.board)
    ) > 3

----------------------------------------------------------------
UNION ALL
----------------------------------------------------------------

SELECT DISTINCT
cat.nome AS cliente,
cat.pessoa AS pessoa,
COUNT(
    COALESCE(iv.board, it.board, itt.board)
    ) AS qtd_placas,
en.fone1 AS fone1,
en.fone2 AS fone2,
en.e_mail AS email,
ir.id AS matricula,
cata.fantasia AS unidade,
'Stcoop' AS empresa

FROM stcoop.insurance_registration AS ir
LEFT JOIN stcoop.insurance_reg_set irs ON irs.parent = ir.id
LEFT JOIN stcoop.insurance_reg_set_coverage irsc ON irsc.parent = irs.id
LEFT JOIN stcoop.insurance_reg_set_cov_trailer irsct ON irsct.parent = irsc.id

LEFT JOIN stcoop.insurance_vehicle iv ON iv.id = irsc.id_vehicle
LEFT JOIN stcoop.insurance_trailer it ON it.id = irsct.id_trailer
LEFT JOIN stcoop.insurance_trailer itt ON itt.id = irsc.id_trailer

LEFT JOIN stcoop.insurance_status ins ON ins.id = irs.id_status 
LEFT JOIN stcoop.insurance_status insc ON insc.id = irsc.id_status

LEFT JOIN stcoop.representante r ON r.codigo=irs.id_unity
LEFT JOIN stcoop.cliente cli ON cli.codigo=ir.customer_id
LEFT JOIN stcoop.catalogo cata ON cata.cnpj_cpf=r.cnpj_cpf
LEFT JOIN stcoop.catalogo cat ON cat.cnpj_cpf=cli.cnpj_cpf
LEFT JOIN stcoop.endereco en ON en.cnpj_cpf = cat.cnpj_cpf

WHERE ins.id=7
AND insc.id=11
AND COALESCE(iv.board, it.board, itt.board) IS NOT NULL

GROUP BY 
cat.nome,
cat.pessoa,
en.fone1,
en.fone2,
en.e_mail,
ir.id,
cata.fantasia,
'Stcoop'

HAVING 
COUNT(
    COALESCE(iv.board, it.board, itt.board)
    ) > 3

----------------------------------------------------------------
UNION ALL
----------------------------------------------------------------

SELECT DISTINCT
cat.nome AS cliente,
cat.pessoa AS pessoa,
COUNT(
    COALESCE(iv.board, it.board, itt.board)
    ) AS qtd_placas,
en.fone1 AS fone1,
en.fone2 AS fone2,
en.e_mail AS email,
ir.id AS matricula,
cata.fantasia AS unidade,
'Viavante' AS empresa

FROM viavante.insurance_registration AS ir
LEFT JOIN viavante.insurance_reg_set irs ON irs.parent = ir.id
LEFT JOIN viavante.insurance_reg_set_coverage irsc ON irsc.parent = irs.id
LEFT JOIN viavante.insurance_reg_set_cov_trailer irsct ON irsct.parent = irsc.id

LEFT JOIN viavante.insurance_vehicle iv ON iv.id = irsc.id_vehicle
LEFT JOIN viavante.insurance_trailer it ON it.id = irsct.id_trailer
LEFT JOIN viavante.insurance_trailer itt ON itt.id = irsc.id_trailer

LEFT JOIN viavante.insurance_status ins ON ins.id = irs.id_status 
LEFT JOIN viavante.insurance_status insc ON insc.id = irsc.id_status

LEFT JOIN viavante.representante r ON r.codigo=irs.id_unity
LEFT JOIN viavante.cliente cli ON cli.codigo=ir.customer_id
LEFT JOIN viavante.catalogo cata ON cata.cnpj_cpf=r.cnpj_cpf
LEFT JOIN viavante.catalogo cat ON cat.cnpj_cpf=cli.cnpj_cpf
LEFT JOIN viavante.endereco en ON en.cnpj_cpf = cat.cnpj_cpf

WHERE ins.id=7
AND insc.id=11
AND COALESCE(iv.board, it.board, itt.board) IS NOT NULL

GROUP BY 
cat.nome,
cat.pessoa,
en.fone1,
en.fone2,
en.e_mail,
ir.id,
cata.fantasia,
'Viavante'

HAVING 
COUNT(
    COALESCE(iv.board, it.board, itt.board)
    ) > 3


