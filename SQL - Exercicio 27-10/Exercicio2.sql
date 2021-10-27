/*Atividade 2
Crie um banco de dados para um e commerce, onde o sistema trabalhará com as
informações dos produtos deste ecommerce.
Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos produtos para se trabalhar com o serviço deste ecommerce.
Popule esta tabela com até 8 dados;
Faça um select que retorne os produtos com o valor maior do que 500.
Faça um select que retorne os produtos com o valor menor do que 500.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/

create database ecommerce;

use ecommerce;

create table produtos(
id_produto bigint auto_increment,
produto varchar (255)not null,
quantidade int (255) not null,
tipo varchar (255) not null,
setor varchar(255) not null,
preço decimal (7, 2) not null,
primary key (id_produto)
);

insert into produtos(produto, quantidade, tipo, setor, preço) values ("Camiseta", 50, "Manga longa", "Masculino", 49.90);
insert into produtos(produto, quantidade, tipo, setor, preço) values ("Camiseta", 47, "Manga Curta", "Masculino", 39.90);
insert into produtos(produto, quantidade, tipo, setor, preço) values ("Camiseta", 20, "Manga longa", "Feminino", 49.90);
insert into produtos(produto, quantidade, tipo, setor, preço) values ("Camiseta", 15, "Manga Curta", "Feminino", 39.90);
insert into produtos(produto, quantidade, tipo, setor, preço) values ("Tenis", 12, "casual", "Masculino", 699.99);
insert into produtos(produto, quantidade, tipo, setor, preço) values ("Tenis", 3, "esporte", "Masculino", 599.90);
insert into produtos(produto, quantidade, tipo, setor, preço) values ("Tenis", 44, "casual", "Feminino", 509.99);
insert into produtos(produto, quantidade, tipo, setor, preço) values ("Tenis", 35, "esporte", "Feminino", 399.99);

select * from produtos where preço > 500;
select * from produtos where preço < 500;
update produtos set preço = 499.99 where id_produto = 8;