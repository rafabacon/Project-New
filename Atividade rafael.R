## Aluno: Rafael Baccon - 71624368
## Faculdade: Universidade Prebisteriana Mackenzie
## Curso: Big Data
## Matéria: Mineração de Dados
## Professores: Diego Nogare e Rogerio de Oliveira
## Link GitHub: https://github.com/rafabacon/Project-New/edit/master/Atividade%20rafael.R


## Utlizei o caret por já possuir varias opções na biblioteca 

url<-"https://archive.ics.uci.edu/ml/machine-learning-databases/voting-records/house-votes-84.data"

df<-read.table(url, fileEncoding="UTF-8", sep=",")

library(caret)

set.seed(1984)

## Divide as bases
btrain <- createDataPartition(y = df$V1, p= 0.7, list = FALSE)

training <- df[btrain,]
testing <- df[-btrain,]


## Roda o modelo
svm<-train(V1~.,
              data=training,
              method="svmLinear")


## cria a matriz de confusão

p_svm<-predict(svm,testing)
pp_svm<-confusionMatrix(p_svm,testing$V1)
pp_svm