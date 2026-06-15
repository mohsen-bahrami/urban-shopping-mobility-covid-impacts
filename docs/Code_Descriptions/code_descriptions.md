# Code Description

In this file, you can read over the code files to see the logic of this project. The numbers in the file names reflect the order of the different files during the project. We have same procedure for data within any period, so we put the latest code we developed for 2020 here. 

## A. Code for Extracting Information
We will need to extract information for each of the four years from 2018~2021. The code is exactly the same except for the years and one differences from the original data: we can use safegraph_place_id to extract POIs before 2021 and we need to use placekey in 2021. We put the code for 2020 and 2021 here as examples.
1.	`1_Filtering_Data_2020.ipynb`, `1_ading Dec_2020.ipynb; 1_Filtering_Data_2021.ipynb`: filter the foot traffic patterns data we need from SafeGraph.
2.	`2_Creating_Matrix_NYC_2020.ipynb`; `2_Creating_Matrix_NYC_2021.ipynb`: we want to create the visits data before we start creating the table.
3.	`3_Creating_final_table_NYC_2020.ipynb`; `3_Creating_final_table_NYC_2020.ipynb`: create the table that will be put in Particle swarm optimization (PSO).

The inputs are data from `data/1_data_for_extracting_information`, and the outputs will be the 4 files under `data/2_data_for_PSO_Calibration`.


## B. Code for PSO Calibration
4.	`4_4_PSO_2018_NYC_norm_2_PSO_30.py`, `4_4_PSO_2018_NYC_norm_2_PSO_30.sbatch`: example code for running PSO. There are several lines in the .py file together with the sbatch file that are working on the large-scale computing part. Based on these two files, we create the code of each normalization and PSO combination for each year. Since the sbatch file shows settings of the server and the paper review is anonymous, we don’t share the sbatch code. Please contact us if you need it.

5.	2018/2019/2020/2021

  * a. `generate_code_file_2018/2019/2020/2021.ipynb`: this file is to generate code of the 288 combinations and the txt.file to submit these jobs to a server.
  * b. `sbatches_commands_20182019/2020/2021.txt`: this txt file is used to submit the 288 jobs to a server.
  * c. `sub_code`: this folder is to store the code for each combination. Since these follow almost same structure as the templates (`4_4_PSO_2018_NYC_norm_2_PSO_30.py` and `4_4_PSO_2018_NYC_norm_2_PSO_30.sbatch`), we don’t upload this folder. Please contact us if you need it.

The inputs are the 4 tables under `data/2_data_for_PSO_calibration`, and the outputs will be the calibration results obtained by each core on the server.  To make the folder less messy, we only put the aggregated results of 6493 CBGs for each combination in each year under each folder in data/3_PSO_results/PSO_calirabtion_results. The code will be provided in code/3_code_for_combining_PSO_results.


## C. Code for Combing PSO Results
6.	`concate_params_2018/2019/2020/2021.py`: these files are to combine the results obtained by each core on the server for each combination of each year into an aggregated one.
7.	`compute_errors_2018/2019/2020/2021.py.ipynb`: these code files are to compute the average/median costs for each combination of each year as matrices.
The inputs of this folder are the calibrated results from each core on the server, and the outputs will be the results for each combination of each year in `data/3_PSO_results/PSO_calirabtion_results`, and the average/median cost matrices of each year in `data/3_PSO_results/simulated_annealing_data_2018~2021`.

## D. Code fpr Main Analysis
8.	`1_distribution_visualization_by_year.ipynb`: this file is to visualize the yearly distributions from 2018 to 2021 for the calibrated parameter values.
9.	`2_test_valid_changes_with_ks.ipynb`: this file is to conduct Kolmogorov–Smirnov tests on the calibrated parameter values.
10.	`3_population_param_changes_2019~2021.ipynb`: this file is to visualize the general comparisons between the calibrated parameters of year pairs.
11.	`4_top SES_param_changes_all.ipynb`: this file is to visualize the comparisons in CBGs where a single socio-economic feature ranks top 5% with the calibrated parameters of year pairs.
12.	`5_top SES changes_param_distributions_delta VS population_as_of_2021.ipynb`: this file is to visualize the comparisons in CBGs where a single socio-economic feature ranks top 5% with all residents in NYC using the delta values (as of 2020 and 2021 separately).
13.	`6_descriptive_comparison_store_pairs.ipynb`: this file is to pick ground truths of some chains to validate our analysis results.
14.	`7_descriptive_comparison_uni-dimension_figures.ipynb`: this file is to visualize the relationship between store area and store visit shares across the 4 years.
15.	`8_clusters_param_distributions_all.ipynb`: this file is to visualize the comparisons in each cluster identified by Kmeans with the calibrated parameters of year pairs.
16.	`9_clusters_param_distributions_delta VS population_as_of_2021.ipynb`: this file is to visualize the comparisons in each cluster identified by Kmeans with all residents in NYC using the delta values (as of 2020 and 2021 separately).
17.	`10_DID.ipynb`: This file is to conduct the DID model.
18.	`11_general_change_with_top_clusters.ipynb`: this file is to get some numerical results describing the general changes in all residents, top 5% groups, and Kmeans clusters.
19.	`12_model_performance_analysis.ipynb`: this file is to analyze the performance of the proposed model in this study.
