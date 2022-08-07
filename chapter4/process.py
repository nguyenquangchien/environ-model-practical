import pandas as pd


def meanmaxw(filename:str):
    df = pd.read_csv(filename, delim_whitespace=True)
    df_wind = df.iloc[:, 9]
    df_wind.replace(-999, pd.NA, inplace=True)
    df_wind = df_wind.transform(lambda x: 0.515 * x)
    return df_wind.mean(), df_wind.max()


if __name__ == '__main__':
    wmean, wmax = meanmaxw('wind98le.dat')
    print(f'Mean wind speed: {wmean:3.1f} m/s\n',
          f'Max wind speed: {wmax:4.1f} m/s')
    
