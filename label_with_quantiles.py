#First few lines from first_hundred_lines.tsv
// 75
// 85
// 44
// 63
// 27


#first few lines from q4_data.tsv
25
27
40
2

#output should look likethis:

75.0	q3	q3 (50.50, 75.25]
85.0	q4	q4 (75.25, 100.00]
44.0	q2	q2 (25.75, 50.50]
63.0	q3	q3 (50.50, 75.25]
27.0	q2	q2 (25.75, 50.50]

import sys

import pandas as pd

def group_in_quantiles(data, num_quantiles):
    quantiles, bins = pd.qcut(data, num_quantiles, labels=[f'q{i+1}' for i in range(num_quantiles)], retbins=True)
    for value, quantile in zip(data, quantiles):
        bin_range = f"({bins[quantiles.codes[quantiles == quantile][0]]:.2f}, {bins[quantiles.codes[quantiles == quantile][0] + 1]:.2f}]"
        print(f"{value}\t{quantile}\t{quantile} {bin_range}")

data = [float(line.strip()) for line in sys.stdin.readlines()]
num_quantiles = int(sys.argv[1])
group_in_quantiles(data, num_quantiles)
