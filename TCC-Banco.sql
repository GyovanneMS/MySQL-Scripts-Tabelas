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



 # ---------> Usuário

create table tbl_Usuario(
	id int not null auto_increment primary key,
	Nome varchar(90) not null,
    CPF varchar(20) not null,
    Senha varchar(200) not null,
    RG varchar(15) not null,
    Email varchar(270) not null,
    DataNascimento date not null,
	Telefone varchar(15) not null,
    DDD int not null,

    
	id_Endereco int not null,
    constraint fk_endereco_usuario
		foreign key(id_Endereco)
		references tbl_Endereco(id),
        
	unique index(id)

);

# ---------> Tutor

Create table tbl_Tutor(
	id int not null auto_increment primary key,
    Foto_Perfil text,
    Foto_Fundo text,

	id_Usuario int not null,
    constraint fk_usuario_tutor
		foreign key(id_Usuario)
		references tbl_Usuario(id),

	unique index(id)	
);

# ---------> Veterinário

create table tbl_CRMV(
	id int not null auto_increment primary key,  	
	Numero int not null,
    
	id_Estado int not null,
    constraint  fk_estado_CRMV
		foreign key(id_Estado)
		references tbl_Estado(id),
            
    unique index(id)	
);
    
create table tbl_Intituicao(
	id int not null auto_increment primary key,  	
    Nome varchar(50),
    
    unique index(id)	
);

create table tbl_Formacao(
	id int not null auto_increment primary key,
	Ano year not null,
    
	id_Instituicao int not null,
    constraint  fk_instituicao_Formacao
		foreign key(id_Instituicao)
		references tbl_Intituicao(id),
        
        
    unique index(id)	
);

create table tbl_Veterinario(
	id int not null auto_increment primary key,  	
	Biografia text,
    Avaliacao int,
    
	id_CRMV int not null,
    constraint  fk_CRMV_veterinario
		foreign key(id_CRMV)
		references tbl_CRMV(id),
        
	id_Formacao int not null,
    constraint  fk_Formacao_veterinario
		foreign key(id_Formacao)
		references tbl_Formacao(id),
        
	id_Endereco int not null,
    constraint  fk_Endereco_veterinario
		foreign key(id_Endereco)
		references tbl_Endereco(id),
        
	id_Usuario int not null,
    constraint  fk_usuario_veterinario
		foreign key(id_Usuario)
		references tbl_Usuario(id),
    
    unique index(id)	
);

create table tbl_Foto_Veterinario(
	id int not null auto_increment primary key,  	
	url text not null,
    
	id_Veterinario int not null,
    constraint  fk_veterinario_Foto
		foreign key(id_Veterinario)
		references tbl_Veterinario(id),
        
    unique index(id)	
);

create table tbl_Especialidade(
	id int not null auto_increment primary key,  	
    Nome varchar(30),
    Significado varchar(30),
    
	unique index(id)	
);

create table tbl_Veterinario_Especialidade(
	id int not null auto_increment primary key,  	
    
	id_Veterinario int not null,
    constraint  fk_veterinario_Intermediaria_especialidade
		foreign key(id_Veterinario)
		references tbl_Veterinario(id),
        
	id_Especialidade int not null,
    constraint  fk_especialidade_Intermediario_veterinario
		foreign key(id_Especialidade)
		references tbl_Especialidade(id),
    
    unique index(id)	
);

create table tbl_Tags_Animal (
	id int not null auto_increment primary key,  
    Nome varchar(20),
    
    unique index(id)	
);

create table tbl_Veterinario_Tags_Animal(
	id int not null auto_increment primary key,  	
    
	id_Veterinario int not null,
    constraint  fk_veterinario_Intermediaria_Tags_Animal
		foreign key(id_Veterinario)
		references tbl_Veterinario(id),
        
	id_tags_animal int not null,
    constraint  fk_tags_animal_Intermediario_veterinario
		foreign key(id_tags_animal)
		references tbl_Tags_Animal(id),
    
    unique index(id)	
);

# ---------> Pets

create table tbl_Nivel_de_agrecividade(
	id int not null auto_increment primary key,  
    Nome varchar(15),
    
    unique index(id)	
);

create table tbl_Sexo(
	id int not null auto_increment primary key,  
    Nome varchar(20),
    
    unique index(id)	
);

create table tbl_Microship(
	id int not null auto_increment primary key,  
    Resposta boolean,
    
    unique index(id)	
);

create table tbl_Tamanho(
	id int not null auto_increment primary key,  
    Nome varchar(15),
    Significado varchar(35),
    
    unique index(id)	
);

create table tbl_Especie(
	id int not null auto_increment primary key,  
    Nome varchar(30),
    
    unique index(id)	
);

create table tbl_Raca(
	id int not null auto_increment primary key,  
    Nome varchar(45),
    
	id_Especie int not null,
    constraint  fk_especie_Raca
		foreign key(id_Especie)
		references tbl_Especie(id),
    
    unique index(id)	
);

create table tbl_Cor(
	id int not null auto_increment primary key,  
    Cor varchar(15),
    
    unique index(id)	
);

create table tbl_Nivel_Agressividade (
	id int not null auto_increment primary key,  
    Nivel varchar(15),
    
    unique index(id)	
);

create table tbl_Pet(
	id int not null auto_increment primary key,  
    Nome varchar(50),
    DataNascimento date,
    Foto text,
    
	id_Sexo int not null,
    constraint  fk_Sexo_Pet
		foreign key(id_Sexo)
		references tbl_Sexo(id),
        
	id_Tamanho int not null,
    constraint  fk_Tamanho_Pet
		foreign key(id_Tamanho)
		references tbl_Tamanho(id),
        
	id_Microship int not null,
    constraint  fk_Mricoship_Pet
		foreign key(id_Microship)
		references tbl_Microship(id),

	id_Raca int not null,
    constraint  fk_Raca_Pet
		foreign key(id_Raca)
		references tbl_Raca(id),
        
	id_Nivel_Agressividade int not null,
    constraint  fk_Nivel_Agressividade_Pet
		foreign key(id_Nivel_Agressividade)
		references tbl_Nivel_Agressividade(id),
        
	id_Tutor int not null,
    constraint  fk_Tutor_Pet
		foreign key(id_Tutor)
		references tbl_Tutor(id),
    
    unique index(id)	
);

create table tbl_Nivel (
	id int not null auto_increment primary key,  
    Nivel varchar(20),
    
    unique index(id)	
);

create table tbl_Pet_Cor(
	id int not null auto_increment primary key,  
    
	id_Pet int not null,
    constraint  fk_Pet_Intermediaria_Cor_and_Nivel
		foreign key(id_Pet)
		references tbl_Pet(id),
        
	id_Cor int not null,
    constraint  fk_Cor_Intermediaria_Pet_and_Nivel
		foreign key(id_Cor)
		references tbl_Cor(id),
        
        
	id_Nivel int not null,
    constraint  fk_Nivel_Intermediaria_Pet_and_Cor
		foreign key(id_Nivel)
		references tbl_Nivel(id),
    
    unique index(id)	
);

# ---------> Consulta

create table tbl_Consulta(
	id int not null auto_increment primary key,
    DataMarcada datetime,
    StausConsulta varchar(10),
    Preco float,
    
	id_Tutor int not null,
    constraint  fk_Tutor_Consulta
		foreign key(id_Tutor)
		references tbl_Tutor(id),
    
	id_Veterinario int not null,
    constraint  fk_Veterinario_Consulta
		foreign key(id_Veterinario)
		references tbl_Veterinario(id),
        
	unique index(id)
);

# ---------> Comentario

create table tbl_Comentario(
	id int not null auto_increment primary key,
    Titurlo varchar(70),
    Comentario text,
    Avaliacao int,
    DataCriacao datetime,
    
	id_Tutor int not null,
    constraint  fk_Tutor_Comentario
		foreign key(id_Tutor)
		references tbl_Tutor(id),
    
	id_Veterinario int not null,
    constraint  fk_Veterinario_Comentario
		foreign key(id_Veterinario)
		references tbl_Veterinario(id),
        
	unique index(id)
);

# ---------> Blog

create table tbl_Blog(
	id int not null auto_increment primary key,
    Titurlo varchar(70),
    texto text,
    
	id_Veterinario int not null,
    constraint  fk_Veterinario_Blog
		foreign key(id_Veterinario)
		references tbl_Veterinario(id),
        
	unique index(id)
);

create table tbl_Foto_Blog(
	id int not null auto_increment primary key,  	
	url text not null,
    
	id_Blog int not null,
    constraint  fk_blog_Foto
		foreign key(id_Blog)
		references tbl_Blog(id),
        
    unique index(id)	
);

show tables



