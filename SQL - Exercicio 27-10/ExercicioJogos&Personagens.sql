create database db_generation_game_online;
use db_generation_game_online;

create table tb_classe (
	id_classe bigint auto_increment, 
	tipo varchar (35) not null,
	vida int,
    
    primary key (id_classe)  
);
insert into tb_classe (tipo, vida) 
	values  ("Duelista", 100),    
			("Sentinela", 100),          
			("Controlador", 100),             
			("Iniciador", 100);    
select * from tb_classe;

create table tb_personagem (
	id_personagem bigint(3) auto_increment, 
    nome varchar(35) not null,                 
    arma varchar (35) not null,   
	pontoFraco varchar (35) not null, 
    poder int,
	key_classe bigint,
    primary key (id_personagem),       
    foreign key (key_classe) references tb_classe(id_classe) 
); 

insert into tb_personagem (nome, arma, pontoFraco, poder, key_classe)
	values 	("Mábile", "Revolver", "Facão", 50, 3),
			("Ricardo", "Arco","Revolver", 0, 1),
			("Andreia", "Espada", "Arco", 50, 4),
			("Heitor", "Facão", "Revolver", 25, 2),
			("Alice", "Revolver", "Facão", 50, 3),
            ("Luccas", "Facão", "Arco", 25, 1),
            ("Ana", "Revolver", "Falcãotb_classe", 0, 4);

select * from tb_personagem; 

-- personagens com maior poder decrescente/crescente
select * from tb_personagem where poder order by poder desc;
select * from tb_personagem where poder order by poder;
 
select * from tb_personagem where poder > 25;
select * from tb_personagem where poder between 10 and 30;

-- personagens que iniciam com a letra A,L,E,H
select * from tb_personagem where nome like "A%";
select * from tb_personagem where nome like "L%";
select * from tb_personagem where nome like "R%";
select * from tb_personagem where nome like "H%";


select * from tb_personagem
 inner join tb_classe on tb_classe.id_classe = tb_personagem.key_classe
	order by id_personagem;

select * from tb_personagem 
inner join tb_classe on tb_classe.id_classe = tb_personagem.key_classe 
	where tb_classe.tipo = "Duelista" 
	order by id_personagem;
    
select * from tb_personagem 
inner join tb_classe on tb_classe.id_classe = tb_personagem.key_classe 
	where tb_classe.tipo = "Sentinela" 
	order by id_personagem;

select * from tb_personagem 
inner join tb_classe on tb_classe.id_classe = tb_personagem.key_classe 
	where tb_classe.tipo = "Controlador" 
	order by id_personagem;
    
select * from tb_personagem 
inner join tb_classe on tb_classe.id_classe = tb_personagem.key_classe 
	where tb_classe.tipo = "Iniciador" 
	order by id_personagem;
