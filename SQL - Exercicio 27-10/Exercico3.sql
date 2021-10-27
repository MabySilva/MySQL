
/*Atividade 3
Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as
informações dos estudantes deste registro dessa escola.
Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos estudantes para se trabalhar com o serviço dessa escola.
Popule esta tabela com até 8 dados;
Faça um select que retorne o/as estudantes com a nota maior do que 7.
Faça um select que retorne o/as estudantes com a nota menor do que 7.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/

create database escola;

use escola;

create table registro_alunos(
RA int not null auto_increment,
nome varchar(255) not null,
curso varchar(255) not null,
turma int not null, 
nota decimal(4, 2),
primary key (RA)
);

insert into registro_alunos(nome, curso, turma, nota) values ("Alexandre", "Bloco I", 1, 9.2);
insert into registro_alunos(nome, curso, turma, nota) values ("Alice", "Bloco III", 3, 7);
insert into registro_alunos(nome, curso, turma, nota) values ("Helena", "Bloco II", 2, 7.7);
insert into registro_alunos(nome, curso, turma, nota) values ("Davi", "Bloco II", 3, 6.75);
insert into registro_alunos(nome, curso, turma, nota) values ("Lorenzo", "Bloco II", 3, 7.1);
insert into registro_alunos(nome, curso, turma, nota) values ("Benjamin", "Bloco I", 1, 5.5);
insert into registro_alunos(nome, curso, turma, nota) values ("Maria Luiza", "Bloco I", 2, 1.0);
insert into registro_alunos(nome, curso, turma, nota) values ("Vicente", "Bloco III", 2, 10);

select * from registro_alunos where nota > 7;
select * from registro_alunos where nota < 7;

update registro_alunos set nota = 10 where RA = 2;