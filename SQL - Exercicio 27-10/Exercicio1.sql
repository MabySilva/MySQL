/* Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema
trabalhará com as informações dos funcionaries desta empresa.
Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.
Popule esta tabela com até 5 dados;
Faça um select que retorne os funcionaries com o salário maior do que 2000.
Faça um select que retorne os funcionaries com o salário menor do que 2000.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/

 create database db_Rh;
 use db_rh;
   create table funcionario(
		id_funcionario bigint auto_increment,
        nome varchar (100) not null,
        sobrenome varchar (100) not null,
        setor varchar (100),
        cargo varchar (100),
        salario decimal (10,2) not null,
        primary key (id_funcionario)
    );    
select * from funcionario;

insert into funcionario (nome, sobrenome, setor, cargo, salario) values ("Mábile", "Cristina", "Administração", "Surpevisora", "1000.00");
insert into funcionario (nome, sobrenome, setor, cargo, salario) values ("Amanda", "Siva", "Expedição", "Estagiaria", "1000.00");
insert into funcionario (nome, sobrenome, setor, cargo, salario) values ("Carlos", "Cristian", "Administração", "Chefe de TI", "9000.00");
insert into funcionario (nome, sobrenome, setor, cargo, salario) values ("Ricardo", "Lima", "Ti", "Desenvolvedor", "1000.00");
insert into funcionario (nome, sobrenome, setor, cargo, salario) values ("Andreia", "Carol", "Administração", "Estagiario", "1000.00");

select * from funcionario where salario > 2000;
select * from funcionario where salario < 2000;

update funcionario set salario = 10000.00 where id_funcionario;
