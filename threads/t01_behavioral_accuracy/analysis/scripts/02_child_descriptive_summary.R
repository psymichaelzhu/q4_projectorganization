library(tidyverse)
library(yaml)

cfg <- read_yaml("analysis/config/02_child_descriptive_summary.yml")

df <- read_csv(cfg$data_path)

set.seed(cfg$seed)
sampled_words <- sample(unique(df$targetWord), cfg$n_sampled)

df_child <- df %>% filter(age_group != cfg$exclude_age)

# Mean PC by age
p2.1_pc_age_trend <- df_child %>%
  group_by(age_group) %>%
  summarise(pc.mean = mean(pc, na.rm = TRUE), .groups = "drop") %>%
  ggplot(aes(x = age_group, y = pc.mean)) +
  geom_point(color = "steelblue", alpha = 0.8, size = 3) +
  geom_line(color = "steelblue", alpha = 0.5) +
  geom_text(aes(label = round(pc.mean, 2)), vjust = -0.4, size = 3) +
  labs(title = "Mean PC by Age Group", x = "Age Group", y = "Mean % Correct") +
  theme_minimal()

df_word <- df_child %>%
  filter(targetWord %in% sampled_words) %>%
  group_by(targetWord) %>%
  summarise(pc.mean = mean(pc, na.rm = TRUE),
            pc.sd   = sd(pc,   na.rm = TRUE), .groups = "drop")

# Mean PC by word
p2.2.1_pc_word_mean <- df_word %>%
  mutate(targetWord = fct_reorder(targetWord, pc.mean)) %>%
  ggplot(aes(x = targetWord, y = pc.mean)) +
  geom_col(fill = "steelblue", alpha = 0.8) +
  coord_flip() +
  labs(title = "Mean PC by Word", x = NULL, y = "Mean % Correct") +
  theme_minimal()

# SD of PC by word
p2.2.2_pc_word_sd <- df_word %>%
  mutate(targetWord = fct_reorder(targetWord, pc.sd)) %>%
  ggplot(aes(x = targetWord, y = pc.sd)) +
  geom_col(fill = "tomato", alpha = 0.8) +
  coord_flip() +
  labs(title = "SD of PC by Word", x = NULL, y = "SD of % Correct") +
  theme_minimal()

ggsave("results/figures/main/p2-1_pc-age-trend.png", p2.1_pc_age_trend, width = 8, height = 6)
ggsave("results/figures/main/p2-2-1_pc-word-mean.png", p2.2.1_pc_word_mean, width = 8, height = 6)
ggsave("results/figures/main/p2-2-2_pc-word-sd.png", p2.2.2_pc_word_sd, width = 8, height = 6)