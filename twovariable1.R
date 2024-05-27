library("ggplot2")
library("dplyr")

url <- "https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true"
prison_data <- read.csv(url)

filtered_data <- prison_data %>%
  filter(!is.na(total_jail_pop_rate) & !is.na(total_prison_pop_rate))

plot <- ggplot(filtered_data,
               aes(x = total_jail_pop_rate, y = total_prison_pop_rate,
                   color = state, size = total_pop)) +
  geom_point(alpha = 0.7) +
  scale_size_continuous(range = c(1, 10), name = "Total Population") +
  labs(title = "Comparison of Jail and Prison Population Rates by State",
       x = "Total Jail Population Rate",
       y = "Total Prison Population Rate",
       color = "State") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 15, face = "bold"),
        axis.title.x = element_text(size = 15, face = "bold"),
        axis.title.y = element_text(size = 15, face = "bold"),
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 10),
        legend.title = element_text(size = 15),
        legend.text = element_text(size = 15))

print(plot)