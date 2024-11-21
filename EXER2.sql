/*1*/
SELECT EMPREGADO.Nome FROM EMPREGADO JOIN DEPARTAMENTO ON EMPREGADO.Depto = DEPARTAMENTO.Numero WHERE DEPARTAMENTO.Nome = 'Engenharia Civil';

/*
NOME
Ricardo
Jorge
Fernando
*/

/*2*/
SELECT P.Numero AS Numero_Projeto, D.Numero AS Numero_Departamento, E.Nome AS Nome_Gerente FROM PROJETO P JOIN 
DEPARTAMENTO_PROJETO DP ON P.Numero = DP.Numero_Projeto JOIN DEPARTAMENTO D ON DP.Numero_Depto = D.Numero JOIN 
EMPREGADO E ON D.RG_Gerente = E.RG WHERE P.Localizacao = 'São Paulo';

/*
NUMERO_PROJETO	NUMERO_DEPARTAMENTO	NOME_GERENTE
5	2	Ricardo
*/

/*3*/
SELECT E.Nome FROM EMPREGADO E WHERE NOT EXISTS (SELECT P.Numero FROM PROJETO P JOIN DEPARTAMENTO_PROJETO DP ON P.Numero = DP.Numero_Projeto
WHERE DP.Numero_Depto = 3 AND P.Numero NOT IN (SELECT EP.Numero_Projeto FROM EMPREGADO_PROJETO EP WHERE EP.RG_Empregado = E.RG));

/*
NOME
João Luiz
Ricardo
Jorge
Fernando
Renato
*/

/*4*/
SELECT DISTINCT P.Numero FROM PROJETO P JOIN DEPARTAMENTO_PROJETO DP ON P.Numero = DP.Numero_Projeto JOIN DEPARTAMENTO D ON DP.Numero_Depto = D.Numero LEFT JOIN EMPREGADO_PROJETO EP ON P.Numero = EP.Numero_Projeto LEFT JOIN EMPREGADO E ON (EP.RG_Empregado = E.RG OR D.RG_Gerente = E.RG) WHERE E.Nome = 'Fernando';

/*
NUMERO
5
10
*/

/*5*/
SELECT E.Nome FROM EMPREGADO E LEFT JOIN DEPENDENTES D ON E.RG = D.RG_Responsavel WHERE D.RG_Responsavel IS NULL;

/*
NOME
Jorge
Renato
*/

/*6*/
SELECT DISTINCT E.Nome FROM EMPREGADO E JOIN DEPARTAMENTO D ON E.RG = D.RG_Gerente JOIN DEPENDENTES DEP ON E.RG = DEP.RG_Responsavel;

/*
NOME
Ricardo
João Luiz
Fernando
*/

/*7*/
SELECT DISTINCT D.Numero FROM PROJETO P JOIN DEPARTAMENTO_PROJETO DP ON P.Numero = DP.Numero_Projeto JOIN DEPARTAMENTO D ON DP.Numero_Depto = D.Numero WHERE P.Localizacao = 'Rio Claro';

/*
NUMERO
2
*/

/*8*/
SELECT DISTINCT E.Nome, E.RG FROM EMPREGADO E WHERE E.RG IN (SELECT RG_Supervisor FROM EMPREGADO WHERE RG_Supervisor IS NOT NULL);

/*
NOME	RG
João Luiz	10101010
Fernando	20202020
*/

/*9*/
SELECT Nome FROM EMPREGADO WHERE Salario >= 2000.00;

/*
NOME
João Luiz
Ricardo
Jorge
Fernando
*/

/*10*/
SELECT Nome FROM EMPREGADO WHERE Nome LIKE 'J%';

/*
NOME
João Luiz
Jorge
*/

/*11*/
SELECT Nome FROM EMPREGADO WHERE Nome LIKE '%Luiz%' OR Nome LIKE '%Luis%';

/*
NOME
João Luiz
*/

/*12*/
SELECT E.Nome FROM EMPREGADO E JOIN DEPARTAMENTO D ON E.Depto = D.Numero WHERE D.Nome = 'Engenharia Civil';

/*
NOME
Ricardo
Jorge
Fernando
*/

/*13*/
SELECT DISTINCT D.Nome FROM DEPARTAMENTO D JOIN DEPARTAMENTO_PROJETO DP ON D.Numero = DP.Numero_Depto JOIN PROJETO P ON DP.Numero_Projeto = P.Numero WHERE P.Nome = 'Motor 3';

/*
NOME
Engenharia Civil
*/

/*14*/
SELECT DISTINCT E.Nome FROM EMPREGADO E JOIN EMPREGADO_PROJETO EP ON E.RG = EP.RG_Empregado JOIN PROJETO P ON EP.Numero_Projeto = P.Numero WHERE P.Nome = 'Financeiro 1';

/*
NOME
Ricardo
Fernando
*/

/*15*/
SELECT E.Nome FROM EMPREGADO E JOIN EMPREGADO S ON E.RG_Supervisor = S.RG WHERE S.Salario BETWEEN 2000 AND 2500;

/*
NOME
Jorge
Renato
*/

/*16*/
SELECT DISTINCT E.Nome FROM EMPREGADO E JOIN DEPARTAMENTO D ON E.RG = D.RG_Gerente JOIN DEPENDENTES DEP ON E.RG = DEP.RG_Responsavel;

/*
NOME
Ricardo
João Luiz
Fernando
*/

/*17*/
UPDATE EMPREGADO SET Salario = 3000.00 WHERE Depto = 2;

/*
NOME	SALARIO
Ricardo	3000
Jorge	3000
Fernando	3000
*/

/*18*/
SELECT nome, salario FROM EMPREGADO;

/*
NOME	SALARIO
João Luiz	3300
Ricardo	3300
Jorge	3300
Fernando	3300
Renato	1430
*/

/*19*/
SELECT AVG(Salario) AS Media_Salarial FROM EMPREGADO;

/*
MEDIA_SALARIAL
2926
*/

/*20*/
SELECT Nome FROM EMPREGADO WHERE Salario > (SELECT AVG(Salario) FROM EMPREGADO) ORDER BY Nome;

/*
NOME
Fernando
Jorge
João Luiz
Ricardo
*/