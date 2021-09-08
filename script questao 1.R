setwd("C:/Users/aninh/Downloads/base_teste")
base_teste<-read.csv("base_teste.csv", header = T)
head(base_teste,3)
summary(base_teste)
min(base_teste$data_abertura_contrato) ##"2015-01-01 00:04:56"
max(base_teste$data_abertura_contrato) ##"2020-12-31 23:54:45"
##novos clientes "ultimo mes"
## Caso a média dos dias dos cliente novos, ou seja do último mês (Dezembro/20), seja menor que os demais clientes, 
## nós temos que a taxa de saída deles é maior, pois eles demoram menos tempo dentro da empresa
#### calculando a média de dias de contrato por cliente
media_dias<-tapply(base_teste$qtd_diarias, base_teste$cd_cliente, FUN = mean)
#### Diferença de datas por cliente
base_teste$data_fechamento_contrato<-as.Date(base_teste$data_fechamento_contrato)
base_teste$data_abertura_contrato<-as.Date(base_teste$data_abertura_contrato)
aggregate(difftime((max(base_teste$data_fechamento_contrato),min(base_teste$data_abertura_contrato)), units = c("days")), base_teste$cd_cliente)
#### SEPARANDO OS DADOS
base_antigos<-filter(base_teste, data_abertura_contrato < "2020-12-01 00:00:00")
base_novos<-filter(base_teste, data_abertura_contrato > "2020-11-30 23:59:59")
#### TESTE DE MÉDIAS
t.test(base_teste$qtd_diarias, base_teste$cd_cliente,
        alternativa = c ("dois lados", "menos", "maior"),
        mu = 0, emparelhado = FALSO, var.equal = FALSO,
        conf.level = 0,95)
##VERIFICARIA A MÉDIA DOS CLIENTES COMPARANDO-AS PARA VER SE HÁ DIFERENÇA SIGNIFICATIVA

###PRIMEIRO PENSAMENTO
setwd("C:/Users/aninh/Downloads/base_teste")
base_teste<-read.csv("base_teste.csv", header = T)
head(base_teste,3)
summary(base_teste)
min(base_teste$data_abertura_contrato) ##"2015-01-01 00:04:56"
max(base_teste$data_abertura_contrato) ##"2020-12-31 23:54:45"
##novos clientes "ultimo mes"
## Caso a média dos dias dos cliente novos, ou seja do último mês (Dezembro/20), seja menor que os demais clientes, 
## nós temos que a taxa de saída deles é maior, pois eles demoram menos tempo dentro da empresa
#### SEPARANDO OS DADOS
base_antigos<-filter(base_teste, data_abertura_contrato < "2020-12-01 00:00:00")
base_novos<-filter(base_teste, data_abertura_contrato > "2020-11-30 23:59:59")
#### EXPLORANDO OS DADOS
mean(base_antigos$qtd_diarias) ##média dias 2.466175
mean(base_novos$qtd_diarias) ##média dias 2.475196
mean(base_antigos$qtd_hora_extra) ##média horas extras 0.1108582
mean(base_novos$qtd_hora_extra) ##média horas extras 0.113283
#### VERIFICANDO O LTV
ltv_antigos<-mean(base_novos$qtd_diarias)*mean(base_novos$qtd_hora_extra)*mean(base_novos$cd_cliente)
ltv_antigos ## ltv é de 2859.519
ltv_novos<-mean(base_antigos$qtd_diarias)*mean(base_antigos$qtd_hora_extra)*mean(base_antigos$cd_cliente)
ltv_novos ## ltv é de 2791.127
