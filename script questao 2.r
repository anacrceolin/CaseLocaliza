horario_trabalho<-data.frame(funcionario=c("Funcionario A","Funcionario B"),
                             horario_entrada=c("8:00:00","9:30:00"),
                             horario_saida=c("17:00:00","19:30:00")
)
compromisso_func_A<-data.frame(compromisso=c("reuniao1","reuniao2","reuniao3","reuniao4"),
                               inicio_reuniao=c("8:30:00","11:00:00","14:00:00","16:30:00"),
                               fim_reuniao=c("10:30:00","12:00:00","15:30:00","17:00:00")
)
compromisso_func_B<-data.frame(compromisso=c("reuniao1","reuniao2","reuniao3","reuniao4","reuniao5"),
                               inicio_reuniao=c("9:30:00","11:00:00","13:00:00","16:30:00","18:00:00"),
                               fim_reuniao=c("10:30:00","11:30:00","14:00:00","17:30:00","19:00:00")
)

## Identificar horário livre nas agendas e dar match, para isso teria que cruzar as agendas "compromisso" com "horario trabalho"
## verificar quais os tempos estão livres entre as duas agendas e assim dar match entre as informações. Por exemplo: o funcionario
## A tem horario livre de 10h30 as 11h, 12h as 14h, 15h30 as 16h30 sendo que tem que retirar 1h de almoço em algum momento. 
## Pro funcionário B, os horários seriam entre 10h30 e 11h, 11h30 as 13h, 14h as 16h30 e 17h30 as 18h, e o match entre as agendas
## seriam 10h30 as 11h, 12h as 13h ou 15h30 as 18h30, algum desses horários seria a escolha certa.

## A ideia seria uma interseção entre as agendas/ horários de trabalho para assim podermos identificar o horário livre.