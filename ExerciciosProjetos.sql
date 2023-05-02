Create database quadroFun
go
Use quadroFun
go
create table users(
	id int not null identity(1,1),
	nome varchar(45) not null,
	username varchar(45) not null Unique,
	senha varchar(45) not null default('123mudar'),
	email varchar(45) not null
	primary key (id)
)
go
create table projects (
	id int not null identity(1001,1),
	nome varchar(45) not null,
	descricao varchar(45) not null,
	datas DATE not null CHECK(datas > '01/09/2014'),
	primary key (id)
)
go
create table users_has_projects(
	users_id INT not null,
	projects_id int not null
	Primary key (users_id, projects_id )
	Foreign key (users_id) references users(id),
	Foreign key (projects_id) references projects(id),

)
go
insert into users(nome,username,senha,email) values
('Maria', 'Rh_maria', '123mudar', 'maria@empresa.com'),
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com'),
('Ana', 'Rh_ana', '123mudar', 'ana@empresa.com'),
('Clara', 'Ti_clara', '123mudar', 'clara@empresa.com'),
('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')

insert into projects(nome,descricao,datas) values
('Re-folha', 'Refatoração de folhas', '05/09/2014'),
('Manutenção PCs', 'Manutenção  PCs', '06/09/2014'),
('Auditoria', null, '07/09/2014')

insert into users_has_projects values
(1, 10001),
(5, 10001),
(3, 10003),
(4, 10002),
(2, 10002)
go


update projects set datas='12/09/2014' where nome='Manutenção PCs' 
update users set nome = 'Rh_cido' where nome = 'Aparecido'
update users set senha='888@*' where username='Rh_maria'

delete users_has_projects where users_id = 2

select * from users
select * from users_has_projects
select * from projects

EXEC sp_help projects