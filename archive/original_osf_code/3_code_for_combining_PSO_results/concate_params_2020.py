import pandas as pd
import os

directory = 'norm_PSO_combination_2020'
folders = os.listdir(directory)
folders = [i for i in folders if '_PSO_' in i if 'norm_' in i]
print(len(folders), 'choices')


def process_one_choice(choice_here):
    subs_path = directory + '/' + choice_here + '/sub'
    subs = os.listdir(subs_path)
    subs = [subs_path + '/'+s for s in subs if '.csv' in s]
    if len(subs) > 0:
        data_temp = [pd.read_csv(s) for s in subs]
        df_temp = pd.concat(data_temp)

        print(str(df_temp.shape[0]) + ' rows')
        print(str(df_temp['cbg'].nunique()) + ' cbgs')
        
        df_temp.to_csv(directory + '/' + choice_here + '/PSO_2020_6params_NYC_' + choice_here + '.csv', index = False)
        
        print(choice_here + ' finished!')
        print('-------------')


for f in folders:
	process_one_choice(f)

