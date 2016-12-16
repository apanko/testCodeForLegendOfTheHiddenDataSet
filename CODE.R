Rename<-list.files()
for (i in 1:length(Rename)) assign(paste("",Rename[i], sep = ""), read.csv(Rename[i],header = T, stringsAsFactors = F))

i = 1
j = 1
x = 0
dataFrame = data.frame()

for (i in 1:length(Rename)){
    file <- get(Rename[i])
    
    #issue with trying to get all the desired genes from one dataset into one matrix
    #when grabbing the next genes, it will overwrite the old ones 
    #Would need some way to predetermine the number of rows and columns 
    testMatrix <- dataFrame(0, 50, 55)
    sum(file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% testGeneList.csv[j,1],])
    testMatrix <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% testGeneList.csv[,1],]
}

file[,7] %in% "RBFOX1"
