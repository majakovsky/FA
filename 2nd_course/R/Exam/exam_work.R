
getwd()

{
  #Прописываем путь к папке, где будут храниться магазины
  setwd("C:/1")
  
  #Создаем 10 папок магазинов
  for(i in c(1:10)){
    dir.create(paste("Магазин", i))
  }
  
  #Функция генерации файлов поставок и продаж
  generateSupply <- function(way = '', fileName1 = "in", fileName2 = "out", saleLevel, days = 7, min = 100, max = 140, countProducts){
    if(fileName1 == "in"){
      numProducts <- c(1:countProducts)
      products <- vector()
      for (i in numProducts){
        products <- append(products, as.character(readline("Введите продукт: ")))
      }
      for(i in c(1:10)){
        magazineIn <- switch(i, "Магазин 1", "Магазин 2", "Магазин 3", "Магазин 4", "Магазин 5", "Магазин 6", "Магазин 7", "Магазин 8", "Магазин 9", "Магазин 10")
        setwd("C:/1")
        setwd(magazineIn)
        tablIn <- data.frame('День недели' = 1:days, check.names = FALSE)
        for(j in numProducts){
          x <- sample(min:max, days)
          tablIn[products[j]] <- x
        }
        findToFile <- paste0(fileName1, ".txt")
        
        write.table(tablIn, file = findToFile, col.names = TRUE, row.names = FALSE, sep = ' ', dec = ',')
      }
    }
    if(fileName2 == "out"){
      for(i in c(1:10)){
        magazineOut <- switch(i, "Магазин 1", "Магазин 2", "Магазин 3", "Магазин 4", "Магазин 5", "Магазин 6", "Магазин 7", "Магазин 8", "Магазин 9", "Магазин 10")
        setwd("C:/1")
        setwd(magazineOut)
        fileCopy <- read.table("in.txt", header = TRUE, sep = '')
        tablOut <- data.frame("День недели" = (1:days), check.names = FALSE)
        for(j in (2:length(colnames(fileCopy)))){
          deliveries <- fileCopy[,j]
          sales <- vector()
          for(elem in deliveries){
            sales <- append(sales, round(elem * saleLevel / 100))
          }
          tablOut[colnames(fileCopy)[j]] <- sales
        }
        magazineOut <- switch(i, "Магазин 1", "Магазин 2", "Магазин 3", "Магазин 4", "Магазин 5", "Магазин 6", "Магазин 7", "Магазин 8", "Магазин 9", "Магазин 10")
        setwd("C:/1")
        setwd(magazineOut)
        findToFile <- paste(fileName2, ".txt", sep = "")
        write.table(tablOut, file = findToFile, col.names = TRUE, row.names = FALSE, sep = ' ', dec = ',')
      }
    }
  }
}
generateSupply(countProducts = 3, saleLevel = 50)

{
  {
    for (i in c(1:10)) {
      copyI <- as.character(i)
      copyDir <- "C:/1/Магазин"
      file1 <- paste(copyDir,copyI)
      
      setwd(file1)
      
      file2 <- paste(file1, "/in.txt", sep = "")
      file3 <- paste(file1, "/out.txt", sep = "")
      
      fileRenameIn <- paste("in", copyI, ".txt", sep="")
      file.rename(file2, fileRenameIn)
     
      fileRenameOut <- paste("out", copyI, ".txt", sep="")
      file.rename(file3, fileRenameOut)
      
      fileAnalysis <- "C:/1/Анализ"
      file.copy(fileRenameIn, fileAnalysis)
      file.copy(fileRenameOut, fileAnalysis)
    }
    setwd("C:/1/Анализ")
  }
}

setwd("C:/1/Анализ")
in1 <- read.table("in1.txt", header = TRUE, encoding = "utf-8")
in2 <- read.table('in2.txt', header = TRUE, encoding = "utf-8")
in3 <- read.table('in3.txt', header = TRUE, encoding = "utf-8")
in4 <- read.table('in4.txt', header = TRUE, encoding = "utf-8")
in5 <- read.table('in5.txt', header = TRUE, encoding = "utf-8")
in6 <- read.table('in6.txt', header = TRUE, encoding = "utf-8")
in7 <- read.table('in7.txt', header = TRUE, encoding = "utf-8")
in8 <- read.table('in8.txt', header = TRUE, encoding = "utf-8")
in9 <- read.table('in9.txt', header = TRUE, encoding = "utf-8")
in10 <- read.table('in10.txt', header = TRUE, encoding = "utf-8")
out1 <- read.table('out1.txt', header = TRUE, encoding = "utf-8")
out2 <- read.table('out2.txt', header = TRUE, encoding = "utf-8")
out3 <- read.table('out3.txt', header = TRUE, encoding = "utf-8")
out4 <- read.table('out4.txt', header = TRUE, encoding = "utf-8")
out5 <- read.table('out5.txt', header = TRUE, encoding = "utf-8")
out6 <- read.table('out6.txt', header = TRUE, encoding = "utf-8")
out7 <- read.table('out7.txt', header = TRUE, encoding = "utf-8")
out8 <- read.table('out8.txt', header = TRUE, encoding = "utf-8")
out9 <- read.table('out9.txt', header = TRUE, encoding = "utf-8")
out10 <- read.table('out10.txt', header = TRUE, encoding = "utf-8")

countOfProducts <- length(colnames(in1)) - 1 #записываем в переменную кол-во продуктов в каждом магазине

for(i in 1:countOfProducts){
  rev <- rep(0,12)
  profit <- rep(0, length(rev))
  resTab <- data.frame('выручка' = rev, 'прибыль' = profit)
  sale <- rep(0, nrow(res.tab))
  resTab$"реализация" <- sale
  resTab[2] <- 0
  resTab$"списание" <- 0
  resTab$"sd" <- 0
  resTab$"продажи max" <- 0
  resTab$"день max" <- 0
  resTab$"продажи min" <- 0
  resTab$"день min" <- 0
  resTab$"списание max" <- 0
  resTab$"день" <- 0
  
  for (j in (1:11)) {
    if(j <= 10){
      row.names(resTab)[i] <- paste0('Магазин', as.character(i))
    }
    if(j == 11){
      row.names(resTab)[j] <- 'Итого'
      row.names(resTab)[j+1] <- 'Среднее'
    }
  }
}

# цена за контейнер стоит 3000 у.е.
# выручка от продажи одного 7000 у.е.
resTab[1,1] <-  sum(out1[i+1]) * 7000
resTab[2,1] <-  sum(out2[i+1]) * 7000
resTab[3,1] <-  sum(out3[i+1]) * 7000
resTab[4,1] <-  sum(out4[i+1]) * 7000
resTab[5,1] <-  sum(out5[i+1]) * 7000
resTab[6,1] <-  sum(out6[i+1]) * 7000
resTab[7,1] <-  sum(out7[i+1]) * 7000
resTab[8,1] <-  sum(out8[i+1]) * 7000
resTab[9,1] <-  sum(out9[i+1]) * 7000
resTab[10,1] <-  sum(out10[i+1]) * 7000
resTab[11,1] <-  sum(resTab[1:10, 1])
resTab[12,1] <-  mean(resTab[1:10, 1])

# потери от списания 250 у.е.
# TR = Q_sale * P_sale

TR1 <- sum(out1[i+1])*7000
TR2 <- sum(out2[i+1])*7000
TR3 <- sum(out3[i+1])*7000
TR4 <- sum(out4[i+1])*7000
TR5 <- sum(out5[i+1])*7000
TR6 <- sum(out6[i+1])*7000
TR7 <- sum(out7[i+1])*7000
TR8 <- sum(out8[i+1])*7000
TR9 <- sum(out9[i+1])*7000
TR10 <- sum(out10[i+1])*7000

# TC = Q_supply * P_supply + Q_util * P_util

TC1 <- sum(in1[i+1]) * 3000 + (sum(in1[i+1]) - sum(out1[i+1]))*250
TC2 <- sum(in2[i+1]) * 3000 + (sum(in2[i+1]) - sum(out2[i+1]))*250
TC3 <- sum(in3[i+1]) * 3000 + (sum(in3[i+1]) - sum(out3[i+1]))*250
TC4 <- sum(in4[i+1]) * 3000 + (sum(in4[i+1]) - sum(out4[i+1]))*250
TC5 <- sum(in5[i+1]) * 3000 + (sum(in5[i+1]) - sum(out5[i+1]))*250
TC6 <- sum(in6[i+1]) * 3000 + (sum(in6[i+1]) - sum(out6[i+1]))*250
TC7 <- sum(in7[i+1]) * 3000 + (sum(in7[i+1]) - sum(out7[i+1]))*250
TC8 <- sum(in8[i+1]) * 3000 + (sum(in8[i+1]) - sum(out8[i+1]))*250
TC9 <- sum(in9[i+1]) * 3000 + (sum(in9[i+1]) - sum(out9[i+1]))*250
TC10 <- sum(in10[i+1]) * 3000 + (sum(in10[i+1]) - sum(out10[i+1]))*250

# PR = TR - TC

PR1 <-  TR1 - TC1
PR2 <-  TR2 - TC2
PR3 <-  TR3 - TC3
PR4 <-  TR4 - TC4
PR5 <-  TR5 - TC5
PR6 <-  TR6 - TC6
PR7 <-  TR7 - TC7
PR8 <-  TR8 - TC8
PR9 <-  TR9 - TC9
PR10 <-  TR10 - TC10

resTab[1,2] <- PR1
resTab[2,2] <- PR2
resTab[3,2] <- PR3
resTab[4,2] <- PR4
resTab[5,2] <- PR5
resTab[6,2] <- PR6
resTab[7,2] <- PR7
resTab[8,2] <- PR8
resTab[9,2] <- PR9
resTab[10,2] <- PR10
sumPR <- PR1 + PR2 + PR3 + PR4 + PR5 + PR6 + PR7 + PR8 + PR9 + PR10
resTab[11,2] <- sumPR
resTab[12,2] <- mean(PR1, PR2, PR3, PR4, PR5, PR6, PR7, PR8, PR9, PR10)

rationalization1 <- sum(in1[i+1])
rationalization2 <- sum(in2[i+1])
rationalization3 <- sum(in3[i+1])
rationalization4 <- sum(in4[i+1])
rationalization5 <- sum(in5[i+1])
rationalization6 <- sum(in6[i+1])
rationalization7 <- sum(in7[i+1])
rationalization8 <- sum(in8[i+1])
rationalization9 <- sum(in9[i+1])
rationalization10 <- sum(in10[i+1])

resTab[1,3] <- rationalization1
resTab[2,3] <- rationalization2
resTab[3,3] <- rationalization3
resTab[4,3] <- rationalization4
resTab[5,3] <- rationalization5
resTab[6,3] <- rationalization6
resTab[7,3] <- rationalization7
resTab[8,3] <- rationalization8
resTab[9,3] <- rationalization9
resTab[10,3] <- rationalization10
sumRatio <- rationalization1 + rationalization2 + rationalization3 + rationalization4 + rationalization5 + rationalization6 + rationalization7 + rationalization8 + rationalization9 + rationalization10
resTab[11,3] <- sumRatio
resTab[12,3] <- mean(rationalization1, rationalization2, rationalization3, rationalization4, rationalization5, rationalization6, rationalization7, rationalization8, rationalization9, rationalization10)

resTab[1,4] <- sum(in1[i+1]) - sum(out1[i+1])
resTab[2,4] <- sum(in2[i+1]) - sum(out2[i+1])
resTab[3,4] <- sum(in3[i+1]) - sum(out3[i+1])
resTab[4,4] <- sum(in4[i+1]) - sum(out4[i+1])
resTab[5,4] <- sum(in5[i+1]) - sum(out5[i+1])
resTab[6,4] <- sum(in6[i+1]) - sum(out6[i+1])
resTab[7,4] <- sum(in7[i+1]) - sum(out7[i+1])
resTab[8,4] <- sum(in8[i+1]) - sum(out8[i+1])
resTab[9,4] <- sum(in9[i+1]) - sum(out9[i+1])
resTab[10,4] <- sum(in10[i+1]) - sum(out10[i+1])
sumSpis <- sum(resTab[1:10,4])
meanSpis <- mean(resTab[1:10,4])
resTab[11,4] <- sumSpis
resTab[12,4] <- meanSpis

resTab[1,5] <- sd(out1[1:7,i+1])
resTab[2,5] <- sd(out2[1:7,i+1])
resTab[3,5] <- sd(out3[1:7,i+1])
resTab[4,5] <- sd(out4[1:7,i+1])
resTab[5,5] <- sd(out5[1:7,i+1])
resTab[6,5] <- sd(out6[1:7,i+1])
resTab[7,5] <- sd(out7[1:7,i+1])
resTab[8,5] <- sd(out8[1:7,i+1])
resTab[9,5] <- sd(out9[1:7,i+1])
resTab[10,5] <- sd(out10[1:7,i+1])
sumSd <- sum(resTab[1:10,5])
meanSd <- mean(resTab[1:10,5])
resTab[11,5] <- sumSd
resTab[12,5] <- meanSd

resTab[1,6] <- max(out1[i+1])
resTab[1,7] <- which.max(unlist(out1[i+1]))
resTab[2,6] <- max(out2[i+1])
resTab[2,7] <- which.max(unlist(out2[i+1]))
resTab[3,6] <- max(out3[i+1])
resTab[3,7] <- which.max(unlist(out3[i+1]))
resTab[4,6] <- max(out4[i+1])
resTab[4,7] <- which.max(unlist(out4[i+1]))
resTab[5,6] <- max(out5[i+1])
resTab[5,7] <- which.max(unlist(out5[i+1]))
resTab[6,6] <- max(out6[i+1])
resTab[6,7] <- which.max(unlist(out6[i+1]))
resTab[7,6] <- max(out7[i+1])
resTab[7,7] <- which.max(unlist(out7[i+1]))
resTab[8,6] <- max(out8[i+1])
resTab[8,7] <- which.max(unlist(out8[i+1]))
resTab[9,6] <- max(out9[i+1])
resTab[9,7] <- which.max(unlist(out9[i+1]))
resTab[10,6] <- max(out10[i+1])
resTab[10,7] <- which.max(unlist(out10[i+1]))

resTab[1,8] <- min(out1[i+1])
resTab[1,9] <- which.min(unlist(out1[i+1]))
resTab[2,8] <- min(out2[i+1])
resTab[2,9] <- which.min(unlist(out2[i+1]))
resTab[3,8] <- min(out3[i+1])
resTab[3,9] <- which.min(unlist(out3[i+1]))
resTab[4,8] <- min(out4[i+1])
resTab[4,9] <- which.min(unlist(out4[i+1]))
resTab[5,8] <- min(out5[i+1])
resTab[5,9] <- which.min(unlist(out5[i+1]))
resTab[6,8] <- min(out6[i+1])
resTab[6,9] <- which.min(unlist(out6[i+1]))
resTab[7,8] <- min(out7[i+1])
resTab[7,9] <- which.min(unlist(out7[i+1]))
resTab[8,8] <- min(out8[i+1])
resTab[8,9] <- which.min(unlist(out8[i+1]))
resTab[9,8] <- min(out9[i+1])
resTab[9,9] <- which.min(unlist(out9[i+1]))
resTab[10,8] <- min(out10[i+1])
resTab[10,9] <- which.min(unlist(out10[i+1]))

maxSpis1 <- in1[1:7,2] - out1[1:7,i+1]
resTab[1,10] <- max(maxSpis1)
resTab[1,11] <- which.max(maxSpis1)
maxSpis2 <- in2[1:7,2] - out2[1:7,i+1]
resTab[2,10] <- max(maxSpis2)
resTab[2,11] <- which.max(maxSpis2)
maxSpis3 <- in3[1:7,2] - out3[1:7,i+1]
resTab[3,10] <- max(maxSpis3)
resTab[3,11] <- which.max(maxSpis3)
maxSpis4 <- in4[1:7,2] - out4[1:7,i+1]
resTab[4,10] <- max(maxSpis4)
resTab[4,11] <- which.max(maxSpis4)
maxSpis5 <- in5[1:7,2] - out5[1:7,i+1]
resTab[5,10] <- max(maxSpis5)
resTab[5,11] <- which.max(maxSpis5)
maxSpis6 <- in6[1:7,2] - out6[1:7,i+1]
resTab[6,10] <- max(maxSpis6)
resTab[6,11] <- which.max(maxSpis6)
maxSpis7 <- in7[1:7,2] - out7[1:7,i+1]
resTab[7,10] <- max(maxSpis7)
resTab[7,11] <- which.max(maxSpis7)
maxSpis8 <- in8[1:7,2] - out8[1:7,i+1]
resTab[8,10] <- max(maxSpis8)
resTab[8,11] <- which.max(maxSpis8)
maxSpis9 <- in9[1:7,2] - out9[1:7,i+1]
resTab[9,10] <- max(maxSpis9)
resTab[9,11] <- which.max(maxSpis9)
maxSpis10 <- in10[1:7,2] - out10[1:7,i+1]
resTab[10,10] <- max(maxSpis10)
resTab[10,11] <- which.max(maxSpis10)

tabl <- c()
tabl <- c(tabl, resTab)
nameOfProducts <- names(in1)[-1]
setwd("C:/1/Анализ")
count <- length(tabl)/11
for(i in 1:count){
  write.table(tabl[1:11], file = paste0("resTab", as.character(nameOfProducts[i]), ".csv"), col.names =  TRUE, row.names = FALSE, sep = ";", dec = ",", fileEncoding = "cp1251")
  if(length(tabl) > 11){
    tabl[-12:-(length(tabl))] <- NULL
  }
}
#================КР Часть 3. Задания по графикам===================

#----------------------начало первого пункта------------------------

#объем продажи одного магазина по одному товару

v1  <- c(out1[, 2])
plot(v1,type="l",col="red",xlab = "Дни", ylab = "Объём продаж")

#выручка одного магазина по одному товару

v2 <- c(out1[, 2])
viruchka <- v2*7000
plot(viruchka,type="o",col="red", xlab = "Дни", ylab = "Выручка")

#прибыль одного магазина по одному товару

v3 <- c(out1[, 2])
i <- c(in1[, 2])
pribil <- v3*7000 - (i*3000)
plot(pribil,type="b",col="blue", xlab = "Дни", ylab = "Прибыль")

#списание одного магазина по одному товару

v4 <- c(in1[, 2]) - c(out1[, 2])
plot(v4,type="h",col="black", xlab = "Дни", ylab = "Списание")

#рентабельность одного магазина по одному товару

v5 <- (c(out1[, 2])*7000 - (c(in1[, 2])*3000)) / (c(out1[, 2])*7000) * 100
plot(v5,type="s",col="pink", xlab = "Дни", ylab = "Рентабельность")

#--------------------конец первого пукнта-----------------------------


#--------------------начало второго пункта----------------------------

#объем продаж по одному магазину по всем товарам

# прибыль по одному магазину по всем товарам
x1 <- c(out1[, 2])
y1 <- c(out1[, 3])
z1 <- c(out1[, 4])
i1 <- c(in1[, 2])
i2 <- c(in1[, 3])
i3 <- c(in1[, 4])
vir1 <- x1*7000 - (i1*3000)
vir2 <- y1*7000 - (i2*3000)
vir3 <- z1*7000 - (i3*3000)
plot(vir1,type="b",pch = 19,col="blue", xlab = "Дни", ylab = "прибыль")
lines(vir2,pch = 18, type = "b", col="green")
lines(vir3,col="black", type="b",pch = 17)
legend("topright", legend = c(names(out1[2]), names(out1[3]), names(out1[4])), col=c("blue", "green","black"), lty=1, cex=0.8, bg = "transparent")

#списание по одному магазину по всем товарам

x2 <- c(in1[, 2]) - c(out1[, 2])
y2 <- c(in1[, 3]) - c(out1[, 3])
z2 <- c(in1[, 4]) - c(out1[, 4])
plot(x2,type="b",pch = 19,col="black", xlab = "Дни", ylab = "списание")
lines(y2,pch = 18, type = "b", col="green")
lines(z2,col="red", type="b",pch = 17)
legend("topright", legend = c(names(out1[2]), names(out1[3]), names(out1[4])), col=c("black", "green","red"), lty=1, cex=0.8, bg = "transparent")

#рентабельность по одному магазину по всем товарам

x3 <- (c(out1[, 2])*7000 - (c(in1[, 2])*3000)) / (c(out1[, 2])*7000) * 100
y3 <- (c(out1[, 3])*7000 - (c(in1[, 3])*3000)) / (c(out1[, 3])*7000) * 100
z3 <- (c(out1[, 4])*7000 - (c(in1[, 4])*3000)) / (c(out1[, 4])*7000) * 100
plot(x3,type="b", pch = 19,col="red", xlab = "Дни", ylab = "Рентабельность")
lines(y3,pch = 18, type = "b", col="green")
lines(z3,col="black", type="b",pch = 17)
legend("topright", legend = c(names(out1[2]), names(out1[3]), names(out1[4])), col=c("red", "green","black"), lty=1, cex=0.8, bg = "transparent")

#--------------------конец второго пункта----------------------------

#--------------------начало третьего пункта----------------------------

rev <- rep(0,10)
tab <- data.frame('магазин' = rev, 'объем.продаж' = rev)
for(i in 1:10){
  tab[i,1] <- paste0('Магазин', as.character(i), sep = ' ')
}

tab[1,2] <- sum(out1[, 2])
tab[2,2] <- sum(out2[, 2])
tab[3,2] <- sum(out3[, 2])
tab[4,2] <- sum(out4[, 2])
tab[5,2] <- sum(out5[, 2])
tab[6,2] <- sum(out6[, 2])
tab[7,2] <- sum(out7[, 2])
tab[8,2] <- sum(out8[, 2])
tab[9,2] <- sum(out9[, 2])
tab[10,2] <- sum(out10[, 2])

labels <- c(tab[1:10, 1])
colorR <- c("black","red","yellow","blue","grey","pink","brown","purple","orange","green")
pie(tab[1:10,2], names.arg = tab$"магазин", col = colorR, radius = 1, labels)
legend("topright", legend = c(names(out1[2]), names(out1[3]), names(out1[4])), col=c("red", "blue", "green"), , lty=1, cex=0.8, bg = "transparent")


