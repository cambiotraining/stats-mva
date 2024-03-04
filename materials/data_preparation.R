library(tidyverse)
library(readxl)
library(janitor)

# read in the original data
grant2020_sd03 <- read_excel("materials/data/pnas.2000388117.sd03.xlsx") %>% 
  clean_names()

# remove abbreviations at the bottom by
# removing all rows with missing values
finches_hybrid <- grant2020_sd03 %>%
  drop_na()

# keep only the parental species for simplicity
# remove the calculated principal components
finches_hybrid <- finches_hybrid %>% 
  filter(category %in% c("fortis", "fuliginosa", "scandens")) %>% 
  select(1:7)

write_csv(finches_hybrid, "materials/data/finches_hybridisation.csv")
