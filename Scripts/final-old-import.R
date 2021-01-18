
#######################################################################################
#                                                                                     #
#                               IMPORTING THE DATA                                    #  
#                                                                                     #
#######################################################################################

setwd("~/Biology/R/Biology/Big Data Biology/Data")

#First I load in the two data sets required for my analysis

load(url("https://www-users.york.ac.uk/~dj757/BIO00047I/data/yeast_data.28-02-2020.Rda"))
angeli <- read.delim("data-old/AnGeLiDatabase.txt",h=T)

#I then check to see if the data has been imported correctly

ls() 
class(gene)
nrow(gene)
ncol(gene)
head(gene)

class(angeli)
nrow(angeli)
ncol(angeli)
head(angeli)

#Here I insert cytosol an ER localisation data from the angeli database into the gene dataframe

#First I remove gene ontology columns
#I get a the vector of the column names
nam <- names(angeli)

#Using grep I can locate gene ontology or "GO." columns
#I invert the grep, so it does not locate these columns
not.go.columns <- grep("GO.",nam,invert=T)

#using this I create a subset of angeli without GO columns 

angeli2 <- angeli[,not.go.columns]

#I also need to remove 'FYPO', (fission yeast phenotype ontology) or PFAM groups
#so I remove them with grep also
not.fypo.or.pfam.columns <- grep("FYPO|PF",names(angeli2),invert=T)
angeli3 <- angeli2[,not.fypo.or.pfam.columns]

#I create a subset with just the information rows so I can locate the data I need
info <- angeli3[1:7,]
View(info)
#I also create a subset with only the rows with data
gene.data <- angeli3[8:7012,]

#renaming first column
names(gene.data)[1]="gene"

#I create subset of the data containing just the two columns I need
my.data.col <- which(names(gene.data) == "Cytosol")
my.data.col2 <- which(names(gene.data) == "ER")
angeli4 <- gene.data[,c(1,my.data.col, my.data.col2)]
View(angeli4)

#I combine angeli4 with the gene dataframes, and save it as an Rda file to save 
#time when reopening the script
gene_final<-merge(gene,angeli4,by="gene",all=T)
save(gene_final,file="gene_finaldata.Rda")

#Finally I check that the dataframe has been generated correctly
class(gene_final) #data.frame
nrow(gene_final)#how many rows?
#7009
ncol(gene_final)#columns?
#25
head(gene_final)#first few rows

#I can use this file for future use without having to import the whole database again
load(file="gene_finaldata.Rda")