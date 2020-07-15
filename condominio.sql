create database condominio;

show databases;

use condominio;

create table tblCondominio (
	idCondominio integer not null auto_increment,
    nome   varchar(100) not null,
    rua    varchar(100),
    numero integer,
    bairro varchar(100),
    cidade varchar(80),
    cep    varchar(10),
    uf     varchar(2),
    
    constraint pk_condominio primary key (idCondominio)
);

select * from tblCondominio;

create table tblCliente (
	idCliente integer not null auto_increment,
    nome 	  varchar(100) not null,
	cpf       varchar(14) not null unique,
    email     varchar(100) not null unique,
    telefone  varchar(15) not null unique,
    
    constraint pk_cliente primary key (idCliente)
);

create table tblUnidade (
	idUnidade 		integer not null auto_increment,
    numero	  		integer not null,
    complemento 	varchar(30) not null,
    valorAluguel 	float,
    valorCondominio float,
    idCondominio    integer not null,
    idCliente       integer not null,
    
    constraint pk_unidade 	primary key (idUnidade),
    constraint fk_uni_cond 	foreign key (idCondominio) 	references tblCondominio(idCondominio),
    constraint fk_uni_cli 	foreign key (idCliente)		references tblCliente(idCliente)
);


create table tblAluguel (
	numeroContrato 	integer not null auto_increment,
    idCliente		integer not null,
    idUnidade		integer not null,
    valorAluguel    float,
    inicioVigencia  date,
    finalVigencia 	date,
    
    constraint pk_aluguel primary key (numeroContrato),
    constraint fk_alu_cli foreign key (idCliente)			references tblCliente(idCliente),
    constraint fk_alu_uni foreign key (idUnidade)			references tblUnidade(idUnidade)
);

insert into tblCondominio values
	(
		(null, 'Condominio vales das Flores', 'Rua I', 200, 'Vila 1', 'Sao Paulo', '01234-567', 'SP'),
        (null, 'Sappore Del Pasta', 'Rua II', 300 , 'Vila Moreira', 'Sao Paulo', '07654-321', 'SP'),
        (null, 'Oz-Asco Biznes', 'Avenida dos Autonomistas ', 300 , 'Oz', 'Osaco', '08761-222', 'SP')
    );
    
insert into tblCondominio values (null, 'Condominio vales das Flores', 'Rua I', 200, 'Vila 1', 'Sao Paulo', '01234-567', 'SP');
insert into tblCondominio values (null, 'Sappore Del Pasta', 'Rua II', 300 , 'Vila Moreira', 'Sao Paulo', '07654-321', 'SP');
insert into tblCondominio values (null, 'Oz-Asco Biznes', 'Avenida dos Autonomistas ', 300 , 'Oz', 'Osaco', '08761-222', 'SP');


insert into tblUnidade values (null, 10, 'Bloco Celullari', 0, 500, 1, 1);

select * from tblUnidade

insert into tblUnidade values (null, 10, 'Bloco Celullari', 0, 500, 1, 1);
insert into tblUnidade values (null, 20, 'Bloco Bike', 0, 500, 1, 2);
insert into tblUnidade values (null, 110, 'Bloco Spaghetti', 800, 300, 2, 3);
insert into tblUnidade values (null, 120, 'Bloco Canelloni', 800, 350, 2, 3);
insert into tblUnidade values (null, 1001, 'Torre A', 1000, 300, 3, 3);
insert into tblUnidade values (null, 1001, 'Torre B', 1050, 300, 3, 2);

insert into tblUnidade values
(
	(null, 10, 'Bloco Celullari' , 0, 500, 1, 1),
    (null, 20, 'Bloco Bike', 0, 500, 1, 2),
    (null, 110, 'Bloco Spaghetti', 800, 300, 2, 3),
    (null, 120, 'Bloco Canelonni', 800, 300, 2, 3),
    (null, 1001, 'Torre A', 1000, 300, 3, 3),
    (null, 1001, 'Torre B', 1050, 300, 3, 2)    
);

select * from tblUnidade;
select * from tblCondominio;

select tblUnidade.idUnidade as 'codigo da unidade', tblCondominio.idCondominio, tblCliente.nome as 'dono da unidade', tblUnidade.numero, complemento, valorAluguel, valorCondominio, tblUnidade.idCondominio 
from tblUnidade 
inner join tblCondominio on tblUnidade.idCondominio = tblCondominio.idCondominio
inner join tblCliente on tblUnidade.idCliente = tblCliente.idCliente;

select * from tblUnidade

select tblUnidade.idUNidade, tblUnidade.complemento, tblCliente.nome as 'nome da bagaça'
from
tblUnidade inner join tblCliente
on
tblUnidade.idCliente = tblCliente.idCliente


select * from tblUnidade
select * from tblCondominio
select * from tblCliente

use condominio
select tblUnidade.complemento as 'compremento da Hunidade', tblCondominio.nome as 'nome do condomíniozinho', tblCliente.nome as 'poprietrário'
from
tblUnidade inner join tblCondominio on tblUnidade.idCondominio = tblCondominio.idCondominio
inner join tblCliente on tblCliente.idCliente = tblUnidade.idCliente

select * from tblUnidade inner join
	tblCliente on
    tblUnidade.idCliente = tblCliente.idCliente;
    
select * from tblCliente

select tblCliente.idCliente, numero, complemento, valorAluguel, valorCondominio, nome, email 
	from tblUnidade 
		inner join tblCliente 
			on tblUnidade.idCliente = tblCliente.idCliente;

select * from tblCliente
select * from tblAluguel
select * from tblUnidade
insert into tblAluguel values (null, 4, 2, 500, '2020-01-01', '2020-06-01')
insert into tblAluguel values (null, 5, 3, 950, '2020-01-01', '2020-12-31')
insert into tblAluguel values (null, 6, 4, 950, '2020-06-01', '2021-12-31')
insert into tblAluguel values (null, 8, 6, 1200, '2019-01-01', '2021-12-31')
            
select * from tblAluguel

select * from tblCondominio

select * from tblUnidade
select 	al.numeroContrato 	as 	'contrato #',
		un.numero			as	'numero da unidade',
        un.valorAluguel		as 	'valor original aluguel',
        al.valorAluguel		as	'valor negociado',
        cl.nome				as 	'nome do inquilino',
        pr.nome				as  'proprietario',
        date_format(al.inicioVigencia, '%d/%m/%Y') as 'inicio',
        date_format(al.finalVigencia,  '%d/%m/%Y') as 'termino'
from tblAluguel as al 
inner join tblUnidade as un on al.idUnidade = un.idUnidade
inner join tblCliente as cl on al.idCliente = cl.idCliente
inner join tblCliente as pr on pr.idCliente = un.idCliente;



