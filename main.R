require("tidyverse")


board_pharma <- read.csv("C:/Users/SERELPA1/OneDrive - Novartis Pharma AG/Projects/Sales Forecasting/normalization test/board_pharma.csv", sep = ";", stringsAsFactors = F, dec = ",") %>% 
  select(-X)

available_dates <- board_pharma %>%
  filter(is.na(Mgmt_Sales) == F) %>% 
  group_by(Country, Brand) %>% 
  summarize(min_date = min(Month), max_date = max(Month), n_months = n_distinct(Month))

test_set <- board_pharma %>% 
  filter(Country %in% c("Germany", "Italy"), Brand == "ENTRESTO")
write.csv(test_set, "test_sc.csv")
