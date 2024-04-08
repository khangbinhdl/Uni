# Bai 1
data01 <- read.csv('D:/DH/Học kì 2/TQHDL/TuyenSinh2022.csv', header = T)
data01
myCol <- c("lavender", "lightblue", "mistyrose",
           "cornsilk","orange3",
           "lightcyan", " darkolivegreen3", "yellow2","navy","red4")
KhoiNganh = data01$Khoi_Nganh
names(KhoiNganh)<-paste("Khoi nganh", KhoiNganh, ":", data01$Ty_le, sep=" ")
pie(KhoiNganh, clockwise = T, radius = 1,
    border = "black", col = myCol, init.angle = 90, cex = 0.8)

# Bai 2
data02 <- read.csv('D:/DH/Học kì 2/TQHDL/SmartPhoneMarket2022-2023.csv', header = T)
data02
par(mfrow=c(1,3))
pie(data02$Proportion_2022, data02$Proportion_2022, radius = 1, col = myCol,
    border = "darkgreen", init.angle = 90, cex = 0.8)
mtext("                      2022", adj = 0, line = -25, outer = T)
pie(data02$Proportion_2023, data02$Proportion_2023, radius = 1, col = myCol,
    border = "darkgreen", init.angle = 90, cex = 0.8)
mtext("                                                                      2023", adj = 0, line = -25, outer = T)
plot.new()
legend("right", data02$Companies, fill = myCol, xpd=TRUE, y.intersp = 2)
mtext("      Unit: %", side = 1, line=-3.5, adj =0, cex=1.5, outer=T)

# Bai 3

pie_myData<- c(5.8,27.0,0.2,21.1,12.8,33.1)
energytypes <- c( "Nuclear energy", "Coal", "Others", "Gas", "Renewable energies", "Oil")
par(mfrow=c(1,1),xpd=TRUE)
myBar <- barplot(pie_myData, names.arg = energytypes, col = myCol, border="darkgreen",
        ylab = "Tỷ trọng (%)", ylim = c(0, 40), cex.names = 0.6, 
        main = "Energy sources trong nguồn cung cấp năng lượng chính năm 2008")

text(x=myBar , y=pie_myData , label=pie_myData , pos=3, cex=0.65, col="red2")

# Bai 4
par(mfrow=c(1,1),xpd=TRUE)
smartData = rbind(data02$Proportion_2022, data02$Proportion_2023)
smartChart <- barplot(smartData, names.arg = data02$Companies, beside = T, 
              col = c("lavender","cornsilk"), ylab = "Ty trong (%)", 
              ylim = c(0, 80), border = "darkgreen", 
              main = "Ty trong smartphone cua cac hang trong 2022 va 2023")
text(x=smartChart , y=smartData , label=smartData , pos=3, cex=0.65, col=c("red2", "blue"))

# Bai 5
smoking = c(326.24, 252.20, 893.62, 458.28)
nonSmoking = c(770.09, 73.68, 884.78, 1168.88)
day = c("Thursday", "Friday", "Saturday", "Sunday")
mydata = rbind(smoking, nonSmoking)
mydata
par(mfrow=c(1,1),xpd=TRUE)
myPlot = barplot(mydata, names.arg = day, beside = T, col = c("lavender","cornsilk")
                 ,ylim = c(0, 1200), ylab = "Total bills ($)",
                 border="darkgreen")
text(x=myPlot , y=mydata , label=mydata , pos=3, cex=0.65, col=c("red2", "blue"))
legend(max(mydata)+300,c("Smoking", "Non Smoking"), fill = c("lavender","cornsilk")
       , bty = "n", xpd = T, cex = 1, text.width = 2, x.intersp = 0.5, horiz = T)
                 
