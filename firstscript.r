args<-commandArgs(TRUE)

path <- args[1]

print('Lendo categoria e id')
category <- read.csv("/home/rodolfo/Projetos/Kaggle/San-Francisco-Crime-Classification/category.csv")
id <- read.csv("/home/rodolfo/Projetos/Kaggle/San-Francisco-Crime-Classification/id.csv")

print('Carregando predição')
predict <- read.csv(path)

colnames(predict)  <- c("Id", levels(category$Category))
predict$Id <- id$Id

print('Escrevendo na saida')
write.csv(predict, file = paste(path, ".csv", sep=""), row.names = FALSE, quote = F)