Create database Locadora
go
use Locadora

create table Cliente(
	cadastro int not null,
    nome varchar(70) NOT NULL,
	logradouro varchar(150) NOT NULL,
	numero integer not null check(numero > 0),
	cep char(8) null check(len(cep) = 8),

	primary key (cadastro)
)

create table Estrela (
	id int not null,
	nome varchar(50) not null
	Primary key (id)
)

create table Filme(
	id int not null,
	titulo varchar(40) not null,
	ano date not null check(ano <= '2021')
	Primary key (id)
)

create Table FilmeEstrela(
	FilmeID int not null,
	EstrelaID int not null
	Primary key (FilmeID, EstrelaID)
	foreign key (FilmeID) references Filme(id),
	foreign key (EstrelaID) references Estrela(id),
)

Create table DVD(
	num int not null,
	dataFabricacao date not null check(dataFabricacao < getDate()),
	FilmeID int not null
	foreign key (FilmeID) references Filme(id)
	primary key (num)
)

create table Locacao(
	DVDnum int not null,
	Cliente_cadastro int not null,
	data_locacao date not null default(getdate()),
	data_devolucao date not null,
	valor decimal(7,2) not null check(valor > 0)

	primary key (DVDnum,Cliente_cadastro, data_locacao)
	foreign key (DVDnum) references DVD(num),
	foreign key (Cliente_cadastro) references Cliente(cadastro)
)

alter table Estrela add nomeReal varchar(50)

alter table Filme alter column titulo varchar(80)

insert into Filme values
(1001, 'Whiplash', '2015'),
(1002, 'BirdMan', '2015'),
(1003, 'Interestelar', '2014'),
(1004, 'A culpa é das estrelas', '2014'),
(1005, 'Alexandre e o Dia Terrível, Horrível, Espantoso e Horroroso', '2014'),
(1006, 'Sing', '2016')

select * from Filme

insert into Estrela values
(9901, 'Michael Keaton', 'Michael John Douglas'),
(9902, 'Emma Stone', 'Emily Jean Stone'),
(9903, 'Miles Teller', null),
(9904, 'Steve Carell', 'Steven John Carell'),
(9905, 'Jennifer Garner', 'Jennifer Anne Garner')

select * from Estrela

insert into filmeEstrela values
(1002, 9901),
(1002, 9902),
(1001, 9903),
(1005, 9904),
(1005, 9905)

select * from FilmeEstrela

insert into DVD values
(10001, '02/12/2020', 1001),
(10002, '18/10/2019', 1002),
(10003, '03/04/2020', 1003),
(10004, '02/12/2020', 1001),
(10005, '18/10/2019', 1004),
(10006, '03/04/2020', 1002),
(10007, '02/12/2020', 1005),
(10008, '18/10/2019', 1002),
(10009, '03/04/2020', 1003)

select * from DVD

insert into Cliente values
(5501, 'Matilde Luz', 'Rua Síria', 150, '03086040'),
(5502, 'Carlos Carreiro', 'Rua Bartolomeu Aires', 1240, '04419110'),
(5503, 'Daniel Ramalho', 'Rua Itajutiba', 169, null),
(5504, 'Roberta Bento', 'Rua Jayme Von Rosenburg', 36, null),
(5505, 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')

select * from Cliente

insert into Locacao values
(10001, 5502, '18/02/2021', '21/02/2021', 3.50),
(10009, 5502, '18/02/2021', '21/02/2021', 3.50),
(10002, 5503, '18/02/2021', '21/02/2021', 3.50),
(10002, 5505, '20/02/2021', '23/02/2021', 3.00),
(10004, 5505, '20/02/2021', '23/02/2021', 3.00),
(10005, 5501, '20/02/2021', '23/02/2021', 3.00),
(10001, 5501, '24/02/2021', '26/02/2021', 3.50),
(10008, 5501, '24/02/2021', '26/02/2021', 3.00)

select * from Locacao

update Cliente set cep = '08411150' where cadastro = 5503
update Cliente set cep = '02918190' where cadastro = 5504

update Locacao set valor = 3.25 where dataLocacao = '18/02/2021'
update Locacao set valor = 3.10 where dataLocacao = '24/02/2021'

update DVD set dataFabricacao = '14/07/2019' where num = 10005

update Estrela set nomeReal = 'Miles Alexander Teller' where id = 9903

delete from Filme where titulo = 'Sing'

select * from Locacao

select (titulo) from Filme where ano = 2014
select id, ano from Filme where titulo = 'Birdman'
select id, ano from Filme where titulo like '%plash'
select * from Estrela where nome like 'Steve%'
select filmeId, CONVERT(CHAR(10), dataFabricacao, 103) as fab from DVD where dataFabricacao > '01/01/2020'
select dvdNum, data_locacao, data_devolucao, valor, valor = valor + 2.00 from Locacao
select logradouro, numero, cep from Cliente where nome = 'Matilde Luz'
select nomeReal from Estrela where nome = 'Michael Keaton'
select logradouro + ', ' + cast(numero as varchar(10)) + ', ' + cep as end_comp from Cliente where cadastro >= 5503
