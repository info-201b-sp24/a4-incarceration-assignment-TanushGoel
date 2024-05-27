library("ggplot2")
library("dplyr")
library("tidyr")

url <- "https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true"
prison_data <- read.csv(url)

box_plot_data <- prison_data %>%
  select(state, black_jail_pop_rate, white_jail_pop_rate) %>%
  pivot_longer(cols = c(black_jail_pop_rate, white_jail_pop_rate), 
               names_to = "race", 
               values_to = "jail_pop_rate") %>%
  mutate(jail_pop_rate_log = log10(jail_pop_rate))

plot <- ggplot(box_plot_data,
               aes(x = race, y = jail_pop_rate_log, fill = race)) +
  geom_boxplot() +
  labs(title = "Comparison of Black & White Jail Population Rates (Log Scale)",
       x = "Race",
       y = "Log10 of Jail Population Rate",
       fill = "Race") +
  scale_x_discrete(labels = c("Black", "White")) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        axis.title.x = element_text(size = 14, face = "bold"),
        axis.title.y = element_text(size = 14, face = "bold"),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10))

print(plot)