-- Criação da Tabela agenda
create table agenda(
   id       int         not null,
   nome     varchar(50) not null,
   dt_nasc  date        not null,
   telefone varchar(30)     null,
   email    varchar(30) not null
);

-- Popular Tabela (inserção de dados)
-- Sem atributo (não é a boa pratica)
-- Sempre o insert tem que ter o into depois, se não está errado
insert INTO agenda 
   values(1,'Vinicius', '13/12/2005', '11958366139', 'vinigaloa@gmail.com');

-- Com atributo (Boas praticas)
insert INTO agenda(id , nome, dt_nasc, telefone, email) 
   values(2,'Jose', '13/12/2005', '11958366139', 'vinigaloa@gmail.com');

insert INTO agenda(id , nome, dt_nasc, telefone, email) 
   values(3,'Pedro', '17/11/2005', '11999995', 'pedrolopes@gmail.com');

insert INTO agenda(id , nome, dt_nasc, telefone, email) 
   values(4,'Eduardo', '12/11/2007', '11988888', 'eduardorocha@gmail.com');

insert INTO agenda(id , nome, dt_nasc, telefone, email) 
   values(5,'Gustavo', '28/11/2005', '119888877', 'gustavooliveira@gmail.com');

-- Listar todos os dados
select * FROM agenda;
-- boa pratica do select -> escolher colunas que eu quero listar
select nome, dt_nasc, email
    from agenda

    
-- Classificar/ordenar
select nome, dt_nasc, email
    from agenda
    order by nome asc; --DESC ; -- ASC/DESC
    
-- Filtro basico(WHERE)
select nome, dt_nasc, email
    from agenda
where nome = 'ana';

select nome, dt_nasc, email
    from agenda 
where nome <> 'ana'; -- diferente ou !=

select nome, dt_nasc, email
    from agenda
where dt_nasc > '2005-12-10'; --maior

-- excluir tabela sem a clausula WHERE 
delete FROM agenda;


-- excluir registros com filtro - *boa pratica!
delete from agenda
   where id = 1; -- sempre o id = 1
   
select * FROM agenda
   where id = 1;

-- remove da lista os dados duplicados DISTINCT
select DISTINCT * from agenda;