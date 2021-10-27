
/*
Enunciado - parte 1

Crie um banco de dados para um serviço de um açougue ou uma quitanda, 
o nome do banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, 
onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
*/

create database db_cidade_das_frutas;

use db_cidade_das_frutas;

/*
Enunciado - parte 2

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
relevantes do tb_categoria para se trabalhar com o serviço dessa quitanda.

Popule esta tabela categoria com até 5 dados.
*/

create table tb_categoria(
    id_categ bigint(3) auto_increment,
    nome_categ varchar(30) not null,
    tipo_categ varchar(255) not null,
    primary key(id_categ)
);

insert into tb_categoria(nome_categ, tipo_categ) 
	values ("Frutas", "Frescas"),
	    ("Legumes", "Frescas"),
            ("Verduras", "Frescas"),
            ("Raízes", "Frescas"),
            ("Frutas Secas", "Processadas");

/*
Enunciado - parte 3

Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos 
relevantes dos tb_produto para se trabalhar com o serviço desse açougue
(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela produto com até 8 dados.
*/

create table tb_produto(
    id_prod bigint(3) auto_increment,
    nome_prod varchar(255) not null,
    quantidade real not null,
    unidade varchar(10) not null,
    preco real not null,
    fk_categ bigint(3) not null,
    primary key(id_prod),
    foreign key(fk_categ) references tb_categoria(id_categ)
);

insert into tb_produto(nome_prod, quantidade, unidade, preco, fk_categ)
	values ("Laranja", 1, "kg", 10.99, 1),
	    ("Melão", 1, "kg", 8.99, 1),
	    ("Milho", 1, "kg", 7.85, 2),
            ("Berinjela", 1, "kg", 18.68, 2),
            ("Alface", 1, "maço", 3.39, 3),
            ("Rúcula", 1, "maço", 4.99, 3),
            ("Batata", 1, "kg", 8.30, 4),
            ("Inhame", 1, "kg", 4.39, 4),
            ("Tâmara", 930, "g", 83.97, 5),
            ("Damasco", 990, "g", 69.09, 5);

/*
Enunciado - parte 4

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
*/

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_produto.quantidade as "Qtdd",
    tb_produto.unidade as "Unidade/Peso",
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
    tb_produto.quantidade as "Qtdd",
    tb_produto.unidade as "Unidade/Peso",
    tb_produto.preco as "Preço"
    from tb_produto inner join tb_categoria
    on tb_categoria.id_categ = tb_produto.fk_categ
    where tb_produto.preco between 3 and 60
    order by tb_categoria.tipo_categ desc;
    
/*
Enunciado - parte 6

Faça um select utilizando LIKE buscando os Produtos que tem a letra C.
*/

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_produto.quantidade as "Qtdd",
    tb_produto.unidade as "Unidade/Peso",
    tb_produto.preco as "Preço"
    from tb_produto inner join tb_categoria
    on tb_categoria.id_categ = tb_produto.fk_categ
    where tb_produto.nome_prod like "%c%"
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
(exemplo todos os produtos que são aves ou legumes).
*/

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_produto.quantidade as "Qtdd",
    tb_produto.unidade as "Unidade/Peso",
    tb_produto.preco as "Preço"
    from tb_produto inner join tb_categoria
    on tb_categoria.id_categ = tb_produto.fk_categ
    where tb_categoria.nome_categ like "%Legumes%"
    order by tb_produto.nome_prod;

select tb_produto.nome_prod as "Nome do Produto", 
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.tipo_categ as "Tipo",
    tb_produto.quantidade as "Qtdd",
    tb_produto.unidade as "Unidade/Peso",
    tb_produto.preco as "Preço"
    from tb_produto inner join tb_categoria
    on tb_categoria.id_categ = tb_produto.fk_categ
    where tb_categoria.id_categ like 1
    order by tb_produto.nome_prod;