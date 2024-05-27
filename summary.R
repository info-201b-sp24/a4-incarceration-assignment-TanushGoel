library(dplyr)

url <- "https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates.csv"
prison_data <- read.csv(url)

filtered_data <- prison_data %>% filter(!is.na(total_jail_pop_rate))

us_info <- filtered_data %>%
  summarise(
    mean_total_jail_pop_rate = mean(total_jail_pop_rate, na.rm = TRUE),
    median_total_jail_pop_rate = median(total_jail_pop_rate, na.rm = TRUE),
    max_total_jail_pop_rate = max(total_jail_pop_rate, na.rm = TRUE)
  )

wa_data <- filtered_data %>%
  filter(state == "WA" & !is.na(total_jail_pop_rate))

wa_info <- wa_data %>%
  summarise(
    county_with_max_jail_pop_rate = county_name[which.max(total_jail_pop_rate)],
    state_mean_jail_pop_rate = mean(total_jail_pop_rate, na.rm = TRUE)
  )

print(us_info)
print(wa_info)