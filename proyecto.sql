create database proyecto;
use proyecto;

create table finca(
Id_finca int,
Propietario varchar(20) not null,
Terreno varchar(20) not null,
Nombre varchar(20) not null,
Ubicación char(20) not null,
Superficie decimal not null,
constraint pk_finca primary key(Id_finca)
); 

create table cultivos(
Id_cultivos int,
Tipo_de_cultivo varchar(15) not null,
Fecha_de_siembra date not null,
Estado_cultivo varchar(15) not null, 
Fecha_cosecha date not null,
constraint pk_cultivos primary key(Id_cultivos)
);

create table agricultor(
Id_agricultor int,
Nombre varchar(20) not null,
constraint pk_agricultor primary key(Id_agricultor)
);

create table maquina(
Id_maquina int,
Tipo_maquina varchar(15) not null, 
Marca varchar(15) not null,
Propietario varchar(20) not null,
Tiempo_uso varchar(15) not null,
Modelo varchar(20) not null,
Num_serie char(50) not null,
Fecha_mantenimiento date,
constraint pk_maquina primary key(Id_maquina)
);

create table insumos(
Id_insumos int,
Fecha_aplicación date not null,
Cantidad char(10) not null,
constraint pk_insumos primary key(Id_insumos)
);

create table compra_insumo(
Id_comprar_insumo int,
Cantidad char(10) not null,
Fecha_compra date not null,
Tipo_insumo varchar(20) not null,
Proveedor varchar(20) not null,
constraint pk_compra_insumo primary key(Id_compra_insumo)
);

create table venta(
Id_venta int,
Finca_origen varchar(20) not null,
Agricultor_responsable varchar(20) not null,
Cliente varchar(20) not null,
Productos char(15) not null,
constraint pk_venta primary key(Id_venta),
constraint fk_venta foreign key(finca_origen) references finca(Id_finca),
constraint fk_venta foreign key(Agricultor_responsable) references agricultor(Id_agricultor)
);

create table productos(
Id_productos int,
Precio_venta decimal not null, 
Fecha_modificacion_precio date not null,
Proveedor varchar(20) not null,
constraint pk_productos primary key(Id_productos)
);

create table clima(
Id_clima int,
Temperatura char(2) not null,
Humedad char(2) not null,
Condiciones_climáticas varchar(25) not null,
Presipitacion char(2) not null,
constraint pk_clima primary key(Id_clima)
);

create table devolucion(
Id_devolución int,
Tipo varchar(20) not null,
Estado_producto varchar(15) not null,
Motivo varchar(65) not null,
constraint pk_devolucion primary key(Id_devolucion)
);