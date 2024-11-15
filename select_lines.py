#stdin= content_file 
# read using zcat q1_data.tsv.gz
// transcript_id(s)	gene_id	length	effective_length	expected_count	TPM	FPKM	posterior_mean_count	posterior_standard_deviation_of_count	pme_TPM	pme_FPKM	TPM_ci_lower_bound	TPM_ci_upper_bound	TPM_coefficient_of_quartile_variation	FPKM_ci_lower_bound	FPKM_ci_upper_bound	FPKM_coefficient_of_quartile_variation
// 10904	10904	93.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0	0	0
// 12954	12954	94.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0	0	0
// 12956	12956	72.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0	0	0
// 12958	12958	82.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0	0	0


# $1 = to_select_file.tsv
// ENSG00000180353.10
// ENSG00000180596.7
// ENSG00000266379.6
// ENSG00000262561.1
// ENSG00000284999.1

import sys


def pattern(file1):
    patterns = []
    with open(file1, 'r') as f:
        for line in f:
            stripped_line = line.strip()
            if stripped_line:
                patterns.append(stripped_line)
    return patterns

def match_lines(line, patterns):
    columns = line.strip().split('\t')  # Split by tabs
    return any(column in patterns for column in columns)

file1=sys.argv[1]
patterns= pattern(file1)

for line in sys.stdin:
    if match_lines(line,patterns):
        print(line, end=' ')
