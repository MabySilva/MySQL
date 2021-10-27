
/*
Enunciado - parte 1

Crie um banco de dados para um serviço de um site de cursos onlines, 
o nome do banco deverá ter o seguinte nome db_cursoDaMinhaVida, 
onde o sistema trabalhará com as informações dos produtos desta empresa. 

O sistema trabalhará com 2 tabelas tb_curso e tb_categoria.
*/

create database db_cursoDaMinhaVida;

use db_cursoDaMinhaVida;

/*
Enunciado - parte 2

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos 
relevantes do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.

Popule esta tabela categoria com até 5 dados.
*/

create table tb_categoria(
    id_categ bigint(3) auto_increment,
    nome_categ varchar(30) not null,
    area_categ varchar(255) not null,
    primary key(id_categ)
);

insert into tb_categoria(nome_categ, area_categ) 
	values ("Java", "Linguagem de Programação"),
	    ("Python", "Linguagem de Programação"),
            ("AWS", "Serviços de Cloud"),
            ("Google Cloud", "Serviços de Cloud"),
            ("Angular", "Plataforma de Aplicações WEB");

/*
Enunciado - parte 3

Crie uma tabela de tb_curso e utilizando a habilidade de abstração e determine 5 atributos 
relevantes dos tb_curso para se trabalhar com o serviço de um site de cursos onlines
(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela curso com até 8 dados.
*/

create table tb_curso(
    id_curso bigint(3) auto_increment,
    nome_curso varchar(255) not null,
    qtd_horas bigint(5) not null,
    professor varchar(30) not null,
    preco real not null,
    fk_categ bigint(3) not null,
    primary key(id_curso),
    foreign key(fk_categ) references tb_categoria(id_categ)
);

insert into tb_curso(nome_curso, qtd_horas, professor, preco, fk_categ)
	values ("Java para Iniciantes", 18, "Antônio", 22.90, 1),
	    ("Java Completo: do zero ao profissional", 77, "Leonardo", 27.90, 1),
            ("Microsserviços Java com Spring Boot", 8, "Nélio", 27.90, 1),
            ("Python 3: do básico ao avançado", 112, "Luiz", 27.90, 2),
            ("Natural Language Processing with Deep Learning in Python", 12, "Lazy", 99.90, 2),
            ("AWS Solution Architect 2021", 24, "André", 22.90, 3),
            ("GCP do Zero ao Avançado", 13, "Mayko", 27.90, 4),
            ("Formação Angular 12", 11, "Márcio", 22.90, 5);

/*
Enunciado - parte 4

Faça um select que retorne os cursos com o valor maior do que 50 reais.
*/

select tb_curso.nome_curso as "Nome do Curso",
    tb_curso.qtd_horas as "Total de Horas",
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.area_categ as "Tipo",
    tb_curso.preco as "Preço"
    from tb_curso inner join tb_categoria
    on tb_categoria.id_categ = tb_curso.fk_categ
    where tb_curso.preco > 50
    order by tb_categoria.nome_categ;
    
/*
Enunciado - parte 5

Faça um select trazendo os cursos com valor entre 3 e 60 reais.
*/
    
select tb_curso.nome_curso as "Nome do Curso",
    tb_curso.qtd_horas as "Total de Horas",
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.area_categ as "Tipo",
    tb_curso.preco as "Preço"
    from tb_curso inner join tb_categoria
    on tb_categoria.id_categ = tb_curso.fk_categ
    where tb_curso.preco between 3 and 60
    order by tb_curso.qtd_horas;
    
/*
Enunciado - parte 6

Faça um select utilizando LIKE buscando os cursos com a letra J.
*/

select tb_curso.nome_curso as "Nome do Curso",
    tb_curso.qtd_horas as "Total de Horas",
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.area_categ as "Tipo",
    tb_curso.preco as "Preço"
    from tb_curso inner join tb_categoria
    on tb_categoria.id_categ = tb_curso.fk_categ
    where tb_curso.nome_curso like "%J%"
    order by tb_curso.nome_curso;
    
/*
Enunciado - parte 7

Faça um select com Inner join entre tabela categoria e curso.
*/

select * from tb_curso inner join tb_categoria
	on tb_categoria.id_categ = tb_curso.fk_categ;

/* Comando para contar quantas linhas tem na tabela */
select count(*) from tb_curso;

/*
Enunciado - parte 8

Faça um select onde traga todos os cursos de uma categoria específica 
(exemplo todos os cursos que são da categoria Java).
*/

select tb_curso.nome_curso as "Nome do Curso",
    tb_curso.qtd_horas as "Total de Horas",
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.area_categ as "Tipo",
    tb_curso.preco as "Preço"
    from tb_curso inner join tb_categoria
    on tb_categoria.id_categ = tb_curso.fk_categ
    where tb_categoria.nome_categ like "%Java%"
    order by tb_curso.nome_curso;

select tb_curso.nome_curso as "Nome do Curso",
    tb_curso.qtd_horas as "Total de Horas",
    tb_categoria.nome_categ as "Categoria",
    tb_categoria.area_categ as "Tipo",
    tb_curso.preco as "Preço"
    from tb_curso inner join tb_categoria
    on tb_categoria.id_categ = tb_curso.fk_categ
    where tb_categoria.id_categ like 5
    order by tb_curso.nome_curso;