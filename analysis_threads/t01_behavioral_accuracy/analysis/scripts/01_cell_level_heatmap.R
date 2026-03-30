library(tidyverse)
library(yaml)

cfg <- read_yaml("analysis/config/01_cell_level_heatmap.yml")

df <- read_csv(cfg$data_path)

p1.1_pc_heatmap <- df %>%
  ggplot(aes(x = age_group, y = targetWord, fill = pc)) +
  geom_tile() +
  scale_fill_viridis_c(option = "magma", na.value = "grey80", name = "% Correct") +
  labs(title = "Heatmap: PC by Age x Word", x = "Age Group", y = "Target Word") +
  theme_minimal(base_size = 7) +
  theme(axis.text.y = element_text(size = 4))

p1.2_n_subjects_heatmap <- df %>%
  ggplot(aes(x = age_group, y = targetWord, fill = num_subjects)) +
  geom_tile() +
  scale_fill_viridis_c(option = "cividis", na.value = "grey80", name = "N Subjects") +
  labs(title = "Heatmap: N Subjects by Age Group x Word", x = "Age Group", y = "Target Word") +
  theme_minimal(base_size = 7) +
  theme(axis.text.y = element_text(size = 4))

ggsave("results/figures/main/p1-1_pc-heatmap.png", p1.1_pc_heatmap, width = 8, height = 6)
ggsave("results/figures/main/p1-2_n_subjects-heatmap.png", p1.2_n_subjects_heatmap, width = 8, height = 6)