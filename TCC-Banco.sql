#create database db_TCC_PetSaude;

show databases;

use db_TCC_PetSaude;

# ---------> Telefone

create table tbl_Telefone_formato(
	id int not null auto_increment primary key,
	Nome varchar(15) not null,
    unique index(id)
);

create table tbl_Telefone(
	id int not null auto_increment primary key,
	Numero varchar(15) not null,
    DDD int not null,
    
    id_telefone_formato int not null,
    constraint fk_telefone_formato_telefone
		foreign key(id_telefone_formato)
        references tbl_telefone_formato (id),
    
    unique index(id)
);

# ---------> Endereço

create table tbl_Estado(
	id int not null auto_increment primary key,
	Nome varchar(20) not null,
    Sigla varchar(2) not null,
	unique index(id)	
);

create table tbl_Cidade(
	id int not null auto_increment primary key,
    Nome varchar(100) not null,
    
    id_Estado int not null,
    constraint fk_estado_cidade
		foreign key(id_Estado)
		references tbl_Estado(id),
    
	unique index(id)	
); 

create table tbl_Bairro(
	id int not null auto_increment primary key,
    Nome varchar(100) not null,
    
    id_Cidade int not null,
    constraint fk_cidade_bairro
		foreign key(id_Cidade)
		references tbl_Cidade(id),
    
	unique index(id)	
);



create table tbl_Endereco(
	id int not null auto_increment primary key,
	CEP varchar(15) not null,
    Logradouro varchar(100) not null,
    Numero int not null,
    Complemento varchar(10),

    
    id_Bairro int not null,
    constraint fk_bairro_endereco
		foreign key(id_Bairro)
		references tbl_Bairro(id),
    
	unique index(id)	
); 

# ---------> Email

Create table tbl_Email(
	id int not null auto_increment primary key,
	Email varchar(270) not null,

	unique index(id)	
);

# ---------> Tutor

Create table tbl_Tutor(
	id int not null auto_increment primary key,
	Nome varchar(90) not null,
    CPF varchar(20) not null,
    Senha varchar(200) not null,
    RG varchar(15) not null,
    Foto text,
    
	id_Endereco int not null,
    constraint fk_endereco_Tutor
		foreign key(id_Endereco)
		references tbl_Endereco(id),

	id_Email int not null,
    constraint fk_email_tutor
		foreign key(id_Email)
		references tbl_Email(id),

	unique index(id)	
);

Create table tbl_Tutor_Telefone(
	id int not null auto_increment primary key,

	id_Tutor int not null,
    constraint fk_tutor_intermediario_telefone
		foreign key(id_Tutor)
		references tbl_Tutor(id),

	id_Telefone int not null,
    constraint fk_telefone_intermediario_tutor
		foreign key(id_Telefone)
		references tbl_Telefone(id),

	unique index(id)	
);



show tables