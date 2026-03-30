# Children's Word Recognition with Distractor Images Online Experiment

[Project](https://github.com/psymichaelzhu/q4_projectorganization) | [Paper](https://github.com/psymichaelzhu/q4_projectorganization) |  [OSF](https://github.com/psymichaelzhu/q4_projectorganization)

## Overview

A repository for an online behavioral experiment examining how accurately children of different ages recognize words when those words are presented alongside distractor images. 

In the word-recognition task, children were asked to identify a target word, such as “apple,” in the presence of a distractor image, such as “carrot”. The main measure is accuracy of recognition. Independent variables include target identity and child age group.

Participants were recruited through local schools. Data collected via [JATOS](https://www.jatos.org/); experiment hosted on [DigitalOcean](https://www.digitalocean.com/). 


---

## Repository structure
```
project_name/
├── README.md
├── LICENSE
├── .gitignore
│
├── experiment/
│   ├── stimuli/
│   │   ├── raw_materials/          # raw materials (e.g., unscrambled images)
│   │   ├── generated/              # generated stimuli (e.g., scrambled images)
│   │   └── scripts/                # scripts for stimuli generation
│   ├── tasks/                      # scripts for each task, parameters are read from config files
│   │   ├── behavioral_tasks/
│   │   │   ├── word_recognition/
│   │   │   ├── language_production/
│   │   │   └── ...
│   │   └── survey_tasks/
│   │       ├── demographics_survey/
│   │       ├── feedback_survey/
│   │       └── ...
│   ├── config/                     # hierarchical experiment configuration files
│   │   ├── experiment.yml          # top-level experiment specification linking to module configs
│   │   └── modules/                # modular configuration files defining detailed parameters
│   │       ├── layout.yml
│   │       ├── stimuli.yml
│   │       └── ...
│   └── launcher/                   # wrapper script for running the experiment
│
├── data_raw/
│   ├── README.md                   # all folders are placeholder; see OSF for raw data
│   └── experiment_id1/
│       ├── README.md               # experiment design + dictionary of variables
│       ├── participant_id1/
│       │   ├── trial_id1/          # If trial-level data is simple, then this level can be merged.
│       │   ├── trial_id2/
│       │   └── ...
│       └── ...
│
├── threads/                        # different threads of analysis
│   ├── t01_embedding_trajectory/
│   │   ├── README.md               # step-by-step walkthrough + dictionary
│   │   ├── data/
│   │   │   ├── data_clean/         # preprocessed data (e.g., outliers removed)
│   │   │   ├── data_extracted/     # extracted features (e.g., CLIP embeddings)
│   │   │   └── data_transformed/   # analysis-ready data (e.g., merged with predictors, standardized)
│   │   ├── analysis/               # naming: step index + analysis type
│   │   │   ├── requirements.txt
│   │   │   ├── scripts/            # parameters are read from config files rather than hard-coded
│   │   │   │   ├── utils/          # helper functions
│   │   │   │   ├── 00_preprocessing/
│   │   │   │   ├── 01_analysis/
│   │   │   │   ├── 02_visualization/
│   │   │   │   └── ...
│   │   │   ├── config/             # parameterization details at each step
│   │   │   │   ├── 00_preprocessing.yml
│   │   │   │   ├── 01_analysis.yml
│   │   │   │   ├── 02_visualization.yml
│   │   │   │   └── ...
│   │   │   ├── demos/              # notebooks for demonstrating core functions
│   │   │   └── Launcher/           # end-to-end pipeline runners, if applicable
│   │   └── results/
│   │       ├── reports/            # Quarto reports for flexible presentation
│   │       ├── stats/  
│   │       └── figures/            # naming: p/s + index + title.png
│   │           ├── main/           
│   │           │   ├── p1-1_pc-heatmap.png
│   │           │   ├── p1-2_Nsub-heatmap.png
│   │           │   ├── p2-1_pc-age-trend.png
│   │           │   ├── p2-2_pc-word-mean.png
│   │           │   └── ...
│   │           └── supplementary/
│   │               ├── s1-1_pc-individual-trajectory.png
│   │               └── ...
│   └── t02_behavioral_accuracy/
│       └── ...
│
└── docs/
    ├── threads_overview.md         # summary of all threads (objectives, flow, key results)
    └── data_access.md              # data access and usage policy
```

---

# 

---

## Citation

If you use this repository or dataset, please cite. Here is an example BibTeX entry:

```
@misc{zhu_word_recognition_children,
  title={Children's Word Recognition with Distractor Images Online Experiment},
  author={Michael Zhu and contributors},
  year={2026},
  publisher={GitHub},
  howpublished={\url{https://github.com/psymichaelzhu/q4_projectorganization}}
}
```

---

## Contact

Questions about the experiment or data: psymichaelzhu@gmail.com

Questions about the code: open an issue or email psymichaelzhu@gmail.com
