use Locadora

exec sp_help Cliente
exec sp_help DVD
exec sp_help Estrela
exec sp_help Filme
exec sp_help FilmeEstrela
exec sp_help Locacao

select * from Cliente

Update Cliente 
SET cep = '08411150' 
where cadastro = 5503

Update Cliente 
SET cep = '02918190' 
where cadastro = 5504

select * from Locacao

Update Locacao
SET valor = 3.25
Where Cliente_cadastro = 5502 and data_locacao = '2021-02-18'

Update Locacao
Set valor =3.10
Where Cliente_cadastro= 5501 and data_locacao ='2021-02-24'

Select * from DVD

Update DVD
Set dataFabricacao = '2019-07-14'
Where num = 10005

Select * from Estrela

Update Estrela
Set nomeReal ='Miles Alexander Teller'
where nome = 'Miles Teller'

Select * from Filme

Delete Filme
where titulo = 'Sing'

--Select * from Filme

--select id,ano,titulo from Filme
--where 

Select * from DVD

select num,
			DATEDIFF(MONTH, dataFabricacao, getdate()) as qtd_meses_desde_fabricacao
from DVD
where FilmeID = 1003

select * from Locacao
Select * from Cliente

Select DVDnum,data_locacao, data_devolucao, valor,   
		DateDiff ( day,data_locacao, data_devolucao   )as dias_alugado
from Locacao
where Cliente_cadastro = 5505


