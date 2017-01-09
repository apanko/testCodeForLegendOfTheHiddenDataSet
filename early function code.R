#
testdatasets <- data.frame("Freeze3", "Pritzker960")
testplatform <- "Illumina"
testgeneList <- t(data.frame("RBFOX1", "AAA1", "AAK1"))
testDataSetModel <- DataSetModel
i = 3
j = 2
HiddenDataSet <- function(DataSetModel, geneList, platform, datasets){
    #datasets is just a list of files you want to pull
    for (j in 1:length(datasets)){
        
        #DataSetModel is the filenames split into different columns. row is a different file
        for (i in 1:length(DataSetModel[,1])){
            
            #if the file you are looking for exists within DataSetModel
            if (datasets[j] %in% DataSetModel[i, ]){
                
                #next two lines are for reading in the file
                fileName <- DataSetModel[i,1]
                file <- read.csv(fileName, header = T, stringsAsFactors = F)
                
                #will expand on this later, platform is a list of the desired platforms for the function
                if ("Illumina" %in% platform){
                    
                    # 4th column is the dataset, all of these functions do the same basic thing
                    if (fileName[i,4] == "Pritzker960" && "Pritzker960" %in% datasets){
                        
                        #if it is the first iteration through, it has to initialize the dataFrame
                        if (i == 1){#                                                                                 \/ replace with generalized
                            dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        }
                        
                        #any other ith iteration
                        else if (i != 1){
                            
                            #joins the dataFrame created by previous iterations to the current iteration dataFrame
                            dataFrame2 <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                            dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
                        }
                    }
                    
                    #rest of these follow the same form. Having else if lets the function start from any dataset, not necessitating "pritzker960" to come first in the list, for example.
                    else if (fileName[i,4] == "Freeze3" && "Freeze3" %in% datasets){
                    
                        if (i == 1){#                                                                                   \/ replace with generalized
                            dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        }
                        else if (i !=1){
                            dataFrame2 <- file[file[,grep("Symbol", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                            dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
                        }
                    }
                    else if (fileName[i,4] == "LCM.AMY" && "LCM.AMY" %in% datasets){
                
                        if (i == 1){#                                                                                   \/ replace with generalized
                            dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        }
                        else if(i != 1){
                            dataFrame2 <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                            dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
                        }
                    }
                    else if (fileName[i,4] == "LCM.HC" && "LCM.HC" %in% datasets){
                
                        if (i == 1){#                                                                                   \/ replace with generalized
                          dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        }
                        else if(i != 1){
                            dataFrame2 <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                            dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
                        }
                    }
                }
            }
        }
        #initializing prevDataSet
        if(j == 1){
            prevDataSet <- dataFrame
        }
        
        #making sure what we join by is in both datasets
        else if ("SYMBOLREANNOTATED" %in% colnames(prevDataSet) && "SYMBOLREANNOTATED" %in% colnames(dataFrame)){
            prevDataSet <- join(prevDataSet, dataFrame, by = "SYMBOLREANNOTED", type = "full")
        }
        else if ("symbol" %in% colnames(prevDataSet) && "symbol" %in% colnames(dataFrame)){
            prevDataSet <- join(prevDataSet, dataFrame, by = "symbol", type = "full")
        }
    }
}


# Test stuff disregard.
HiddenDataSet(DataSetModel = testDataSetModel, geneList = testgeneList, platform = testplatform, datasets = testdatasets)


if ("Pritzker960" %in% datasets && DataSetModel[i,4] == "LCM.AMY"){
    if (i == 1){#                                                                                 \/ replace with generalized
        dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% testgeneList,]
    }
    dataFrame2 <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% testgeneList,]
    dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
}
