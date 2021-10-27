create database db_farmacia_do_bem;
use db_farmacia_do_bem;

create table tb_categoria (
	id_categoria bigint auto_increment,
    tarja varchar(35) not null,
	receita boolean,  -- true ou false
    
    primary key (id_categoria)
);
	select * from tb_categoria;
    
	insert into tb_categoria (tarja, receita) 
		values  ("Tarja Preta", True),
				("Tarja Vermelha com retenção", true),
                ("Tarja Vermelha sem retenção", true),
                ("Sem Tarja", false),
                ("Tarja Amarela (Genérico)", null);
                
	select * from tb_categoria;

create table tb_produto (
	id_produto bigint auto_increment,
    nome varchar (35) not null,
	laboratorio varchar(35) not null,
	preco real,
	estoque int (3),
    
    key_categoria bigint,
    primary key (id_produto),
    foreign key (key_categoria) references tb_categoria(id_categoria)    
);

select * from tb_produto;
insert into tb_produto (nome, laboratorio, preco, estoque, key_categoria)
	values  ("Rivotril 2mg", "Roche", 24.05, 60, 1),
			("Azitrophar 500mg", "Pharlab", 31.18, 105, 2),
			("Ritalina 10mg", "Novartis", 40.60, 35, 1),
            ("Acetilcisteína 600mg", "Eurofarma", 24.47, 90, 5),
            ("Amitripilina 25mg", "Merck", 17.99, 35, 2),
            ("Luftal 75mg/mL", "Bristol", 20.57, 60, 4),
            ("Prednisona 5mg", "Medley", 10.68 ,79, 3),
            ("Cloridrato de Bromexina 8mg/5mL", "Medley", 21.23, 52, 5);
            
   select * from tb_produto;
   
select * from tb_produto where preco > 40.00;
select * from tb_produto where preco < 35.00;
select * from tb_produto where preco between 3 and 60;
select * from tb_produto where nome like "A%";
select * from tb_produto where nome like "L%";
select * from tb_produto where nome like "R%";

select * from tb_categoria 
inner join tb_produto on tb_categoria.id_categoria = tb_produto.key_categoria 
	order by tb_produto.nome;

select * from tb_categoria 
inner join tb_produto on tb_categoria.id_categoria = tb_produto.key_categoria 
	where tb_categoria.tarja = "Tarja Preta";

select * from tb_categoria
 inner join tb_produto on tb_categoria.id_categoria = tb_produto.key_categoria 
	where tb_categoria.tarja = "Tarja Vermelha com Retenção";

select * from tb_categoria 
inner join tb_produto on tb_categoria.id_categoria = tb_produto.key_categoria 
	where tb_categoria.tarja = "Tarja Vermelha sem Retenção";
    
select * from tb_categoria 
inner join tb_produto on tb_categoria.id_categoria = tb_produto.key_categoria 
	where tb_categoria.tarja like "%Gen%";

select * from tb_categoria
 inner join tb_produto on tb_categoria.id_categoria = tb_produto.key_categoria 
	where tb_categoria.tarja like "Sem%";