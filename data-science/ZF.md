## Github Skills

- [Move &amp; Re-Name Files in Github (only possible on Desktop-Version of the Github-Webseite!)](https://github.blog/2013-03-15-moving-and-renaming-files-on-github/)

## My Python Skills

### Install a Package via `Pip` in a Jupyter Notebook

- [Type in the following Code inside a Cell on your currently used Jupyter Notebook (0:58-1:27)](https://www.youtube.com/watch?v=OJvnUQrPluE&t=0m58s)

### Create a Virtual environment

1) [The Command that you need to type in on your terminal (1:32-2:35)](https://www.youtube.com/watch?v=4jt9JPoIDpY&t=1m32s)
2) [Activate a virtual environment when you want to start working on it right away OR in a later point in time | Mac &amp; Windows Option (3:18-5:47)](https://www.youtube.com/watch?v=4jt9JPoIDpY&t=3m18s)
3) [De-Activate the virtual environment (5:48-6:24](https://www.youtube.com/watch?v=4jt9JPoIDpY&t=5m48s)

## Python Codes - Useful "Tricks"

### View Dataset - How to display all Columns and not skip the Middle Part when Viewing the Ddset

When viewing large ddsets with `dd.head()`, the problem is that it will not display all the colums. However, you can change this default-behavior by using only one  simple line of code:

```
pd.set_option(‘display.max_columns’, None)
houses.head() # check if it worked? --> Note: it must be a large ddset, otherwise you may not see how the default-behavior gets over-written.
```

> How to revert back to the default-behavior?

```
pd.reset_option(‘display.max_columns’)
```

> Custom number of columns shown?

You can tweak the number of default rows shown:

```
pd.set_option(‘display.max_rows’, 5)
```

> In combination with the `plotly`-package?

Note that you need to have `plotly` installed to be able to do this:

```
pd.set_option(‘plotting.backend’, ‘plotly’)
```

- <ins>Quelle</ins>: [Hier](https://towardsdev.com/tricks-and-best-practices-from-kaggle-794a5914480f)

### Data Exploration - Make a (Lower Triangular) Correlation Matrix

```
houses = pd.read_csv('data/melb_data.csv')

# Calculate pairwise-correlation
matrix = houses.corr()

# Create a mask
mask = np.triu(np.ones_like(matrix, dtype=bool))

# Create a custom diverging palette
cmap = sns.diverging_palette(250, 15, s=75, l=40,
                             n=9, center="light", as_cmap=True)

plt.figure(figsize=(16, 12))

sns.heatmap(matrix, mask=mask, center=0, annot=True,
             fmt='.2f', square=True, cmap=cmap)

plt.show();
```

> What does the correlation matrix do?

**It shows the _pairwise_ correlation between your different variables.**

> Why do you need a correlation matrix?

To get a **quick overview** of how all your columns are pairwisely correlated with each other. It helps to do _feature engineering_.

> Why should it be lower-triangular?

Because a correlation matrix is **symmetrical along the main diagonal**, you only need the lower triangular. Also, since the diagonal only shows the correlation of a feature with itself (e.g. always shows a correlation of 1), we don't need the diagonal, but *only the lower-diagonal*. 😄

- <ins>Quelle</ins>: [Hier](https://towardsdev.com/tricks-and-best-practices-from-kaggle-794a5914480f)

### Data Cleaning for Missing Values - Display proportion of Missing Values across all Columns of a Ddset

```
missing_props = houses.isna().sum() / len(houses)
missing_props[missing_props > 0].sort_values(ascending=False
```

> Why you should always display the proportion of missings in a column?

By knowing the proportion of the missing values, you can make a decision as to **whether to drop or impute values for a column with missing values**.

- <ins>Quelle</ins>: [Hier](https://towardsdev.com/tricks-and-best-practices-from-kaggle-794a5914480f)
