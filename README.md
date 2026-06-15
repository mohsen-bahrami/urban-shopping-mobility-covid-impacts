# Urban Shopping Mobility and Socioeconomic Inequality During COVID-19

This repository contains code, preprocessed data, model outputs, and robustness analyses for a research project examining how the COVID-19 pandemic reshaped in-person department-store shopping mobility in New York City and how these changes varied across socioeconomic and demographic communities.

The project uses large-scale mobility, place, and census data to study revealed shopping-location patterns from 2018 to 2021. The analysis builds on a modified Huff gravity model with a multiplicative competitive interaction (MCI) structure and uses calibrated model parameters to quantify changes in store-selection patterns before, during, and after the initial COVID-19 shock.

## Research overview

The main research question is:

**How did the COVID-19 pandemic change revealed urban shopping-location patterns in New York City, and were these shifts heterogeneous across socioeconomic and demographic communities?**

The project focuses on department stores, general merchandise stores, warehouse clubs, and supercenters in New York City. It studies annual changes in six store-selection factors:

* customer-store distance
* store area
* chain loyalty
* POI count near the store
* POI diversity near the store
* demographic similarity between customer CBG and store CBG

The repository includes analyses for:

* modified Huff/MCI model outputs
* socioeconomic heterogeneity in shopping-location patterns
* top 5% versus top 10% socioeconomic threshold sensitivity
* SafeGraph panel representativeness diagnostics
* PCA-based socioeconomic structure assessment
* K-means cluster stability checks
* Moran’s I and LISA spatial autocorrelation diagnostics
* sampling-bias sensitivity of the main model results

## Repository structure

```text
urban-shopping-mobility-covid-impacts/
│
├── README.md
├── LICENSE
├── requirements.txt
├── .gitignore
│
├── docs/
│   ├── Code_Descriptions/
│   │   └── code_descriptions.md
│   └── Data_Descriptions/
│       └── data_description.md
│
├── data/
│   ├── processed/
│   │   ├── NY_cbg_census.csv
│   │   └── nyc_cbgs.json
│   │
│   ├── model_inputs/
│   │   └── README.md
│   │
│   ├── model_outputs/
│   │   ├── PSO_2018_6params_NYC_norm_28_PSO_15.csv
│   │   ├── PSO_2019_6params_NYC_norm_28_PSO_15.csv
│   │   ├── PSO_2020_6params_NYC_norm_28_PSO_15.csv
│   │   └── PSO_2021_6params_NYC_norm_28_PSO_15.csv
│   │
│   └── data_representativeness_analysis_inputs/
│       └── README.md
│
├── notebooks/
│   ├── 01_data_representativeness.ipynb
│   ├── 02_socioeconomic_spatial_diagnostics.ipynb
│   ├── 03_model_sensitivity_sampling_bias.ipynb
│   └── 04_top_ses_threshold_sensitivity.ipynb
│
└── outputs/
    ├── data_representativeness/
    ├── top_ses_threshold_sensitivity/
    ├── robustness/
    └── socioeconomic_spatial_diagnostics/
        ├── figures/
        └── tables/

```

## Data availability

This repository does **not** include raw SafeGraph weekly patterns or raw mobile-device records. The analysis uses preprocessed and aggregated files derived from mobility, place, and census data.

To keep the GitHub repository lightweight, large derived input files are hosted separately on the Open Science Framework (OSF). These files exceed GitHub’s recommended file-size limits and should be downloaded before running the full workflow.

Companion OSF repository:

[Click here for urban-shopping-mobility-covid-impacts OSF Repository](https://osf.io/r9yz7/overview)

Large files hosted on OSF include:

```text
model_inputs/table_2018.csv
model_inputs/table_2019.csv
model_inputs/table_2020.csv
model_inputs/table_2021.csv
```

Additional large Census-derived representativeness input files are also hosted on OSF and should be placed in:

```text
data_representativeness_analysis_inputs/
```

The four PSO model-output files used for most downstream analyses are included directly in this GitHub repository under:

```text
data/model_outputs/
```

These files contain calibrated CBG-level model parameters for 2018, 2019, 2020, and 2021.

## Reproducibility workflow

To reproduce the analyses:

1. Clone this repository.

```bash
git clone https://github.com/<username>/urban-shopping-mobility-covid-impacts.git
cd urban-shopping-mobility-covid-impacts
```

2. Install the required Python packages.

```bash
pip install -r requirements.txt
```

3. Download the large derived input files from the [companion OSF repository](https://osf.io/r9yz7/overview).

4. Place the downloaded files in the appropriate folders:

```text
data/model_inputs/
data/representativeness_inputs/
```

5. For the main analysis from model outputs, run the notebooks in the sub-folder as explained in `docs/Code_Descriptions/code_descriptions.md`

6. For robustness checks and sensitivity analysis run the notbooks as follows:

```text
01_data_representativeness.ipynb
02_socioeconomic_spatial_diagnostics.ipynb
03_model_sensitivity_sampling_bias.ipynb
04_top_ses_threshold_sensitivity.ipynb
```

## Notebook descriptions

### `01_data_representativeness.ipynb`

Assesses the representativeness of the SafeGraph mobility panel in New York City by comparing device counts with Census population counts across CBGs, boroughs, education groups, income groups, and race/ethnicity groups. It also evaluates the effect of filtering sparse CBGs.

### `02_socioeconomic_spatial_diagnostics.ipynb`

Conducts PCA on socioeconomic and demographic CBG attributes, evaluates K-means clustering stability, and computes spatial autocorrelation diagnostics using Moran’s I and LISA for CBG-level parameter changes.

### `03_model_sensitivity_sampling_bias.ipynb`

Tests whether the main model results are sensitive to SafeGraph sampling bias by repeating the main parameter-change analysis after excluding CBGs with the highest absolute sampling bias.

### `04_top_ses_threshold_sensitivity.ipynb`

Evaluates whether socioeconomic heterogeneity results are sensitive to the choice of top 5% versus top 10% thresholds for defining high-concentration socioeconomic and demographic communities.

## Main analyses

This repository supports the following analysis components:

* **Modified Huff/MCI model calibration outputs**
  Annual CBG-level calibrated parameters for six store-selection factors.

* **Socioeconomic heterogeneity analysis**
  Comparison of revealed shopping-location pattern changes across high-concentration socioeconomic and demographic groups.

* **Top 5% versus top 10% sensitivity**
  Threshold sensitivity analysis showing whether results depend on the original top 5% group definition.

* **K-means cluster stability**
  Repeated K-means clustering under multiple random seeds to test the stability of socioeconomic cluster assignments.

* **PCA socioeconomic structure check**
  Principal component analysis of CBG-level socioeconomic and demographic attributes.

* **Spatial autocorrelation diagnostics**
  Global Moran’s I and local LISA diagnostics for CBG-level parameter changes.

* **Sampling-bias sensitivity**
  Robustness checks excluding the top 10% and top 20% of CBGs with the highest absolute SafeGraph sampling bias.

## Key outputs

Generated outputs are organized as follows:

```text
outputs/data_representativeness/
```

Contains borough-, CBG-, education-, income-, and race-level representativeness metrics.

```text
outputs/top_ses_threshold_sensitivity/
```

Contains figures and tables comparing top 5% and top 10% socioeconomic group definitions.

```text
outputs/socioeconomic_spatial_diagnostics/
```

Contains PCA outputs, K-means stability results, Moran’s I diagnostics, and LISA outputs.

```text
outputs/sampling_bias_sensitivity/
```

Contains sampling-bias sensitivity tables comparing the full analytical sample with samples excluding the most sampling-biased CBGs.

```text
outputs/figures/
```

Contains manuscript and supplementary figures generated from the analysis notebooks.

```text
outputs/tables/
```

Contains manuscript and supplementary tables generated from the analysis notebooks.

## Data notes

The unit of analysis is the Census Block Group (CBG). Mobility data are aggregated to CBG-level flows and do not include individual-level trajectories or personally identifiable information.

The model-output files in `data/model_outputs/` include the following calibrated parameters:

```text
H_Area_of_store
R_Percentage_of_Visits_by_brand
J_POI_count_where_store_is
K_POI_diversity_where_store_is
L_Demographic_similarity
G_Distance_between_cbg_and_store
```

These correspond to store area, chain loyalty, POI count, POI diversity, demographic similarity, and customer-store distance.

## Citation

A citation will be added after publication.

For now, please cite this repository as:

```text
Xu, Y., Bahrami, M., and Pentland, A. Urban Shopping Mobility and Socioeconomic Inequality During COVID-19. GitHub repository: urban-shopping-mobility-covid-impacts.
```

## License

Code in this repository is released for academic and research use. Data files are provided for reproducibility of the associated research project and should be used in accordance with the terms of the original data sources.

A formal license file should be consulted before reuse.


