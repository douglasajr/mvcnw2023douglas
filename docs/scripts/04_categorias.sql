create table categorias(
    id int not null primary key auto_increment comment 'Primary Key',
    name varchar(255) not null comment 'Name',
    status char(3) not null default 'ACT' comment 'status',
    create_at datetime comment 'Create Time'
)comment 'Categorias de los Productos';