library('corrr')
library(ggcorrplot)
library(factoextra)
library("FactoMineR")
data <- read.csv("root_var.csv")
str(protein_data)
colSums(is.na(protein_data))
numerical_data <- data[,4:20]

head(numerical_data)
data_normalized <- scale(numerical_data)
head(data_normalized)
data.pca <- princomp(data_normalized)
summary(data.pca)
data.pca$loadings[, 1:2]
fviz_eig(data.pca, addlabels = TRUE)
# Graph of the variables
fviz_pca_var(data.pca, col.var = "black")
fviz_cos2(data.pca, choice = "var", axes = 1:2)
fviz_pca_var(data.pca, col.var = "cos2",
             gradient.cols = c("black", "red", "blue"),
             repel = TRUE)
