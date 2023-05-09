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

ln -s  ambra_config.yaml ARMOR/config.yaml
ln -s metadata.tsv ARMOR/metadata.tsv
cd ARMOR

mkdir -p ../armor_output

source ~/miniconda3/bin/activate

nice -n 19 snakemake -s Snakefile --use-conda --configfile config.yaml --cores 50
