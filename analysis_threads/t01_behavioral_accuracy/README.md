# t01_behavioral_accuracy

## Objective

Transform aggregated vocabulary accuracy data into descriptive visualizations and simple per-word developmental summaries for inspecting age effects, word effects, and age-by-word differences.

## Flow

All the following steps start with the aggregated vocabulary dataset `data/data_transformed/vocabulary_dataset.csv`.

> Note: Since the data might be lab-related, the data file in this repository is empty. Though all results were generated from the original data.

- `01_cell_level_heatmap.R`:
   Generate full age-by-word heatmaps for recognition accuracy (pc) `figures/main/p1-1_pc-heatmap.png` and subject counts (num_subjects) `figures/main/p1-2_n_subjects-heatmap.png`.

- `02_child_descriptive_summary.R`:
  Filter out the adult group (age_group == 25) and transform the child-only data into marginal summaries, including mean accuracy by age `figures/main/p2-1_pc-age-trend.png` and mean / SD of accuracy by word `figures/main/p2-2-1_pc-word-mean.png` `figures/main/p2-2-2_pc-word-sd.png`.

- `03_child_word_lm.R`:
  Center age at the youngest child group (age_center = 3), fit per-word linear regressions on the child-only data `stats/word_lm.csv`, and generate plots of regression intercepts and slopes `figures/main/p3-1_intercept-word-lm.png` `figures/main/p3-2_slope-word-lm.png`.


## Usage

Open `t01_behavioral_accuracy.Rproj` in RStudio, then run `analysis/launcher/run_pipeline.R`.

After running the pipeline, the results will be saved in `results/`.

[Optional] Render `.qmd` files in `results/reports/` to generate reports, [example report](results/reports/Mar29_labmeeting.pptx).