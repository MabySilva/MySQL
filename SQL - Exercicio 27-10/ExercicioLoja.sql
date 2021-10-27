

/*
Enunciado - parte 1

Crie um banco de dados para um serviço de uma loja de produtos de construção, 
o nome do banco deverá ter o seguinte nome db_construindo_a_nossa_vida, 
onde o sistema trabalhará com as informações dos produtos desta empresa. 

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
*/

create database db_construindo_a_nossa_vida;

use db_construindo_a_nossa_vida;

/*
Enunciado - parte 2

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.

Popule esta tabela categoria com até 5 dados.
*/

create table tb_categoria(
    id_categ bigint(3) auto_increment,
    nome_categ varchar(30) not null,
    tipo_categ varchar(255) not null,
    primary key(id_categ)
);

insert into tb_categoria(nome_categ, tipo_categ) 
	values ("Lâmpada", "Iluminação"),
	    ("Poste de Jardim", "Iluminação"),
            ("Chuveiro", "Hidráulicos"),
	    ("Torneira", "Hidráulicos"),
            ("Cozinha", "Móveis"),
            ("Escritório", "Móveis");

/*
Enunciado - parte 3

Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos 
relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos
(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela produto com até 8 dados.
*/

create table tb_produto(
    id_prod bigint(3) auto_increment,
    nome_prod varchar(255) not null,
    preco real not null,
    tempo_garantia varchar(30) not null,
    fk_categ bigint(3) not null,
    primary key(id_prod),
    foreign key(fk_categ) references tb_categoria(id_categ)
);

insert into tb_produto(nome_prod, preco, tempo_garantia, fk_categ)
	values ("Lâmpada LED Bolinha Luz Amarela 3W Lexman Bivolt", 18.99, "24 meses", 1),
	    ("Poste de Jardim 1 Preto Metal 1,76m Inspire", 414.90, "12 meses", 2),
            ("Chuveiro com Pressurizador Turbo Lorenzetti", 219.90, "12 meses", 3),
            ("Torneira De Banheiro Oliveira Automática", 84.90, "3 meses", 4),
            ("Banqueta De Alumínio Dobrável Verde ", 38.90, "3 meses", 5),
            ("Armário Aéreo Chardonnay 1 Pt Castanho E Branco", 120.99, "3 meses", 5),
            ("Mesa Para Notebook Retrátil Com Cooler", 189.89, "3 meses", 6),
            ("Gaveteiro de Chão Madeira Branca Malwe Montfácil", 389.90, "3 meses", 6);

/*
Enunciado - parte 4

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
*/

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_produto.preco as "Preço"
    from tb_produto inner join tb_categoria
    on tb_categoria.id_categ = tb_produto.fk_categ
    where tb_produto.preco > 50
    order by tb_categoria.nome_categ;
    
/*
Enunciado - parte 5

Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
*/
    
select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_produto.preco as "Preço"
    from tb_produto inner join tb_categoria
    on tb_categoria.id_categ = tb_produto.fk_categ
    where tb_produto.preco between 3 and 60
    order by tb_categoria.tipo_categ desc;
    
/*
Enunciado - parte 6

Faça um select utilizando LIKE buscando os Produtos que começam a letra C.
*/

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_produto.preco as "Preço"
    from tb_produto inner join tb_categoria
    on tb_categoria.id_categ = tb_produto.fk_categ
    where tb_produto.nome_prod like "C%"
    order by tb_produto.nome_prod;
    
/*
Enunciado - parte 7

Faça um select com Inner join entre tabela categoria e produto.
*/

select * from tb_produto inner join tb_categoria
	on tb_categoria.id_categ = tb_produto.fk_categ;

/* Comando para contar quantas linhas tem na tabela */
select count(*) from tb_produto;

/*
Enunciado - parte 8

Faça um select onde traga todos os Produtos de uma categoria específica
(exemplo todos os produtos que são da categoria hidráulica).
*/

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_produto.preco as "Preço"
    from tb_produto inner join tb_categoria
    on tb_categoria.id_categ = tb_produto.fk_categ
    where tb_categoria.tipo_categ like "%Hidráulicos%"
    order by tb_produto.nome_prod;

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_produto.preco as "Preço"
    from tb_produto inner join tb_categoria
    on tb_categoria.id_categ = tb_produto.fk_categ
    where tb_categoria.id_categ like 5
    order by tb_produto.nome_prod;