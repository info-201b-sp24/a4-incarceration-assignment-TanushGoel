library("ggplot2")
library("dplyr")

url <- "https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true"
prison_data <- read.csv(url)

filtered_data <- prison_data %>% filter(!is.na(total_jail_pop_rate))

plot <- ggplot(filtered_data, aes(x = year, y = total_jail_pop_rate)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 2) +
  labs(title = "Total Jail Population Rate Over the Years",
       x = "Year", y = "Total Jail Population Rate") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 15, face = "bold"),
        axis.title.x = element_text(size = 15, face = "bold"),
        axis.title.y = element_text(size = 15, face = "bold"),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10))

print(plot)