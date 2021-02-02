### Solução da atividade 1

## Items 1 e 2:

## A explicação de como realizar o download do repositório está na página "Instruções para o Workshop" do site
# na seção "Acesso aos materiais do workshop"

#Após criar a pasta para o workshop, cole os documentos que estão na pasta "dados"

## Item 3: Apontando o R para esta nova pasta criada. Colocarei aqui o resultado para o caminho da minha 
# pasta em meu computador. Encontre o caminho do seu. Você pode usar a função setwd() como eu usarei ou
# seguir as instruções apresentadas no workshop para fazer o redirecionamento pelo RStudio. Veja no 
#roteiro da aula na seção "Gerenciamento de dados"

setwd("~/Dropbox/repositories/workshop_ufsc2021")

# Para verificar se o redirecionamento aconteceu:

getwd()

# Item 4:

#meus bancos estão dentro de uma pasta chamada "dados" dentro do meu diretório de trabalho chamado
# "workshop_ufsc2021". Desta forma, devo colocar o caminho para esta pasta antes do nome do documento que
# será aberto. Caso você tenho copiado as tabelas e colado diretamente no diretório para o qual
# o R está apontado basta digitar o nome do documento

#primeiro é preciso fazer o upload dos pacotes
library(tidyverse)
library(readxl)

#upload do banco de migração. 
migracao<-read_csv("dados/migracao_completo.csv")

## upload dos bancos de exportação e importação
exportacao<-read_excel("dados/export_sc.xlsx")

importacao<-read_excel("dados/import_sc.xlsx")

## Tenha esses bancos abertos no seu ambiente do R para o próximo workshop!

