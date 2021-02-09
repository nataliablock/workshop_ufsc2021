### Solução da atividade 2

##Antes de tudo precisamos fazer o upload do dplyr ou do tidyverse para ter acesso às 
#funções necessárias. Também precisaremos no pacote readxl para salvar as tabelas como csv

library(tidyverse)
library(readxl)

#Certifique-se de que o R está apontando para o diretório de trabalho do workshop

#Para verificar:
getwd()

#Para alterar use setwd() para o caminho da pasta da mesma forma como fez na atividade 1. Vou direcionar
#para a pasta do meu computador no exemplo a seguir

setwd("~/Dropbox/repositories/workshop_ufsc2021")

#Caso tenha finalizado a seção do R em que trabalhou os dados no workshop será necessário fazer o upload
#do banco migração novamente, da mesma forma que havia feito na atividade 1. No meu computador o documento
#está na pasta "dados" dentro do diretório do meu diretório de trabalho, por isso preciso especificar a pasta
#apontando o caminho com "dados/" antes do nome do arquivo. Caso no seu computador o documento já esteja 
#no seu diretório de trabalho basta colocar o nome do documento entre as aspas.

#upload do banco de migração. 
migracao<-read_csv("dados/migracao_completo.csv")

### Item 1:

#Primeiro criarei um vetor com os nomes dos países que precisam ser filtrados. Optei por fazer a filtragem 
#com o vetor, mas também é possível utilizar o operador booleano | como apresentado no workshop 2.
paises<-c("ALEMANHA", "REPUBLICA POPULAR DA CHINA", "ESTADOS UNIDOS DA AMERICA",
          "FRANCA", "ITALIA", "JAPAO", "REINO UNIDO")

#Agora criarei o banco com o nome migracao_sexo. Usarei "select" para selecionar as colunas
#de interesse, filter para filtrar o estado de SC em UFRES. Ainda no filter usarei o operador booleano
# & para também filtrar os países na coluna PNASC_DESC utilizando o vetor que criei anteriormente 
#(veja exemplo no roteiro do workshop 2). Em seguida utilizo group_by para agrupar por país e sexo e count 
#para contar as linhas dos agrupamentos, usando o argumento "name" para nomear a nova 
#coluna como total_sexo.

migracao_sexo<- migracao%>%
  select(UFRES, PNASC_DESC, SEXO_DESCRICAO, ano)%>%
  filter(UFRES=="SC" & PNASC_DESC %in% paises)%>%
  group_by(PNASC_DESC, SEXO_DESCRICAO)%>%
  count(name="total_sexo")


#Ao invés de utilizar o operador booleano também é possível incluir duas linhas para o filter,
#uma para cada coluna que será filtrada como a seguir.

migracao_sexo<- migracao%>%
  select(UFRES, PNASC_DESC, SEXO_DESCRICAO, ano)%>%
  filter(UFRES=="SC")%>%
  filter(PNASC_DESC %in% paises)%>%
  group_by(PNASC_DESC, SEXO_DESCRICAO)%>%
  count(name="total_sexo")


#Salvando como .csv. Estou criando o documento dentro da pasta dados do diretório para o qual
#o R estå apontando. Veja orientações no workshop 1. 
write_csv(migracao_sexo, "dados/migracao_sexo.csv")


## Item 2

#O processo será praticamente o mesmo do Item 1, porém não será necessário selecionar a coluna SEXO_DESCRICAO
migracao_alemanha<-migracao%>%
  select(UFRES, PNASC_DESC, ano)%>%
  filter(UFRES=="SC" & PNASC_DESC=="ALEMANHA")%>%
  group_by(ano)%>%
  count(name="total")

#Também é possível usar a função filter duas vezes ao invés de utilizar o operador &
migracao_alemanha<-migracao%>%
  select(UFRES, PNASC_DESC, ano)%>%
  filter(UFRES=="SC")%>%
  filter(PNASC_DESC=="ALEMANHA")%>%
  group_by(ano)%>%
  count(name="total")

#Salvando como .csv
write_csv(migracao_alemanha, "dados/migracao_alemanha.csv")


#Item 3

#Caso tenha encerrado a seção do R em que criou os bancos, será necessário fazer o upload dele para a sua nova
#seção. Após apontar para o seu diretório de trabalho, como fizemos no começo do script, use a função
#read_csv do pacote readxl. 

library(readxl)

migracao_sexo<-read_csv("dados/migracao_sexo.csv")  

migracao_alemanha<-read_csv("dados/migracao_alemanha.csv")





