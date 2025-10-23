DROP DATABASE IF EXISTS mascotasBDD;
CREATE DATABASE mascotasBDD;
USE mascotasBDD;
SET foreign_key_checks=0;


create table institucion(
    id_institucion int primary key auto_increment,
    nombre varchar(100) not null,
    direccion varchar(150),
    contacto varchar(50),
    cuenta varchar(50),
    tipo_inst varchar(50)
);

create table usuario (
    id_usuario int primary key auto_increment,
    nombre varchar(100) not null,
    email varchar(100) not null,
    password varchar(100) not null,
    direccion varchar(100) not null,
    telefono varchar(100) not null,
    donador_sponsor boolean not null,
    rol Enum("ADMIN","USUARIO") not null default "USUARIO",
    id_consulta int,
    id_institucion int,
    id_adopcion int,
    foreign key (id_institucion) references institucion(id_institucion),
    foreign key (id_consulta) references consulta(id_consulta),
    foreign key (id_adopcion) references adopcion(id_adopcion)
);

create table mascota (
    id_mascota int primary key auto_increment,
    especie varchar(50) not null,
    raza varchar(50),
    edad int,
    tamano varchar(50),
    estado_salud varchar(100),
    foto varchar(255),
    id_institucion int,
    foreign key (id_institucion) references institucion(id_institucion)
);

create table adopcion (
    id_adopcion int primary key auto_increment,
    estado enum('interes','entrevista','confirmada') not null,
    fecha_inicio date,
    fecha_finaliza date,
    id_usuario int not null,
    id_institucion int not null,
    id_mascota int not null,
    foreign key (id_usuario) references usuario(id_usuario),
    foreign key (id_institucion) references institucion(id_institucion),
    foreign key (id_mascota) references mascota(id_mascota)
);

create table consulta(
    id_consulta int primary key auto_increment,
    tipo_cons varchar(100),
    id_usuario int,
    foreign key (id_usuario) references usuario(id_usuario)
);

create table publicacion(
    id_publicacion int primary key auto_increment,
    texto varchar(200),
    imagen varchar(255),
    enlace varchar(1000),
    etiqueta_interes varchar(50),
    fecha date
);


create table comentario(
    id_comentario int primary key auto_increment,
    id_publicacion int not null,
    id_usuario int not null,
    texto varchar(200),
    fecha date,
    foreign key (id_publicacion) references publicacion(id_publicacion),
    foreign key (id_usuario) references usuario(id_usuario)
);

create table administrador(
    id_admin int primary key auto_increment,
    nombreAdmin varchar(100) not null,
    password varchar(100) not null,
    id_usuario int,
    id_institucion int,
    primary key (id_usuario, id_institucion),
    foreign key (id_usuario) references usuario(id_usuario),
    foreign key (id_institucion) references institucion(id_institucion)
);

