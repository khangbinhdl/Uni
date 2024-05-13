##
## Test 2 - R Lab Data Visualization
## Thu ... - tiet ....
##
## Ho ten: ......... - MSSV: ...........
##
# #*****************************************
## Bai 1:

# 1.1
mydata_ex1 <- read.csv('D:/DH/Học kì 2/TQHDL/SmartPhoneMarket2022-2023.csv')

# 1.2
myCol <- c("lavender", "lightblue", "mistyrose",
     "cornsilk","orange3",
     "lightcyan", " darkolivegreen 3", "yellow2","navy","red4")

pie(mydata_ex1$Proportion_2023, mydata_ex1$Companies, border = 'darkgreen', 
    col = myCol, init.angle = 90, radius = 1, cex = 0.5)
mtext("Ty trong smartphone cua cac hang nam 2023", side = 1)

# 1.3
mydata <- rbind(mydata_ex1$Proportion_2022, mydata_ex1$Proportion_2023)
plot1.3 <- barplot(mydata, names.arg = mydata_ex1$Companies,
        col = c("lavender","cornsilk"),
        beside = T, ylab = "Ty trong (%)", border = 'darkgreen', 
        ylim = c(0, 80))
text(x = plot1.3, y = mydata, label = mydata, pos = 3, cex = 0.65, col = "red2")
legend(plot1.3[1, 6], 60, legend = c("2022", "2023"), 
       x.intersp=0.2, xpd=TRUE , bty="n", cex=1, fill=c("lavender","cornsilk"), 
       text.width=1)

# 1.4
par(mfrow = c(1, 3))
pie(mydata_ex1$Proportion_2022, mydata_ex1$Proportion_2022, border = 'darkgreen', 
    col = myCol, init.angle = 90, radius = 1, cex = 1)
mtext("Nam 2022", side = 1, line = -7.5)
mtext("Don vi: %", side = 1, adj = 0)
pie(mydata_ex1$Proportion_2022, mydata_ex1$Proportion_2023, border = 'darkgreen', 
    col = myCol, init.angle = 90, radius = 1, cex = 1)
mtext("Nam 2023", side = 1, line = -7.5)
plot.new()
legend("right", mydata_ex1$Companies, fill = myCol)


##-----------------------------------------
## Bai 2:

data02 <- read.csv('D:/DH/Học kì 2/TQHDL/lamphat.csv', header = T)

# 2.1

country <- c("US", "UK", "Japan", "Germany")
cnt1 <- 0
cnt2 <- 0
cnt3 <- 0
cnt4 <- 0
for (i in 1:length(data02$Year)) {
  if (data02$US[i] >= 4.5)
    cnt1 <- cnt1 + 1
  if (data02$UK[i] >= 4.5)
    cnt2 <- cnt2 + 1
  if (data02$Japan[i] >= 4.5)
    cnt3 <- cnt3 + 1
  if (data02$Germany[i] >= 4.5)
    cnt4 <- cnt4 + 1
}

# 2.1
ex2_count <- data.frame(country, count = c(cnt1, cnt2, cnt3, cnt4))

# 2.2
cat("UK:\nTrung binh: ", mean(data02$UK), "\nPhuong sai: ", var(data02$UK)
     , "\nTrung vi: ", median(data02$UK), "\nSai so chuan: ", 
     sqrt(var(data02$UK)) / sqrt(length(data02$Year)))
cat("Japan:\nTrung binh: ", mean(data02$Japan), "\nPhuong sai: ", var(data02$Japan)
    , "\nTrung vi: ", median(data02$Japan), "\nSai so chuan: ", 
    sqrt(var(data02$Japan)) / sqrt(length(data02$Year)))

# 2.3
par(mfrow = c(2, 2))
hist (data02$US, breaks = 20, freq = TRUE , col = 'lightblue ',
      border ='darkgreen ', xlim = c(0, 28), ylim = c(0, 7),
      xlab = "Ty le lam phat", main = "Ty le lam phat o US")

hist (data02$UK, breaks = 20, freq = TRUE , col = 'lightblue ',
      border ='darkgreen ', xlim = c(0, 28), ylim = c(0, 7),
      xlab = "Ty le lam phat", main = "Ty le lam phat o UK")

hist (data02$Japan, breaks = 20, freq = TRUE , col = 'lightblue ',
      border ='darkgreen ', xlim = c(0, 28), ylim = c(0, 7),
      xlab = "Ty le lam phat", main = "Ty le lam phat o Japan")

hist (data02$Germany, breaks = 20, freq = TRUE , col = 'lightblue ',
      border ='darkgreen ', xlim = c(0, 28), ylim = c(0, 7),
      xlab = "Ty le lam phat", main = "Ty le lam phat o Germany")

# 2.4

mydata2.4 <- rbind(data02$US[11: 21], data02$Germany[11: 21])
plot2.4 <- barplot(mydata2.4, names.arg = c(1970:1980),
                   col = c("lavender","cornsilk"), beside = T, ylab = "Ty le (%)", 
                   border = 'darkgreen', ylim = c(0, 15), 
                   main = "Ty le lam phat giua US va Germany theo tung nam trong giai doan 1970-1980")
text(x = plot2.4, y = mydata2.4, label = mydata2.4, pos = 3, cex = 0.65, col = "red2")
legend(plot1.3[1, 1], 15, legend = c("My", "Duc"), horiz = T,
       x.intersp=0.2, xpd=TRUE , bty="n", cex=1, fill=c("lavender","cornsilk"), 
       text.width=1)

# 2.5

boxplot(data02$US, data02$Germany, border = 'darkgreen', col = 'cornsilk', 
        cex.axis = 1, ylim = c(0, 20), ylab = "Ty le (%)", 
        main = "Ty le lam phat giua US va Germany")

##-----------------------------------------
## Bai 3:

data_tips <- read.csv('D:/DH/Học kì 2/TQHDL/tips.csv', header = T)
unique(data_tips$day)

# 3.1

day <- c("Sun", "Sat", "Thur", "Fri")
bill1 <- 0
bill2 <- 0
bill3 <- 0
bill4 <- 0
for (i in 1:length(data_tips$day)) {
  if (data_tips$day[i] == "Sun")
    bill1 <- bill1 + data_tips$total_bill[i]
  if (data_tips$day[i] == "Sat")
    bill2 <- bill2 + data_tips$total_bill[i]
  if (data_tips$day[i] == "Thur")
    bill3 <- bill3 + data_tips$total_bill[i]
  if (data_tips$day[i] == "Fri")
    bill4 <- bill4 + data_tips$total_bill[i]
}
bills_by_data <- data.frame(day = day, total_bill = c(bill1, bill2, bill3, bill4))

# 3.2
smoker <- 0
noSomker <- 0

for (i in 1:length(data_tips$day)) {
  if (data_tips$smoker[i] == "Yes")
    smoker <- smoker + data_tips$total_bill[i]
  if (data_tips$smoker[i] == "No")
    noSomker <- noSomker + data_tips$total_bill[i]
}
bills_by_smokers <- data.frame(smoker = c("Smoker", "No Smoker"), total_bill = c(smoker, noSomker))

##-----------------------------------------
# #*****************************************
## Ket thuc
