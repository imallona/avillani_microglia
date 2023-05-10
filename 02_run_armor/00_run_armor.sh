#!/bin/bash
##
## Runs ARMOR on in-house and public data
##
## 9th May 2023
## Izaskun Mallona

WD=~/avillani_microglia

cd $WD

git clone https://github.com/csoneson/ARMOR.git

mv ARMOR/config.yaml{,.original}

cd ARMOR

ln -s  ../ambra_config.yaml config.yaml
ln -s ../metadata_ambra_only.tsv metadata_ambra_only.tsv


mkdir -p ../ambra_only_output

source ~/miniconda3/bin/activate

# mamba install -c conda-forge -c bioconda  snakemake

nice -n 19 snakemake -s Snakefile --use-conda --configfile config.yaml --cores 50
