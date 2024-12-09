CREATE DATABASE CDs;
use CDs;

create table Artista (
cod_art int not null  primary key ,
nome_art varchar(100)  not null
); 	

create table gravadora(
cod_grav int not null primary key ,
nome_grav varchar(50) not null
);

create table categoria(
cod_cat int not null primary key,
nome_cat varchar(50) not null 
);


create table estado(
sigla_est  char (2) not null primary key,
nome_est  char(50) not null 
);

describe estado;

create table cidade (
cod_cid int not null primary key,
nome_cid varchar (100) not null
);

alter table cidade 
add column  sigla_est char (2) not null,
add constraint fk_estado
foreign key (sigla_est) references estado(sigla_est);

create table cliente (
cod_cli int not null primary key,
nome_cli  Varchar(100) NOT NULL,
End_Cli   Varchar(200) NOT NULL,
renda_cli decimal (10,2) not null default 0 check (renda_cli >=0),
sexo_cli CHAR(1) NOT NULL DEFAULT 'M' CHECK (sexo_cli IN ('F', 'M'))
);

alter table cliente
add column cod_cid int not null ,
add constraint fk_cidade
foreign key (cod_cid) references cidade(cod_cid);


CREATE TABLE conjuge (
    cod_cli INT NOT NULL,
    CONSTRAINT pk_cod_cli PRIMARY KEY (cod_cli),
    CONSTRAINT fk_cod_cli FOREIGN KEY (cod_cli) REFERENCES cliente(cod_cli),
    nome_conj VARCHAR(100) NOT NULL,
    renda_conj DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK (renda_conj >= 0),
    sexo_conj CHAR(1) NOT NULL DEFAULT 'M' CHECK (sexo_conj IN ('F', 'M')) 
    
    );
    
    create table  funcionario(
    cod_func int not null primary key,
    nome_func varchar(100) not null,
    end_func varchar(200) not null,
    sal_func decimal (10,2) not null DEFAULT 0 CHECK (sal_func >= 0),
    sexo_func char (1) not null  default 'M' CHECK (sexo_func IN ('F', 'M'))
    );
    
 
    
    CREATE TABLE dependente (
    cod_dep int not null  primary key, 
    cod_func INT NOT NULL,
    CONSTRAINT fk_funcionario FOREIGN KEY (cod_func) REFERENCES funcionario(cod_func),
    nome_dep  varchar(100) not null ,
    sexo_dep char(1) not null   default 'M' CHECK (sexo_dep IN ('F', 'M'))
   
    );
    
    CREATE TABLE Titulo (
    cod_tit INT NOT NULL PRIMARY KEY,
    cod_cat INT NOT NULL,
    cod_grav INT NOT NULL,
    CONSTRAINT fk_categoria FOREIGN KEY (cod_cat) REFERENCES categoria(cod_cat),
    CONSTRAINT fk_gravadora FOREIGN KEY (cod_grav) REFERENCES gravadora(cod_grav),
    nome_cd VARCHAR(100) NOT NULL,
    val_cd DECIMAL(10,2) NOT NULL CHECK (val_cd > 0),
    qtnd_est INT NOT NULL CHECK (qtnd_est >= 0)
);

CREATE TABLE pedido (
    num_ped INT NOT NULL PRIMARY KEY,
    Cod_Cli INT NOT NULL,
    Cod_Func INT NOT NULL,
    Data_Ped DATETIME NOT NULL,
    Val_Ped DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (Val_Ped >= 0),
    CONSTRAINT fk_cliente FOREIGN KEY (Cod_Cli) REFERENCES cliente(cod_cli),
    CONSTRAINT fk_funcionario_pedido FOREIGN KEY (Cod_Func) REFERENCES funcionario(cod_func) 
);

CREATE TABLE titulo_pedido (
    num_ped INT NOT NULL,
    cod_tit INT NOT NULL,
    qtd_cd INT NOT NULL CHECK (qtd_cd >= 1),
    val_cd DECIMAL(10, 2) NOT NULL CHECK (val_cd > 0), 
    CONSTRAINT pk_titulo_pedido PRIMARY KEY (num_ped, cod_tit),
    CONSTRAINT fk_pedido FOREIGN KEY (num_ped) REFERENCES pedido(num_ped),
    CONSTRAINT fk_titulo_pedido FOREIGN KEY (cod_tit) REFERENCES Titulo(cod_tit) 
);

CREATE TABLE titulo_artista (
    cod_tit INT NOT NULL,
    cod_art INT NOT NULL,
    CONSTRAINT pk_titulo_artista PRIMARY KEY (cod_tit, cod_art), 
    CONSTRAINT fk_titulo_artista FOREIGN KEY (cod_tit) REFERENCES Titulo(cod_tit),
    CONSTRAINT fk_artista FOREIGN KEY (cod_art) REFERENCES Artista(cod_art)
);





    