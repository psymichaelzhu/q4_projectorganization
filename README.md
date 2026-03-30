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
│   │       └── ...
│   └── launcher/                   # wrapper script for running the experiment
│
├── data_raw/
│   ├── README.md                   # all folders are placeholder; see OSF for raw data
│   └── experiment_id1/
│       ├── README.md               # documents the experiment design + dictionary of variables
│       ├── experiment_config.json  # full configuration used for this experiment
│       ├── participant_id1/
│       │   ├── participant_config.json  # participant-specific configuration
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
│   │   │   └── launcher/           # end-to-end pipeline runners, if applicable
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

## Getting Started

To get started, first clone this repository:

```bash
git clone https://github.com/psymichaelzhu/q4_projectorganization.git
```

This repository consists of three main components:

- **`experiment/`** — Contains materials and code for running the online experiment.
- **`data_raw/`** — Placeholder folders; actual raw data must be downloaded separately from [OSF](https://osf.io/).
- **`threads/`** — Contains independent analysis workflows for different research questions.

### Typical Workflow

1. Clone the repository.
2. Download and replace the placeholder `data_raw/` directory with the actual raw data from OSF if you plan to run analyses.
3. Use the `experiment/` folder to inspect or launch the experiment.
4. Use the `threads/` directory to run analysis pipelines for particular questions.

> *Tip:*  
> If you only want to inspect the experiment's code and structure, simply cloning the repository is sufficient.  
> If you want to reproduce analyses, you will also need to download the raw data from OSF and install any thread-specific dependencies.


---
## Experiment

`experiment/` directory contains all materials needed to run the experiment, including stimuli, task scripts, configuration files, and the launcher. 

The main experiment configuration is defined in `experiment/config/experiment.yml`. This file specifies which design (such as task modules, layout settings, and stimulus sets) should be used for a given experiment. More fine-grained settings are stored in YAML files under `experiment/config/modules/`.

To launch the experiment locally, open `experiment/launcher/run_experiment.html` in a web browser.

At runtime, the experiment code automatically reads parameters from `experiment/config/experiment.yml` and the corresponding module YAML files in `experiment/config/modules/`. Any adjustments to the experiment design should be made in those YAML files rather than hard-coding in the scripts.

---
## Raw Data

The `data_raw/` directory in this repository contains placeholders only. The actual raw data are hosted on [OSF](https://osf.io/). 

To use the data, first clone this repository. Then download data_raw.zip from OSF, extract it, and replace the placeholder `data_raw/` folder with the downloaded version. After that, the analysis pipelines can be run normally.

The raw data are organized hierarchically by experiment, participant, and trial. At the experiment level, a `README.md` describes the study design and variables, and an `experiment_config.json` records the full configuration used for that run. At the participant level, a `participant_config.json` stores participant-specific settings such as assigned condition and trial shuffling seed. 

All shared data are de-identified and should not be redistributed without permission. See `docs/data_access.md` for details.

---
## Threads of Analysis

The `threads/` directory contains independent analysis threads, each focused on a specific research question or workflow (see `docs/threads_overview.md` for an overview). Each thread has its own `README.md`, which explains the analysis objective, step-by-step workflow, variable dictionary, and key functions.

Within each thread, the `analysis/` directory contains scripts, configuration files, optional demos, and launchers. 

Analysis scripts are organized by step index under `threads/{thread_name}/analysis/scripts/`. Configuration details are defined in YAML files under `threads/{thread_name}/analysis/config/`. We also provide some demo notebooks under `threads/{thread_name}/analysis/demos/` for demonstrating core functions.

To run an analysis, first install the required dependencies listed in requirements.txt through 
```
pip install -r requirements.txt
```
Then run the full pipeline through `threads/{thread_name}/analysis/launcher/run_analysis.py`, or manually execute scripts step by step from `threads/{thread_name}/analysis/scripts/`. 

At runtime, analysis scripts read parameters directly from the YAML configuration files. Any adjustments to the analysis design should be made in those YAML files rather than hard-coding in the scripts.

After running the analysis, the processed data will be saved in `threads/{thread_name}/data/`, and the results will be saved in `threads/{thread_name}/results/`. 

Some reporting templates are provided in `threads/{thread_name}/results/reports/`. After running the analysis, render the `.qmd` files to generate reports.

---

## Citation

If you use this repository, please cite. Here is an example BibTeX entry:

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
