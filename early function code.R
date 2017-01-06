#
testdatasets <- data.frame("Freeze3", "Pritzker960")
testplatform <- "Illumina"
testgeneList <- t(data.frame("RBFOX1", "AAA1", "AAK1"))
testDataSetModel <- DataSetModel
i = 3
j = 2
HiddenDataSet <- function(DataSetModel, geneList, platform, datasets){
    for (j in 1:length(datasets)){
        for (i in 1:length(DataSetModel[,1])){
            if (datasets[j] %in% DataSetModel[i, ]){
                fileName <- DataSetModel[i,1]
                file <- read.csv(fileName, header = T, stringsAsFactors = F)
                if ("Illumina" %in% platform){
                    if (fileName[i,4] == "Pritzker960" && "Pritzker960" %in% datasets){
                        if (i == 1){#                                                                                 \/ replace with generalized
                            dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        }
                        dataFrame2 <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
                    }
                    else if (fileName[i,4] == "Freeze3" && "Freeze3" %in% datasets){
                    
                        if (i == 1){#                                                                                   \/ replace with generalized
                            dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        }
                        dataFrame2 <- file[file[,grep("Symbol", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
                    }
                    else if (fileName[i,4] == "LCM.AMY" && "LCM.AMY" %in% datasets){
                
                        if (i == 1){#                                                                                   \/ replace with generalized
                            dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        }
                        dataFrame2 <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
                    }
                    else if (fileName[i,4] == "LCM.HC" && "LCM.HC" %in% datasets){
                
                        if (i == 1){#                                                                                   \/ replace with generalized
                          dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        }
                        dataFrame2 <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% geneList[,1],]
                        dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
                    }
                }
            }
        }
        if(j == 1){
            prevDataSet <- dataFrame
        }
        else {
            prevDataSet <- join(prevDataSet, dataFrame, by = "SYMBOLREANNOTED", type = "full")
        }
    }
}

HiddenDataSet(DataSetModel = testDataSetModel, geneList = testgeneList, platform = testplatform, datasets = testdatasets)


if ("Pritzker960" %in% datasets && DataSetModel[i,4] == "LCM.AMY"){
    if (i == 1){#                                                                                 \/ replace with generalized
        dataFrame  <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% testgeneList,]
    }
    dataFrame2 <- file[file[,grep("SYMBOLREANNOTATED", colnames(file), perl = T,value = F)] %in% testgeneList,]
    dataFrame <- join(dataFrame, dataFrame2, "full", by = "X")
}
