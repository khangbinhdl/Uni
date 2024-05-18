# Bai 1
v <- c(0.12, -3.1, -2.05, 1.52, 2.11, 4.8, 3.4)
tbm <- sum(v) / length(v)

psm <- 0
for (x in v) {
psm = psm + (x - tbm) ^ 2
}
psm = psm / (length(v) - 1)
dlc <- sqrt(psm)

tvm <- 0
v1 <- v
sort(v1)
temp <- (length(v) + 1) / 2
if (temp %% 2 == 0) {
tvm <- v[temp]
} else {
tvm <- (v1[temp - 0.5] + v1[temp + 0.5]) / 2
}

mean(v)
tbm

psm
var(v)

median(v)
tvm

# Bai 2
MeanSample <- function(v) {
return (sum(v) / length(v))
}
VarSample <- function(v) {
mean <- MeanSample(v)
res <- 0
for (x in v) {
res = res + (x - mean) ^ 2
}
return (res / (length(v) - 1))
}
QuantileSample <- function(v, q) {
sort(v)
j <- q / 100 * (length(v) + 1)
if (j %% 1 == 0) {
return (v[j])
}
a <- floor(j)
b <- ceiling(j)
return((v[a] + v[b]) / 2)
}
MeanSample(v)
VarSample(v)
quantile(v)

# Bai 3
data01 <- read.csv('D:/data01.csv', header = T)
data01
boxplot(data01$FPSA, data01$TPSA, border = 'darkgreen', col = 'cornsilk',
ylim = c(0, 115), horizontal = T, cex.axis = 1.5)

# Bai 4
year <- c(1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979)
snow.cover <- c(6.5, 12.0, 14.9, 10.0, 10.7, 7.9, 21.9, 12.5, 14.5, 9.2)
data_ex4 <- data.frame(year, snow.cover)
hist (snow.cover, breaks = 5, freq = TRUE , col = 'lightblue ',
border ='darkgreen ', xlim = c(0, 30), ylim = c(0, 8))
# Bai 5
data_ex5 <- read.csv('D:/lamphat.csv', header = T)

# cau a

inflation_high <- c()
for (i in 1 : length(data_ex5$US))
if ((data_ex5$US[i] >= 5) & (data_ex5$Japan[i] >= 5)
& (data_ex5$UK[i] >= 5) & (data_ex5$Germany[i] >= 5))
inflation_high <- c(inflation_high, data_ex5$Year[i])


# cau b
saiSoChuan <- sqrt(var(data_ex5$US)) / length(data_ex5$US)
cat("My:\nTrung binh: ", mean(data_ex5$US), "\nPhuong sai: ",
var(data_ex5$US), "\nTrung vi: ", median(data_ex5$US),
 "\nSai so chuan: ", saiSoChuan)

saiSoChuan <- sqrt(var(data_ex5$UK)) / length(data_ex5$UK)
cat("\nAnh:\nTrung binh: ", mean(data_ex5$UK), "\nPhuong sai: ",
var(data_ex5$UK), "\nTrung vi: ", median(data_ex5$UK),
 "\nSai so chuan: ", saiSoChuan)

saiSoChuan <- sqrt(var(data_ex5$Japan)) / length(data_ex5$Japan)
cat("\nNhat:\nTrung binh: ", mean(data_ex5$Japan), "\nPhuong sai: ",
var(data_ex5$Japan), "\nTrung vi: ", median(data_ex5$Japan),
 "\nSai so chuan: ", saiSoChuan)

saiSoChuan <- sqrt(var(data_ex5$Germany)) / length(data_ex5$Germany)
cat("\nDuc:\nTrung binh: ", mean(data_ex5$Germany), "\nPhuong sai: ",
var(data_ex5$Germany), "\nTrung vi: ", median(data_ex5$Germany),
 "\nSai so chuan: ", saiSoChuan)

# cau d
par(mfrow = c(2, 2))
hist (data_ex5$US, breaks = 20, freq = TRUE , col = 'lightblue ',
border ='darkgreen ', xlim = c(0, 28), ylim = c(0, 7),
xlab = "Ty le lam phat", main = "Ty le lam phat o My")

hist (data_ex5$UK, breaks = 20, freq = TRUE , col = 'lightblue ',
border ='darkgreen ', xlim = c(0, 28), ylim = c(0, 7),
xlab = "Ty le lam phat", main = "Ty le lam phat o Anh")

hist (data_ex5$Japan, breaks = 20, freq = TRUE , col = 'lightblue ',
border ='darkgreen ', xlim = c(0, 28), ylim = c(0, 7),
xlab = "Ty le lam phat", main = "Ty le lam phat o Nhat")

hist (data_ex5$Germany, breaks = 20, freq = TRUE , col = 'lightblue ',
border ='darkgreen ', xlim = c(0, 28), ylim = c(0, 7),
xlab = "Ty le lam phat", main = "Ty le lam phat o Duc")
