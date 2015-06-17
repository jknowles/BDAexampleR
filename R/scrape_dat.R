####

?readLines

A <- read.table(file("data/football/scores.txt"), header=TRUE, comment.char="#")

A <- read.table(file("data/rats/rats.txt"), header=TRUE, comment.char="#")

A <- read.table(file("data/meta/metabeta.txt"), header=TRUE, comment.char="#")

A <- read.table(file("data/stratified/cbspoll.txt"), header=TRUE, comment.char="#")

A <- read.table(file("data/cow/cowfeed.txt"), header=TRUE, comment.char="#")

A <- read.table(file("data/polls88/cbsphones.txt"), header=TRUE, comment.char="#", 
                sep="", allowEscapes=TRUE, stringsAsFactors=FALSE)

A <- read.table(file("data/ny/newyorkpop.txt"), header=TRUE, comment.char="#")

A <- read.table(file("data/pres/presidential.txt"), header=TRUE, comment.char="#")
A <- read.table(file("data/experiment/factorial.txt"), header=TRUE, comment.char="#")
A <- read.table(file("data/infosource/cancer.txt"), header=TRUE, comment.char="#")
A <- read.table(file("data/fabric/faults.txt"), header=TRUE, comment.char="#")

A <- read.table(file("data/schiz/responsetime.txt"), header=FALSE, comment.char="#", 
                sep="")

A <- read.table(file("data/dilution/assays.txt"), header=FALSE, comment.char="#", 
                sep="")

A <- read.table(file("data/golf/putting.txt"), header=TRUE, comment.char="#")
A <- read.table(file("data/light/speedmeas.txt"), header=FALSE, comment.char="#")

A <- read.table(file("data/ARM_Data/arsenic/wells.dat"), header=TRUE, comment.char="#")
library(foreign)
A <- read.dta("data/ARM_Data/nes/nes5200_processed_voters_realideo.dta")



A <- read.table(file("data/house/1896.txt"), header=TRUE, comment.char="#")


header <- c("state", "district", "incumben", "demvotes", "repvotes")

yrs <- seq(1896, 1992, by=2)
urls <- paste0("http://stat.columbia.edu/~gelman/book/data/incumbency/", yrs,".asc")

houseelec <- data.frame("state"=NA, "district" = NA, "incumben" = NA, 
                  "demvotes" = NA, "repvotes" = NA, "yr" = NA)
for(i in 1:length(urls)){
  dat.tmp <- read.table(url(urls[i]), header=FALSE, col.names=header)
  idx <- urls[i]
  dat.tmp$yr <- yrs[i]
  houseelec <- rbind(houseelec, dat.tmp)
}

save(houseelec, file="data/house/houseseats.rda")

exceptions <- c("yr", "state", "district", "dem", "rep", "minor", "votes")

excep <- read.table(url("http://stat.columbia.edu/~gelman/book/data/incumbency/excepth.asc"), 
                    header=FALSE, comment.char="@", col.names=exceptions)


save(excep, file="data/house/houseexceptions.rda")
