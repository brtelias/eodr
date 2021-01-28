library(readr)
library(RSQLite)
library(usethis)
library(dplyr)

finp <- list.files("data-raw", pattern = "\\.tsv", full.names = T, recursive = T)

# parto con la 1era tabla
n <- gsub(".*/", "", finp)
n <- gsub("_|[0-9]", "", n)
n <- tolower(gsub("\\.tsv", "", n))

d <- read_delim(finp[1], delim = "\t")
assign(n[1], d)

use_data(actividad)
use_data(n [1])

try(dir.create("inst"))
try(dir.create("inst/extdata"))
con <- dbConnect(SQLite(), "inst/extdata/eod2017.sqlite")

con <- dbConnect(SQLite(), "data-raw/eod2017.sqlite")
for (i in seq_along(finp)) {
  d <- read_delim(finp[i], delim= "\t")
  copy_to(con, d, n[i], temporary=FALSE)
}

dbListTables(con)

dbDisconnect(con)
