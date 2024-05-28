# Example 5.1
data_pop_VN <- read.csv('D:/DH/Học kì 2/TQHDL/Data/population-structure-vietnam-2020.csv', header = T)
mycol_male <- rgb(191, 239, 255, maxColorValue = 255)
mycol_female <- rgb(250, 100, 210, 100, maxColorValue = 255)

plot_male <- barplot(-data_pop_VN$Male / 1000, axes = F, horiz = T, border = NA, col = mycol_male, 
                    xlim = c(-25 * 10^3, 25 * 10^3))
plot_female <- barplot(data_pop_VN$Female / 1000, axes = F, horiz = T, border = NA, col = mycol_female,
                       xlim = c(-25 * 10^3, 25 * 10^3), add = T)

abline(v= 0, lwd = 32, col = "white")
text(0, plot_male, data_pop_VN$Age, cex = 0.7, col = "blue3")

posi_vec <- seq(-25000, 25000, 5000)
mtext(abs(posi_vec), at = posi_vec, side = 1, line = -1, cex = 0.9)

rect (-max(data_pop_VN$Male) - 500, mean(plot_male [1:2]), max(data_pop_VN$Female) + 500, mean(plot_male[4:5]),
       xpd = T , col = rgb(225, 225, 225, 90, maxColorValue = 255) , border = NA )
mtext("working age", col = "red3", cex = 0.8, side = 2, line = 1.5, las = 3, adj = 0.38)
mtext("Men", side = 3, line = -2.5, adj = 0.25, cex = 1.2, col = "orange3")
mtext("Women", side = 3, line = -2.5, adj = 0.75, cex = 1.2, col = "orange3")
mtext("Age structure of the population in Vietnam in 2020", side = 3, 
        line = -2, font = 2, adj = 0.1, cex = 1.25, outer = T)
mtext("Values in thousands per year of age", side = 3, line = -3.4, adj = 0.075,
        cex = 1.1, font = 3, outer = T)
del_lines <- (plot_male[2] - plot_male [1])/ 2
for (k in 1: length(posi_vec)) {
  if (posi_vec[k] != 0) {
    lines(rep(posi_vec[k], 10), col = "darkgreen", lty = 3, lwd = 1.5,
            seq(plot_male[1] - del_lines + 0.15, max(plot_male) + del_lines, length = 10))
  }
}

# Excercise 5.1
data_pop_US <- read.csv('D:/DH/Học kì 2/TQHDL/Data/population-structure-US-2023.csv', header = T)
plot_male_US <- barplot(-data_pop_US$Male / 1000, axes = F, horiz = T, border = NA, col = mycol_male, 
                     xlim = c(-32.5 * 10^3, 32.5 * 10^3))
plot_female_US <- barplot(data_pop_US$Female / 1000, axes = F, horiz = T, border = NA, col = mycol_female,
                       xlim = c(-32.5 * 10^3, 32.5 * 10^3), add = T)

text(0, plot_male_US, data_pop_US$Age, cex = 0.7, col = "blue3")

posi_vec_US <- seq(-32500, 32500, 2500)
mtext(abs(posi_vec_US), at = posi_vec, side = 1, line = -1, cex = 0.9)
rect(-max(data_pop_US$Male) - 2000, mean(plot_male_US[1:2]), max(data_pop_US$Female) + 2000, mean(plot_male_US[11:12]),
      xpd = T , col = rgb(225, 225, 225, 90, maxColorValue = 255) , border = NA)

mtext("working age", col = "red3", cex = 1, side = 2, line = 1.5, las = 3, adj = 0.28)
mtext("Men", side = 3, line = -2.5, adj = 0.25, cex = 1.2, col = "orange3")
mtext("Women", side = 3, line = -2.5, adj = 0.75, cex = 1.2, col = "orange3")
mtext("Age structure of the population in US in 2023", side = 3, 
      line = -2, font = 2, adj = 0.1, cex = 1.25, outer = T)
mtext("Values in thousands per year of age", side = 3, line = -3.4, adj = 0.075,
      cex = 1.1, font = 3, outer = T)

del_lines_US <- (plot_male_US[2] - plot_male_US[1])/ 2
for (k in 1: length(posi_vec_US)) {
  if (posi_vec_US[k] != 0) {
    lines(rep(posi_vec_US[k], 10), col = "darkgreen", lty = 3, lwd = 1.5,
          seq(plot_male_US[1] - del_lines_US + 0.15, max(plot_male_US) + del_lines_US, length = 10))
  }
}

# Example 5.2
data_wiid <- read.csv("World-income-inequality-database-2020.csv", header = T)
colnames(data_wiid)
data_temp <- subset(data_wiid, select = c("country", "q1", "q2", "q3", "q4", "q5"))
country_list <- c("Belgium", "China", "Finland", "France", "Germany", "Indonesia", "Mexico", 
                  "Norway", "Sweden", "Thailand", "United Kingdom", "United States", "Vietnam")
ind_country <- (data_wiid$country %in% country_list)
data_wiid$country[ind_country]
ind_temp <- data_wiid[,1][ind_country]
data2 <- data.frame(data_temp[ind_temp, ])
data2_sorted <- data2[order(data2$q5, decreasing = F), ]
names(data2_sorted$country) <- data2_sorted$country 
row.names(data2_sorted) <- NULL
mycol <- c("lavender", "lightblue", "mistyrose", "cornsilk","orange3", 
             "lightcyan", " darkolivegreen 3", "yellow2","navy","red4")
bp1 <- barplot(height = t(as.matrix(data2_sorted[, -1])),
                 ylim = c(0, dim(data2_sorted )[1] + 3) , axes = F,
                 horiz = T, beside = F, col = mycol, border = "white", xlim = c(-5, 100))

text (-0.3, sort(bp1, decreasing = F), data2_sorted$country, xpd = T,
       adj = 1, col = "red3", cex = 0.75, font = 1)
mtext(seq(0, 100, by = 20), at = seq(0, 100, by = 20), 1, line= 0, cex = 0.9, font = 6)
del <- (bp1[length(bp1)] - bp1[length(bp1) - 1])
arrows (0, -0.35, 0, bp1[length(bp1)] + del, lwd =1.75, length = 0, xpd = T, col ="navy")
text(100 -(data2[, 6] / 2) , bp1, cex = 1,
      labels = paste(round(data2_sorted[, 6], digits = 0), "%", sep = " ") ,
      col = "white", xpd = T)
title(main = "Income Distribution over five Classes in different Countries",
        line = 1, adj = 0, cex.main = 1.5, outer = F, font.main = 6, col.main = 'navy')
mtext("Source : World Income Inequality Database 2023",
        side = 1, line = 2.5, adj = 1, cex = 0.95, font = 3, outer = F )

# Excersie 5.2
data_GDP <- read.csv("GDP-WorldBank-2022.csv", header = T)
country_list <- c("Belgium", "China", "Finland", "France", "Germany",
                    "Indonesia", "Mexico", "Norway", "Sweden", "Thailand",
                    "United Kingdom", "United States", "Vietnam")
ind_country <- (data_GDP$country %in% country_list)
data_GDP$country[ind_country]
data2 <- data.frame(data_GDP[ind_country, ])
names(data2$country) <- data2$country
row.names(data2) <- NULL
bp2 <- barplot(height= t(as.matrix(data2[ , -1][, -1])), , axes = F,
               horiz = T, beside = F, col = mycol, border = "white" , xlim = c(-5, 120))
text (-0.3, sort(bp1, decreasing = F), data2$country, xpd = T,
      adj = 1, col = "red3", cex = 0.75, font = 1)
mtext(seq(0, 120, by = 20), at = seq(0, 120, by = 20),
      1, line = 0, cex = 0.9, font = 6)
del <- (bp2[length(bp2)] - bp2[length(bp2) - 1])
arrows(0, -0.35, 0, bp1[length(bp1)] + del,
       lwd = 1.75, length = 0, xpd = T , col = "navy")

text(100 - data2[,6]/3, bp2, cex = 1, col = "black", xpd = T,
     labels = paste(round(data2_sorted[ ,6], digits = 0) , "%", sep = " "))

title(main = "Cơ cấu GDP theo 4 lĩnh vực chính: Agriculture, Manufacturing, Services, Industry 
      của một số quốc gia năm 2022",
      line = 1, adj = 0, cex.main = 1.5, outer = F,
      font.main = 6, col.main = 'navy ')
