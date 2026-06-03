# urban-shopping-mobility-covid-impacts
urban-shopping-mobility-covid-impacts

urban-shopping-mobility-covid/
│
├── README.md
├── LICENSE
├── requirements.txt
├── .gitignore
│
├── docs/
│   ├── manuscript/
│   │   ├── Manuscript_v1.PDF
│   │   ├── SupMaterial_v1.PDF
│   │   └── Reviewer_Comments.pdf
│   └── data_descriptions/
│       ├── Code_Description.docx
│       └── Data_Description.docx
│
├── data/
│   ├── raw/
│   │   └── README.md
│   ├── processed/
│   │   ├── NY_cbg_census.csv
│   │   ├── nyc_cbgs.json
│   │   ├── parameter_values_ses_cluster_comparison_2019.csv
│   │   └── README.md
│   ├── model_inputs/
│   │   ├── table_2018.csv
│   │   ├── table_2019.csv
│   │   ├── table_2020.csv
│   │   ├── table_2021.csv
│   │   └── README.md
│   └── model_outputs/
│       ├── PSO_2018_6params_NYC_norm_28_PSO_15.csv
│       ├── PSO_2019_6params_NYC_norm_28_PSO_15.csv
│       ├── PSO_2020_6params_NYC_norm_28_PSO_15.csv
│       ├── PSO_2021_6params_NYC_norm_28_PSO_15.csv
│       └── README.md
│
├── notebooks/
│   ├── 01_data_preprocessing.ipynb
│   ├── 02_model_calibration.ipynb
│   ├── 03_main_analysis.ipynb
│   ├── 04_data_representativeness.ipynb
│   ├── 05_socioeconomic_spatial_diagnostics.ipynb
│   └── 06_model_sensitivity_sampling_bias.ipynb
│
├── src/
│   ├── preprocessing/
│   ├── calibration/
│   ├── analysis/
│   └── visualization/
│
├── outputs/
│   ├── figures/
│   ├── tables/
│   ├── robustness/
│   └── spatial_diagnostics/
│
└── archive/
    └── README.md




]

description of research, methodologies, and findings.

## Dataset & Replication
To keep this repository lightweight and fast to clone, the large data components are hosted on the Open Science Framework (OSF).

* **Source Code & Metadata:** Contained entirely within this GitHub repository.
* **Core Large Datasets:** [Access the full data suite on OSF](https://osf.io)

### Large Files Directory
If you wish to replicate this study locally, please download the following files from our OSF repository and place them in the `/data` folder:
1. `large_matrix_v1.bin` (approx. 800MB) — [Direct Download](https://osf.io)
2. `simulation_output.csv` (approx. 650MB) — [Direct Download](https://osf.io)
