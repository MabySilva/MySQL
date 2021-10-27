create database db_pizzaria_legal;
use db_pizzaria_legal;


create table tb_categoria(
	id bigint auto_increment,
	tamanho enum ("P", "M", "G"),
    tipo enum ("Doce", "Salgada"),
	id_pizza bigint,
     
	primary key(id)
    );
	select * from tb_categoria;
    
    insert into tb_categoria (tamanho, tipo) 
	values  ("P", "Salgada"),
			("M", "Doce"),
            ("G", "Salgada"),
            ("P", "Doce"),
            ("M", "Salgada");
	select * from tb_categoria;
    
    create table tb_pizza(
	id_pizza bigint auto_increment,
    sabor_pizza varchar(35) not null,
    preco decimal(10,2) check (preco > 0),
    comBorda enum ("Cheddar", "Catupiry", "Cream Cheese", "Nenhum"),
    stt boolean,
    id_categoria bigint,
        
    primary key (id_pizza),
    foreign key(id_categoria) references tb_categoria(id)
);
	select * from tb_pizza;
            
	insert into tb_pizza (sabor_pizza, preco, comBorda, stt, id_categoria) 
	values  ("Marguerita", 36.99, "Nenhum", true, 1),
			("Frango com Catupiry", 47.99, "Cheddar", true, 3),
            ("Nordestina", 54.99, "Cream Cheese", false, 5),
            ("Romeu e Julietta", 39.99, "Nenhum", true, 2),
            ("Nutella com Morango", 59.99, "Nenhum", true, 4),
            ("Calabresa", 42.99, "Catupiry", true, 3),
            ("Lombo com Cheddar", 62.99, "Cream Cheese", true, 3),
            ("Portuguesa", 41.99, "Catupiry", false, 1);
            
select * from tb_pizza;

select * from tb_pizza where preco < 45.00;
select * from tb_pizza where preco between 29.00 and 60.00;
select * from tb_pizza where sabor_pizza like "C%";
select * from tb_pizza where sabor_pizza like "P%";
select * from tb_pizza where sabor_pizza like "M%";


select * from tb_pizza 
inner join tb_categoria on tb_categoria.id = tb_pizza.id_categoria
  and tb_pizza.stt = true
	order by tb_pizza.id_pizza;
    
select * from tb_pizza
 inner join tb_categoria on tb_categoria.id = tb_pizza.id_categoria 
	and tb_categoria.tipo = "Doce";
    
    
