library(tidyverse)
library(yaml)

cfg <- read_yaml("analysis/config/03_child_word_lm.yml")

df <- read_csv(cfg$data_path)

set.seed(cfg$seed)
sampled_words <- sample(unique(df$targetWord), cfg$n_sampled)

df_child <- df %>% filter(age_group != cfg$exclude_age)

word_lm <- df_child %>%
  mutate(age_c = age_group - cfg$age_center) %>%
  filter(targetWord %in% sampled_words) %>%
  group_by(targetWord) %>%
  group_modify(~ {
    m <- lm(pc ~ age_c, data = .x)
    tibble(
      intercept    = coef(m)[1],
      intercept_se = summary(m)$coefficients[1, 2],
      slope        = coef(m)[2],
      slope_se     = summary(m)$coefficients[2, 2]
    )
  }) %>%
  ungroup()

write_csv(word_lm, "results/stats/word_lm.csv")

# Intercept
p3.1_intercept_word_lm <- word_lm %>%
  mutate(targetWord = fct_reorder(targetWord, intercept)) %>%
  ggplot(aes(x = intercept, y = targetWord)) +
  geom_point(size = 2.5, color = "steelblue") +
  geom_errorbarh(aes(xmin = intercept - intercept_se,
                     xmax = intercept + intercept_se),
                 height = 0.4, color = "steelblue") +
  geom_vline(xintercept = 0, linetype = "dashed", color = "grey50") +
  labs(title = "Linear Regression Intercept (Word Recognizability) by Word",
       x = "Intercept (Word Recognizability)", y = NULL) +
  theme_minimal()

# Slope
p3.2_slope_word_lm <- word_lm %>%
  mutate(targetWord = fct_reorder(targetWord, slope)) %>%
  ggplot(aes(x = slope, y = targetWord)) +
  geom_point(size = 2.5, color = "tomato") +
  geom_errorbarh(aes(xmin = slope - slope_se,
                     xmax = slope + slope_se),
                 height = 0.4, color = "tomato") +
  geom_vline(xintercept = 0, linetype = "dashed", color = "grey50") +
  labs(title = "Linear Regression Slope (Age Effect) by Word",
       x = "Slope (Yearly Change in Word Recognizability)", y = NULL) +
  theme_minimal()

ggsave("results/figures/main/p3-1_intercept-word-lm.png", p3.1_intercept_word_lm, width = 8, height = 6)
ggsave("results/figures/main/p3-2_slope-word-lm.png", p3.2_slope_word_lm, width = 8, height = 6)