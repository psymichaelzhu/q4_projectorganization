scripts <- c(
  "analysis/scripts/01_cell_level_heatmap.R",
  "analysis/scripts/02_child_descriptive_summary.R",
  "analysis/scripts/03_child_word_lm.R"
)

for (s in scripts) {
  cat(s, "\n")
  source(s)
}
