library(tidyverse)

load(file="gene_finaldata.Rda")

gene_final2 <- gene_final %>% 
  pivot_longer(names_to = "Localisation", 
               values_to = "Localisation",
               cols = Nuclear_dots: Nuclear_envelope : Nucleolus : Nucleus : Cytosol : ER)


as.factor(gene_final$essential)

prot <- gene_final %>% subset(protein_coding ==1) %>% subset(!is.na(essential))


Prot_dotssubset <- subset(prot, Nuclear_dots ==1)
Prot_envsubset <- subset(prot, Nuclear_envelope ==1) 
Prot_nolussubset <- subset(prot, Nucleolus ==1)
Prot_nucsubset <- subset(prot, Nucleus ==1)
Prot_cysubset <- subset(prot, Cytosol ==1)
Prot_ersubset <- subset(prot, ER ==1)

#And change the data from binary (0 or 1) to a category e.g nucleolus ("nolus") 

Prot_dotssubset$localisation="dots" #nuclear dots
Prot_envsubset$localisation="n.en" #nucler envelope
Prot_nolussubset$localisation="nolus" #nucleolus
Prot_nucsubset$localisation="nuc" #nucleus
Prot_cysubset$localisation="cyt" #cytoplasm
Prot_ersubset$localisation="ER" #ER


#I re-merge the subsets, but now all localisations are in one column
library(dplyr)#for the bind_rows function


locale <- bind_rows(Prot_dotssubset,Prot_envsubset,
                    Prot_nolussubset,Prot_nucsubset,
                    Prot_cysubset,Prot_ersubset,)
