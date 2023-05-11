#!/bin/bash
##
## Runs ARMOR on SRP281230 (not present in recount3)
##
## 11th May 2023
## Izaskun Mallona

WD=~/avillani_microglia

cd $WD

git clone https://github.com/csoneson/ARMOR.git

mv ARMOR/config.yaml{,.original}

cd ARMOR

ln -s  ../config_mcquade.yaml config_mcquade.yaml
ln -s ../metadata_mcquade_only.tsv metadata_mcquade_only.tsv


mkdir -p ../mcquade_trem_only_output

source ~/miniconda3/bin/activate

# mamba install -c conda-forge -c bioconda  snakemake

nice -n 19 snakemake -s Snakefile --use-conda --configfile config_mcquade.yaml --cores 50
