#!/bin/bash
##
## 25th Apr 2025

:<<EOF
Request:

A last (I hope!) small request, which is however not essential. Would it be possible to have a test to check the difference of:

Slc37a2 transcript level: Slc37a2 mut 1 vs WT
Slc37a2 transcript level: Slc37a2 mut 2 vs WT
TREM2 transcript level: TREM2 mut vs WT
Not sure how meaningful with this amount of replicates, but I thought it could be interesting to have or at least know. What do you think?
EOF

cd 03_custom

## retrieving LFS data from the uzh gitlab, because github's is overquota
git-lfs pull --include edgeR_dge_results_treatmentiPSC_MG_TREM2_mut-treatmentiPSC_MG_all_ages.txt uzh
git-lfs pull --include edgeR_dge_results_treatmentiPSC_MG_Slc37a2_mut1-treatmentiPSC_MG_all_ages.txt uzh
git-lfs pull --include edgeR_dge_results_treatmentiPSC_MG_Slc37a2_mut2-treatmentiPSC_MG_all_ages.txt uzh


## Slc37a2 transcript level: Slc37a2 mut 1 vs WT
grep -i Slc37a2 edgeR_dge_results_treatmentiPSC_MG_Slc37a2_mut1-treatmentiPSC_MG_all_ages.txt 
## chr11	125063302	125090516	27215	+	ENSG00000134955.12	SLC37A2	SLC37A2	-1.63	8.21	31.2	9.33e-05	0.0559	4.03	SLC37A2

## Slc37a2 transcript level: Slc37a2 mut 2 vs WT
grep -i Slc37a2 edgeR_dge_results_treatmentiPSC_MG_Slc37a2_mut2-treatmentiPSC_MG_all_ages.txt 
## chr11	125063302	125090516	27215	+	ENSG00000134955.12	SLC37A2	SLC37A2	-3.37	8.21	104	1.62e-07	0.000303	6.79	SLC37A2

## TREM2 transcript level: TREM2 mut vs WT
grep -i TREM2 edgeR_dge_results_treatmentiPSC_MG_TREM2_mut-treatmentiPSC_MG_all_ages.txt 
## chr6	41158506	41163186	4681	-	ENSG00000095970.17	TREM2	TREM2	-1.37	8.25	38.5	3.43e-05	0.0147	4.47	TREM2

## and headers are
## seqnames	start	end	width	strand	gene_id	SYMBOL	gene_name	logFC	logCPM	F	PValue	FDR	mlog10PValue	simple_gene_name

:<<EOF
so results are:

- Slc37a2 transcript level: Slc37a2 mut 1 vs WT
down but not significantly with logFC -1.63, p-value of 9.33e-05 and (adjusted) FDR of 0.0559 

- Slc37a2 transcript level: Slc37a2 mut 2 vs WT
significantly down with logFC 	-3.37, p-value	1.62e-07 and (adjusted) FDR of 0.000303

- TREM2 transcript level: TREM2 mut vs WT
significantly down with logFC -1.37, p-value 3.43e-05 and (adjusted) FDR of	0.0147
EOF
