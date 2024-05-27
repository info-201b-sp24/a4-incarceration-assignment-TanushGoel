library("ggplot2")
library("dplyr")

url <- "https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true"
prison_data <- read.csv(url)

filtered_data <- prison_data %>% filter(!is.na(total_jail_pop_rate))

state_year_data <- filtered_data %>%
  group_by(state, year) %>%
  summarize(mean_jail_pop_rate = mean(total_jail_pop_rate, na.rm = TRUE))

plot <- ggplot(state_year_data,
               aes(x = year, y = state, fill = mean_jail_pop_rate)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "blue", high = "red", na.value = "grey50", 
                      name = "Mean Jail Population Rate") +
  labs(title = "Mean Jail Population Rate by State and Year",
       x = "Year", y = "State") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 15, face = "bold"),
        axis.title.x = element_text(size = 15, face = "bold"),
        axis.title.y = element_text(size = 15, face = "bold"),
        axis.text.x = element_text(size = 10, angle = 45, hjust = 1),
        axis.text.y = element_text(size = 10),
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 10))

print(plot)