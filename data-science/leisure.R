# Constructing the leisure index:

leisure13 <- data_full[c(which(colnames(data_full)=="p13a14"),
                         which(colnames(data_full)=="p13a08"),
                         which(colnames(data_full)=="p13a10"),
                         which(colnames(data_full)=="p13a11"),
                         which(colnames(data_full)=="p13a13"),
                         which(colnames(data_full)=="p13a17"),
                         which(colnames(data_full)=="p13a19"),
                         which(colnames(data_full)=="p13a09"),
                         which(colnames(data_full)=="p13a120"),
                         which(colnames(data_full)=="p13a15"),
                         which(colnames(data_full)=="p13a18a"),
                         which(colnames(data_full)=="p13a18b"),
                         which(colnames(data_full)=="p13a121"),
                         which(colnames(data_full)=="p13a122"),
                         which(colnames(data_full)=="p13a123"),
                         which(colnames(data_full)=="p13a124"),
                         which(colnames(data_full)=="p13a111"),
                         which(colnames(data_full)=="p13a131"),
                         which(colnames(data_full)=="p13a172"),
                         which(colnames(data_full)=="p13a130"),
                         which(colnames(data_full)=="p13a171")
                         )]
leisure13[leisure13<0] <- 0 # sets all the negative values in the 
# leisure13 dataset equal to 0.

Pcomp <- prcomp(leisure13, scale = TRUE) # we need to scale the variables: this has the advantage of removing the effect of specific measurements (for example, if one variable is measured in gram and another in kilogram) on the calculated principal components.  
summary(Pcomp) # we see that PC1 to PC6 account for approx. 92% of the total variation
plot(Pcomp, type= "l") #to make a "scree plot"
plot(Pcomp$x[,1], Pcomp$x[,2]) # plots a "Principal-Component Graph" where I use the first two principal components (these two PC account for the most variation) to plot it. I need to specifiy only two, because I want a 2D-graph.
# note: We use the projected points on the PCs to figure out the position of each observation in the PCA-Plot (each 'x'-value corresponds to one point on the "PC 1"- & "PC 2"-axis respectively --> these are the component-scores 'x' [= think of it like predicted outcomes "y(hat)" in a regression])

# Now, I will extract Principal Component Scores (= with this, ou can build an index out of 
# all the leisure variables, if you want) and add them to each observation:
str(Pcomp) # by using this function 'str()' [= stands for structure], we see that 
# the Pcomp object possesses different variables, such as 'sdev', 'rotation',
# 'scale', but also 'x' etc... --> in this case, I am interested in the 'x', which 
# gives the principal component scores for each observation:
Pcomp$x
leisure131 <- cbind(leisure13, Pcomp$x[,1:6]) # this command combines my dataset 
# 'leisure13' with the principal-component score of the first 6 Principal Components --> Pcomp$x[,1:6] takes the variable 'x' and select all rows & the first six columns (our first 6 PCs).
head(leisure131)

# Alternative to summary-function:
pca.var <- Pcomp$sdev^2 # this is the variance for each of the 21 Principal components. Usually, you would need the Eigenvalues to calculate the variance, but R does this for us.
pca.var.per <- round(pca.var/sum(pca.var)*100,1) # with this, I can calculate how much variance is explained by each PC.
barplot(pca.var.per, main="Scree Plot", xlab="Principal Component", 
        ylab ="Percent Variation") # another way to do a (more beautiful) scree plot
loading_scores <- Pcomp$rotation[,1] # loading-scores = proportions between each of the leisure-variables // composition of the slope [= 1 principal component]. Here, we take the loading-score of Principal component 1 [= the one that explains most of the variation]
leisure_scores <- abs(loading_scores)
leisure_score_ranked <- sort(leisure_scores, decreasing = TRUE)
top_10_leisure_act <- names(leisure_score_ranked[1:10])
top_10_leisure_act # Top 10 variables that are useful to cluster the individuals in my dataset: 
# 1) Opera; 2) Theater; 3) Museum; 4) Cinema; 5) Disco; 6) Painting / Drawing; 
# 7) Sport events; 8) Taking Pictures; 9) Walking & Hiking; 10) meeting friends;

Pcomp$rotation[top_10_leisure_act,1] # show the scores (and +/- signs)

##Plotting:
library(ggplot2)

ggplot(leisure131, aes(PC1, PC2, PC3, PC4, PC5, PC6)) +
  stat_ellipse(geom = "polygon", col = "black", alpha = 0.5) + geom_point(shape = 21, col = "black")

# Notizen für mich: 'rotation' are the principal-components // slopes and how they are composed out
# of the variables. The 'x' are the values each observation take on each of the PC-axis (= projected points // observations on the PCs).


### Now take the smaller dataset
load("sport_parents13.Rda") #see 'did'-file. I only need the 1579 observations I got from UZH.

myID <- sport_parents13[c(1)] # Filter out all the 1579 IDs

leisure13 <- data_full[c(which(colnames(data_full)=="idpers"),
                         which(colnames(data_full)=="p13a14"),
                         which(colnames(data_full)=="p13a08"),
                         which(colnames(data_full)=="p13a10"),
                         which(colnames(data_full)=="p13a11"),
                         which(colnames(data_full)=="p13a13"),
                         which(colnames(data_full)=="p13a17"),
                         which(colnames(data_full)=="p13a19"),
                         which(colnames(data_full)=="p13a09"),
                         which(colnames(data_full)=="p13a120"),
                         which(colnames(data_full)=="p13a15"),
                         which(colnames(data_full)=="p13a18a"),
                         which(colnames(data_full)=="p13a18b"),
                         which(colnames(data_full)=="p13a121"),
                         which(colnames(data_full)=="p13a122"),
                         which(colnames(data_full)=="p13a123"),
                         which(colnames(data_full)=="p13a124"),
                         which(colnames(data_full)=="p13a111"),
                         which(colnames(data_full)=="p13a131"),
                         which(colnames(data_full)=="p13a172"),
                         which(colnames(data_full)=="p13a130"),
                         which(colnames(data_full)=="p13a171")
)]
leisure13[leisure13<0] <- 0 # sets all the negative values in the 
# leisure13 dataset equal to 0.

leisure13 <- merge(myID, leisure13, by= c("idpers"), all.x = TRUE)
leisure13 <- leisure13[c(2:22)]

# PC-Analysis:
Pcomp <- prcomp(leisure13, scale = TRUE) # we need to scale the variables: this has the advantage of removing the effect of specific measurements (for example, if one variable is measured in gram and another in kilogram) on the calculated principal components.  
summary(Pcomp) # we see that PC1 to PC6 account for approx. 92% of the total variation
plot(Pcomp, type= "l") #to make a "scree plot"
plot(Pcomp$x[,1], Pcomp$x[,2]) # plots a "Principal-Component Graph" where I use the first two principal components (these two PC account for the most variation) to plot it. I need to specifiy only two, because I want a 2D-graph.
# note: We use the projected points on the PCs to figure out the position of each observation in the PCA-Plot (each 'x'-value corresponds to one point on the "PC 1"- & "PC 2"-axis respectively --> these are the component-scores 'x' [= think of it like predicted outcomes "y(hat)" in a regression])

# Now, I will extract Principal Component Scores (= with this, ou can build an index out of 
# all the leisure variables, if you want) and add them to each observation:
str(Pcomp) # by using this function 'str()' [= stands for structure], we see that 
# the Pcomp object possesses different variables, such as 'sdev', 'rotation',
# 'scale', but also 'x' etc... --> in this case, I am interested in the 'x', which 
# gives the principal component scores for each observation:
Pcomp$x
leisure131 <- cbind(leisure13, Pcomp$x[,1:6]) # this command combines my dataset 
# 'leisure13' with the principal-component score of the first 6 Principal Components --> Pcomp$x[,1:6] takes the variable 'x' and select all rows & the first six columns (our first 6 PCs).
head(leisure131)

# Alternative to summary-function:
pca.var <- Pcomp$sdev^2 # this is the variance for each of the 21 Principal components. Usually, you would need the Eigenvalues to calculate the variance, but R does this for us.
pca.var.per <- round(pca.var/sum(pca.var)*100,1) # with this, I can calculate how much variance is explained by each PC.
barplot(pca.var.per, main="Scree Plot", xlab="Principal Component", 
        ylab ="Percent Variation") # another way to do a (more beautiful) scree plot
loading_scores <- Pcomp$rotation[,1] # loading-scores = proportions between each of the leisure-variables // composition of the slope [= 1 principal component]. Here, we take the loading-score of Principal component 1 [= the one that explains most of the variation]
leisure_scores <- abs(loading_scores)
leisure_score_ranked <- sort(leisure_scores, decreasing = TRUE)
top_10_leisure_act <- names(leisure_score_ranked[1:10])
top_10_leisure_act # Top 10 variables that are useful to cluster the individuals in my dataset: 
# 1) Theater; 2) Museum; 3) Opera; 4) Walking & Hiking; 5) Do it yourself, gardening; 
# 6) Reading; 7) Instrument / Singing; 8) Painting / Drawing; 
# 9) Taking Pictures; 10) Internet: email;

Pcomp$rotation[top_10_leisure_act,1] # show the scores (and +/- signs)

##Plotting:
library(ggplot2)

ggplot(leisure131, aes(PC1, PC2, PC3, PC4, PC5, PC6)) +
  stat_ellipse(geom = "polygon", col = "black", alpha = 0.5) + geom_point(shape = 21, col = "black")
