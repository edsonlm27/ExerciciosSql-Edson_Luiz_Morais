-- DQL_Imobiliaria


-- 1. Selecione todos os dados dos corretores. 
select * from corretor;


-- 2. Selecione o nome do corretor, licença do corretor e todos os dados dos alugues negociados pelos seus respectivos corretores.
select corretor.codcorr, nome, licenca, codalu, dataalug, valorauguel
  from corretor, aluguel
 where corretor.codcorr = aluguel.codcorr
-- na resolução, incluiu uma condição:
   and dataalug > '2020-01-01';


-- 3. Busque a descricao do Imovel, valor do aluguel, e situação do imovel (se está alugado ou não) e o nome e telefone dos respectivos proprietarios.
-- (outra forma de especificar as tabelas das colunas - todas - opcional)
select imovel.descricao,
       aluguel.valorauguel,
	   imovel.alugado,
	   proprietario.nome,
	   proprietario.telefone
  from imovel, aluguel, proprietario
 where proprietario.codprop = imovel.codprop
   and imovel.codimo = aluguel.codimo;
   

-- 4. Busque os Alugueis(codAlu, dataAlu e valorAluguel), com os respectivos nomes dos inquilinos e nome do corretor.
select aluguel.codalu,
	   aluguel.dataalug,
	   aluguel.valorauguel,
	   inquilino.nome as "inquilino",
	   corretor.nome as "corretor"
  from aluguel, inquilino, corretor
 where aluguel.codinq = inquilino.codinq
   and aluguel.codcorr = corretor.codcorr;
   
   
-- 5. Selecione a quantidade de imoveis alugados pelo corretor cuja licença é 'LC587'.
select count(codalu)
  from corretor, aluguel
 where corretor.codcorr = aluguel.codcorr
   and corretor.licenca = 'LC587';
   

-- 6. Selecione os dados de todos os imóveis do Bill Gates que estão alugados.
select proprietario.nome,
	   imovel.descricao,
	   imovel.valorauguel,
	   imovel.alugado
  from proprietario, imovel
 where proprietario.codprop = imovel.codprop
   and proprietario.codprop = 2;
   

-- 7. Selecione o nome do proprietario cujo contrato de aluguel está registrado sob o codigo (codAlu) = 6.
select proprietario.nome
  from proprietario, imovel, aluguel
 where proprietario.codprop = imovel.codprop
   and imovel.codimo = aluguel.codimo
   and aluguel.codalu = 6;
   

-- 8. Quais são os proprietarios atendidos pelo corretor 'Alan Moore'?
select proprietario.nome
  from proprietario, corrprop, corretor
 where proprietario.codprop = corrprop.codprop
   and corretor.codcorr = corrprop.codcorr
   and corretor.nome = 'Alan Moore';
   
   
 -- 9. Quem sao os inquilinos que pagam um aluguel superior a R$5000,00?
 select inquilino.nome,
 		aluguel.valorauguel
   from inquilino, aluguel
  where inquilino.codinq = aluguel.codinq
    and aluguel.valorauguel > 5000;
	
