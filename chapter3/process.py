import pandas as pd


def selcol(filename:str):
    df = pd.read_csv(filename, delim_whitespace=True)
    df.iloc[:,8] = df.iloc[:,8]/10.0
    return df.iloc[:, [3, 4, 5, 6, 8]]


def selcol2(filename:str):
    df = pd.read_csv(filename, delim_whitespace=True, header='infer')
    df.iloc[:,8] = df.iloc[:,8]/10.0
    return df.iloc[:, [3, 4, 5, 6, 8]]


def selcol3(filename:str):
    df = pd.read_csv(filename, delim_whitespace=True, header='infer')
    df.iloc[:,8] = df.iloc[:,8]/10.0
    pd.set_option('display.precision', 5)
    return df.iloc[:, [3, 4, 5, 6, 8]]


if __name__ == '__main__':
    print(selcol('rain98le.dat'))
    print(selcol2('rain98le.dat'))
    print(selcol3('rain98le.dat'))
