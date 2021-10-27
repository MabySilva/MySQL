CREATE TABLE `tb_postagens` (
	`id_post` bigint NOT NULL AUTO_INCREMENT,
	`titulo` varchar(255) NOT NULL,
	`texto` varchar(1000) NOT NULL,
	`data` TIMESTAMP NOT NULL,
	`fk_tema_id` bigint NOT NULL,
	`fk_usuario_id` bigint NOT NULL,
	PRIMARY KEY (`id_post`)
);

CREATE TABLE `tb_temas` (
	`id_tema` bigint NOT NULL AUTO_INCREMENT,
	`descricao` varchar(255) NOT NULL,
	PRIMARY KEY (`id_tema`)
);

CREATE TABLE `tb_usuarios` (
	`id_user` bigint NOT NULL AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`usuario` varchar(255) NOT NULL,
	`senha` varchar(255) NOT NULL,
	PRIMARY KEY (`id_user`)
);

ALTER TABLE `tb_temas` ADD CONSTRAINT `tb_temas_fk0` FOREIGN KEY (`id_tema`) REFERENCES `tb_postagens`(`fk_tema_id`);

ALTER TABLE `tb_usuarios` ADD CONSTRAINT `tb_usuarios_fk0` FOREIGN KEY (`id_user`) REFERENCES `tb_postagens`(`fk_usuario_id`);




