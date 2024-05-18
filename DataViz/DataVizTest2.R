##
## Test 2 - R Lab Data Visualization
## Thu ... - tiet ....
##
## Ho ten: ......... - MSSV: ...........
##
# #*****************************************
## Bai 1:

mycol_1 <- c("lavender", "lightblue", "mistyrose",
           "cornsilk","orange3",
           "lightcyan", " darkolivegreen 3", "yellow2","navy","red4")
mycol_2 <- c("lavender", "cornsilk")

# 1.1 
mydata_ex1 <- read.csv('D:/DH/Học kì 2/TQHDL/Data/SmartPhoneMarket2022-2023.csv', header = T)

# 1.2

pie(mydata_ex1$Proportion_2023, mydata_ex1$Companies, radius = 1, 
    init.angle = 90, cex = 0.5, col = mycol_1, border = 'darkgreen')
mtext("Ty trong thi phan smartphone cac hang trong nam 2023", side = 1)

# 1.3

mydata_1.3 <- rbind(mydata_ex1$Proportion_2022, mydata_ex1$Proportion_2023)
mybar_1.3 <- barplot(mydata_1.3, names.arg = mydata_ex1$Companies, 
                     beside = T, col = mycol_2, border = 'darkgreen',
                     ylab = "Ti trong (%)", ylim = c(0, 80),  
                     main = "Ty trong thi phan smartphone giua cac hang trong nam 2022 va 2023")
legend(mybar_1.3[1,6], 60, legend = c("2022", "2023"), 
       horiz = F, fill = mycol_2, xpd = T, bty = "n")
text(x = mybar_1.3, y = mydata_1.3, label = mydata_1.3, 
     pos = 3, cex = 0.7, col = c("red", "blue"))

# 1.4

par(mfrow = c(1, 3))

pie(mydata_ex1$Proportion_2022, mydata_ex1$Proportion_2022, col = mycol_1, 
    border = 'darkgreen', init.angle = 90, cex = 0.5, radius = 1)
mtext("2022", side = 1, line = -5)

pie(mydata_ex1$Proportion_2023, mydata_ex1$Proportion_2023, col = mycol_1, 
    border = 'darkgreen', init.angle = 90, cex = 0.5, radius = 1)
mtext("2023", side = 1, line = -5)

plot.new()
legend("right", mydata_ex1$Companies, fill = mycol_1)

mtext("Unit: %", side = 1)

##-----------------------------------------
## Bai 2:
mydata_ex2 <- read.csv('D:/DH/Học kì 2/TQHDL/Data/lamphat.csv', header = T)
# 2.1

country <- c("US", "UK", "Japan", "Germany")
inflation_high <- c(0, 0, 0, 0)

for (i in 1 : length(mydata_ex2$Year)) {
  if (mydata_ex2$US[i] >= 4.5)
    inflation_high[1] <- inflation_high[1] + 1
  if (mydata_ex2$UK[i] >= 4.5)
    inflation_high[2] <- inflation_high[2] + 1
  if (mydata_ex2$Japan[i] >= 4.5)
    inflation_high[3] <- inflation_high[3] + 1
  if (mydata_ex2$Germany[i] >= 4.5)
    inflation_high[4] <- inflation_high[4] + 1
}

ex2_count <- data.frame(country, inflation_high)

# 2.2

cat("Cac chi so ve ti le lam phat o UK:\nTrung binh: ", mean(mydata_ex2$UK), 
    "\nPhuong sai: ", var(mydata_ex2$UK), "\nTrung vi: ", median(mydata_ex2$UK),
    "\nSai so chuan: ", sqrt(var(mydata_ex2$UK)) / sqrt(length(mydata_ex2$Year)))

cat("Cac chi so ve ti le lam phat o Japan:\nTrung binh: ", mean(mydata_ex2$Japan), 
    "\nPhuong sai: ", var(mydata_ex2$Japan), "\nTrung vi: ", median(mydata_ex2$Japan),
    "\nSai so chuan: ", sqrt(var(mydata_ex2$Japan)) / sqrt(length(mydata_ex2$Year)))

# 2.3

par(mfrow = c(2, 2))

hist(mydata_ex2$US, breaks = 10, col = 'lightblue', freq = T, 
     border = 'darkgreen', xlim = c(0, 30), ylim = c(0, 10), main = "Ty le lam phat US",
     xlab = "Ty le (%)")

hist(mydata_ex2$UK, breaks = 10, col = 'lightblue', freq = T, 
     border = 'darkgreen', xlim = c(0, 30), ylim = c(0, 10), main = "Ty le lam phat UK",
     xlab = "Ty le (%)")

hist(mydata_ex2$Japan, breaks = 10, col = 'lightblue', freq = T, 
     border = 'darkgreen', xlim = c(0, 30), ylim = c(0, 10), main = "Ty le lam phat Japan",
     xlab = "Ty le (%)")

hist(mydata_ex2$Germany, breaks = 10, col = 'lightblue', freq = T, 
     border = 'darkgreen', xlim = c(0, 30), ylim = c(0, 10), main = "Ty le lam phat Germany",
     xlab = "Ty le (%)")

# 2.4

mydata_2.4 <- rbind(mydata_ex2$US[11:21], mydata_ex2$Germany[11:21])
mybar_2.4 <- barplot(mydata_2.4, names.arg = c(1970:1980), beside = T, 
                     col = mycol_2, border = 'darkgreen', ylim = c(0, 20),
                     ylab = "Ty le (%)", main = "Ty le lam phat o US va Germany tu 1970 - 1980")
text(x = mybar_2.4, y = mydata_2.4, label = mydata_2.4, col = c("red", "blue"), 
     cex = 0.6, pos = 3)
legend(mybar_2.4[1, 1], 20, legend = c("US", "Germany"), 
       horiz = F, fill = mycol_2, xpd = T, bty = "n", cex = 0.7)

# 2.5

boxplot(mydata_ex2$US, mydata_ex2$Germany, ylim = c(0, 20),
        border = 'darkgreen', col = 'cornsilk', ylab = "Ty le (%)")

##-----------------------------------------
## Bai 3:

data_tips <- read.csv('D:/DH/Học kì 2/TQHDL/Data/tips.csv', header = T)
unique(data_tips$day)

# 3.1

day <- c("Thur", "Fri", "Sat", "Sun")
bill <- c(0, 0, 0, 0)

for (i in 1 : length(data_tips$day)) {
  if (data_tips$day[i] == "Thur")
    bill[1] <- bill[1] + data_tips$total_bill
  if (data_tips$day[i] == "Fri")
    bill[2] <- bill[2] + data_tips$total_bill
  if (data_tips$day[i] == "Sat")
    bill[3] <- bill[3] + data_tips$total_bill
  if (data_tips$day[i] == "Sun")
    bill[4] <- bill[4] + data_tips$total_bill
}

bills_by_day <- data.frame(day, bill)

# 3.2
smoker <- c("Yes", "No")
bill <- c(0, 0)

for (i in 1 : length(data_tips$day)) {
  if (data_tips$smoker[i] == "Yes")
    bill[1] <- bill[1] + data_tips$total_bill
  if (data_tips$smoker[i] == "No")
    bill[2] <- bill[2] + data_tips$total_bill
}

bills_by_smokers <- data.frame(smoker, bill)

##-----------------------------------------
# #*****************************************
## Ket thuc
