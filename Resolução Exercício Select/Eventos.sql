USE BDEX5_EVENTOS;
# select nome_evento,data_evento from eventos group by nome_evento;
# select count(id_atividade),evento_atv from atividades group by evento_atv,
select avg(inscricao),evento from participante_evento group by evento;