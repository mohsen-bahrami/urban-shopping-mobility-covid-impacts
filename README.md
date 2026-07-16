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

It also includes a set of **robustness checks** to address the potential concerns about different stages/components of analyses:

* model-fit-stratified sensitivity of the parameter changes (model-fit concern)
* store-format disaggregation by NAICS, calibrated separately for department stores and general merchandise (chain-loyalty / terminology concern)
* lagged chain-loyalty re-calibration with a placebo year (contemporaneous mechanical-inflation concern)
* PSO estimator/seed stability across random seeds (uncertainty-quantification concern)

## Repository structure

```text
urban-shopping-mobility-covid-impacts/
│
├── README.md
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
│   │   ├── nyc_cbgs.json
│   │   ├── pois_nyc.csv
│   │   └── nyc-poi-info.csv                 # POI info keyed on safegraph_place_id
│   │                                        # (store format / NAICS, brand, category, lat/lon,
│   │                                        # census tract fields) for the format disaggregation
│   │
│   ├── model_inputs/                        # large PSO input tables (hosted on OSF)
│   │   ├── README.md
│   │   ├── table_2018.csv
│   │   ├── table_2019.csv
│   │   ├── table_2020.csv
│   │   └── table_2021.csv
│   │
│   ├── model_outputs/
│   │   ├── PSO_2018_6params_NYC_norm_28_PSO_15.csv
│   │   ├── PSO_2019_6params_NYC_norm_28_PSO_15.csv
│   │   ├── PSO_2020_6params_NYC_norm_28_PSO_15.csv
│   │   └── PSO_2021_6params_NYC_norm_28_PSO_15.csv
│   │
│   └── data_representativeness_analysis_inputs/
│       └── README.md                        # large census-derived inputs (hosted on OSF)
│
├── notebooks/
│   ├── 01_data_representativeness.ipynb
│   ├── 02_socioeconomic_spatial_diagnostics.ipynb
│   ├── 03_model_sensitivity_sampling_bias.ipynb
│   ├── 04_top_ses_threshold_sensitivity.ipynb
│   ├── 05_top_ses_changes_param_distributions_delta_population_as_of_2021.ipynb
│   ├── 1_code_for_extracting_information/    # SafeGraph filtering + PSO-table construction
│   ├── 2_code_for_PSO_calibration/          # Huff/MCI PSO calibration (per-year templates)
│   ├── 3_code_for_combining_PSO_results/    # aggregate per-core calibration results
│   └── 4_analysis/
│       ├── 1_ … 12_ …                       # main-analysis notebooks (see code_descriptions.md)
│       ├── 13_fit_stratified_sensitivity.ipynb   # robustness check: model-fit concern
│       ├── 14_format_disaggregation.ipynb        # robustness check: chain-loyalty / terminology
│       ├── 15_lagged_chain_loyalty.ipynb         # robustness check: mechanical-inflation concern
│       ├── 16_pso_estimator_stability.ipynb      # robustness check: uncertainty quantification
│       └── simulated_annealing.R
│
└── outputs/
    ├── data_representativeness/
    ├── socioeconomic_spatial_diagnostics/
    ├── top_ses_threshold_sensitivity/
    ├── robustness/
    ├── model_outputs/
    ├── item2_fit_sensitivity/               # fit-stratified sensitivity tables
    ├── item3_format_disaggregation/         # store format mapping, per-format samples & PSO
    ├── item4_chain_loyalty/                 # lagged PSO, concentration diagnostics, placebo
    └── item5_pso_stability/                 # 12,000 seed runs + stability report

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
data/data_representativeness_analysis_inputs/
```

5. For the main analysis from model outputs, run the notebooks in `notebooks/4_analysis/` as explained in `docs/Code_Descriptions/code_descriptions.md`.

6. For the representativeness and sensitivity robustness checks, run the top-level notebooks:

```text
01_data_representativeness.ipynb
02_socioeconomic_spatial_diagnostics.ipynb
03_model_sensitivity_sampling_bias.ipynb
04_top_ses_threshold_sensitivity.ipynb
05_top_ses_changes_param_distributions_delta_population_as_of_2021.ipynb
```

7. For the robustness checks, run the numbered notebooks in `notebooks/4_analysis/`:

```text
13_fit_stratified_sensitivity.ipynb
14_format_disaggregation.ipynb
15_lagged_chain_loyalty.ipynb
16_pso_estimator_stability.ipynb
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

### `05_top_ses_changes_param_distributions_delta_population_as_of_2021.ipynb`

Compares parameter-change distributions for high-concentration socioeconomic groups against the full NYC population using delta values as of 2021.

The following notebooks, each opens with a description of the robustness check and the concern it addresses, and each verifies its recomputed numbers against the outputs used in the main analyses.

* **`13_fit_stratified_sensitivity.ipynb`** stratifies CBGs by model fit and checks whether the parameter-change findings are sensitive to fit quality (model-fit concern).
* **`14_format_disaggregation.ipynb`** maps each store to a NAICS store format and re-runs the PSO calibration separately for department stores (452210) and general merchandise (452319) (chain-loyalty / terminology concern).
* **`15_lagged_chain_loyalty.ipynb`** re-runs the calibration with the chain-loyalty feature lagged by one year, plus a 2019 placebo, to test whether the chain-loyalty rise is a contemporaneous mechanical artifact.
* **`16_pso_estimator_stability.ipynb`** re-runs the PSO ten times per CBG-year across random seeds (12,000 runs) to quantify estimator/seed uncertainty (uncertainty-quantification concern).


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

* **Robustness checks**
  Fit-stratified sensitivity, store-format disaggregation, lagged chain-loyalty re-calibration with a placebo, and PSO estimator/seed stability.

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
outputs/robustness/
```

Contains PCA, K-means stability, and sampling-bias sensitivity tables comparing the full analytical sample with samples excluding the most sampling-biased CBGs.

```text
outputs/item2_fit_sensitivity/
```

Contains fit-distribution and fit-stratified parameter-change tables.

```text
outputs/item3_format_disaggregation/
```

Contains the store→format (NAICS) mapping, per-format CBG samples, and by-format PSO calibration results.

```text
outputs/item4_chain_loyalty/
```

Contains mechanical-concentration diagnostics, the lagged-loyalty PSO results (pooled and by format), and the 2019 placebo check.

```text
outputs/item5_pso_stability/
```

Contains the full record of the 12,000 seeded PSO runs and the estimator-stability report.

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

For the store-format disaggregation robustness check, `data/processed/nyc-poi-info.csv` links each SafeGraph `safegraph_place_id` to its NAICS code, brand, and top/sub category, allowing stores to be split into department stores (NAICS 452210) and general merchandise stores (NAICS 452319).

## Citation

Please cite this research and repository as:
**APA:**
> Xu, Y., Bahrami, M., & Pentland, Alex. Customer Behavioral Shifts as a Result of the COVID-19 Pandemic: Are They “Sticky”? [SocArXiv](https://osf.io/preprints/socarxiv/jk7q9_v1)

**BibTeX:**
```bibtex
@article{xucustomer,
  title={Customer Behavioral Shifts as a Result of the COVID-19 Pandemic: Are They “Sticky”?},
  author={Xu, Yilun and Bahrami, Mohsen and Pentland, Alex},
  publisher={OSF}
}
```

## License

Code in this repository is released for academic and research use. Data files are provided for reproducibility of the associated research project and should be used in accordance with the terms of the original data sources.

A formal license file should be consulted before reuse.


