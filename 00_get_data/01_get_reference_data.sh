#!/bin/bash
##
## Gencode, release 43 / assembly GRCh38
##
## 09th May 2023
## Izaskun Mallona

mkdir -p ~/indices
cd $_

wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_43/gencode.v43.primary_assembly.annotation.gtf.gz

wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_43/GRCh38.p13.genome.fa.gz

wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_43/gencode.v43.pc_transcripts.fa.gz

gunzip *gz
