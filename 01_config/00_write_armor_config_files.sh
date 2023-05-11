#!/bin/bash
##
## Ambra Villani's RNA-seq experimental design
##
## 9th May 2023
## Izaskun Mallona

# Tasks:
# 1. Compare Ambra's WT to Abud's and McQuade's TREM and iPSC by (sub)treatment
# 2. Compare Ambra's mutants to Ambra's WTs
#  - Double check BAM files to see if they're mutant
# 3. Compare Ambra's mutants to McQuade TREM2 KOs 
#   - Lipid metabolism / GO enrich, check the appropriate MSigDB annotation
 

# that is

WD=~/avillani_microglia

cd $WD


TAB="$(printf '\t')"

cat << EOF > metadata.tsv
names${TAB}type${TAB}treatment${TAB}batch${TAB}mutation
SRR4450428${TAB}PE${TAB}iPSC_MG_(Abud)${TAB}abud${TAB}WT
SRR4450429${TAB}PE${TAB}iPSC_MG_(Abud)${TAB}abud${TAB}WT
SRR4450430${TAB}PE${TAB}iPSC_MG_(Abud)${TAB}abud${TAB}WT
SRR4450431${TAB}PE${TAB}iPSC_MG_(Abud)${TAB}abud${TAB}WT
SRR4450432${TAB}PE${TAB}iPSC_MG_(Abud)${TAB}abud${TAB}WT
SRR4450433${TAB}PE${TAB}iPSC_MG_(Abud)${TAB}abud${TAB}WT
SRR4450434${TAB}PE${TAB}iHPC_(Abud)${TAB}abud${TAB}WT
SRR4450435${TAB}PE${TAB}iHPC_(Abud)${TAB}abud${TAB}WT
SRR4450436${TAB}PE${TAB}iHPC_(Abud)${TAB}abud${TAB}WT
SRR4450437${TAB}PE${TAB}iPSC_(Abud)${TAB}abud${TAB}WT
SRR4450438${TAB}PE${TAB}iPSC_(Abud)${TAB}abud${TAB}WT
SRR4450439${TAB}PE${TAB}iPSC_(Abud)${TAB}abud${TAB}WT
SRR4450440${TAB}PE${TAB}iPSC_(Abud)${TAB}abud${TAB}WT
SRR4450441${TAB}PE${TAB}CD14_M_(Abud)${TAB}abud${TAB}WT
SRR4450442${TAB}PE${TAB}CD14_M_(Abud)${TAB}abud${TAB}WT
SRR4450443${TAB}PE${TAB}CD14_M_(Abud)${TAB}abud${TAB}WT
SRR4450444${TAB}PE${TAB}CD14_M_(Abud)${TAB}abud${TAB}WT
SRR4450445${TAB}PE${TAB}CD14_M_(Abud)${TAB}abud${TAB}WT
SRR4450446${TAB}PE${TAB}CD16_M_(Abud)${TAB}abud${TAB}WT
SRR4450447${TAB}PE${TAB}CD16_M_(Abud)${TAB}abud${TAB}WT
SRR4450448${TAB}PE${TAB}CD16_M_(Abud)${TAB}abud${TAB}WT
SRR4450449${TAB}PE${TAB}CD16_M_(Abud)${TAB}abud${TAB}WT
SRR4450450${TAB}PE${TAB}Fetal_MG_(Abud)${TAB}abud${TAB}WT
SRR4450451${TAB}PE${TAB}Fetal_MG_(Abud)${TAB}abud${TAB}WT
SRR4450452${TAB}PE${TAB}Fetal_MG_(Abud)${TAB}abud${TAB}WT
SRR4450453${TAB}PE${TAB}Adult_MG_(Abud)${TAB}abud${TAB}WT
SRR4450454${TAB}PE${TAB}Adult_MG_(Abud)${TAB}abud${TAB}WT
SRR4450455${TAB}PE${TAB}Adult_MG_(Abud)${TAB}abud${TAB}WT
SRR4450456${TAB}PE${TAB}Blood_DC_(Abud)${TAB}abud${TAB}WT
SRR4450457${TAB}PE${TAB}Blood_DC_(Abud)${TAB}abud${TAB}WT
SRR12608405${TAB}PE${TAB}iPSC_MG_WT_(McQuade)${TAB}mccquade_trem2${TAB}WT
SRR12608406${TAB}PE${TAB}iPSC_MG_WT_(McQuade)${TAB}mccquade_trem2${TAB}WT
SRR12608407${TAB}PE${TAB}iPSC_MG_WT_(McQuade)${TAB}mccquade_trem2${TAB}WT
SRR12608408${TAB}PE${TAB}iPSC_MG_WT_(McQuade)${TAB}mccquade_trem2${TAB}WT
SRR12608409${TAB}PE${TAB}iPSC_MG_TREM2_KO_(McQuade)${TAB}mccquade_trem2${TAB}TREM2_KO
SRR12608410${TAB}PE${TAB}iPSC_MG_TREM2_KO_(McQuade)${TAB}mccquade_trem2${TAB}TREM2_KO
SRR12608411${TAB}PE${TAB}iPSC_MG_TREM2_KO_(McQuade)${TAB}mccquade_trem2${TAB}TREM2_KO
SRR12608412${TAB}PE${TAB}iPSC_MG_TREM2_KO_(McQuade)${TAB}mccquade_trem2${TAB}TREM2_KO
SRR7613924${TAB}iPSC_MG_2.0_(McQuade)${TAB}PE${TAB}mccquade_ipsc${TAB}WT
SRR7613925${TAB}PE${TAB}iPSC_MG_2.0_(McQuade)${TAB}mccquade_ipsc${TAB}WT
SRR7613926${TAB}PE${TAB}iPSC_MG_2.0_(McQuade)${TAB}mccquade_ipsc${TAB}WT
SRR8180288${TAB}PE${TAB}iHPC_2.0_(McQuade)${TAB}mccquade_ipsc${TAB}WT
SRR8180289${TAB}PE${TAB}iHPC_2.0_(McQuade)${TAB}mccquade_ipsc${TAB}WT
SRR8180290${TAB}PE${TAB}iHPC_2.0_(McQuade)${TAB}mccquade_ipsc${TAB}WT
20220209.A_av111_WT_001_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT
20220209.A_av111_WT_002_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT
20220209.A_av111_WT_003_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT
20220209.A_tw029_WT_2_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT
20220209.A_tw029_WT_3_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT
20220504.B_WTC_1_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT
20220504.B_WTC_2_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT
20220504.B_SLC_EX2B1_1_R1${TAB}SE${TAB}iPSC_MG_Slc37a2_(mut1)${TAB}ambra${TAB}Slc37a2
20220504.B_SLC_EX2B1_2_R1${TAB}SE${TAB}iPSC_MG_Slc37a2_(mut1)${TAB}ambra${TAB}Slc37a2
20220504.B_SLC_EX6C5_1_R1${TAB}SE${TAB}iPSC_MG_Slc37a2_(mut2)${TAB}ambra${TAB}Slc37a2
20220504.B_SLC_EX6C5_2_R1${TAB}SE${TAB}iPSC_MG_Slc37a2_(mut2)${TAB}ambra${TAB}Slc37a2
20220504.B_TREM2_A1_1_R1${TAB}SE${TAB}iPSC_MG_TREM2_mut${TAB}ambra${TAB}WT${TAB}TREM2
20220504.B_TREM2_A1_2_R1${TAB}SE${TAB}iPSC_MG_TREM2_mut${TAB}ambra${TAB}WT${TAB}TREM2
EOF


cat << EOF > metadata_ambra_only.tsv
names${TAB}type${TAB}treatment${TAB}batch${TAB}mutation${TAB}timepoint
20220209.A-av111_WT_001_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT${TAB}34
20220209.A-av111_WT_002_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT${TAB}34
20220209.A-av111_WT_003_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT${TAB}34
20220209.A-tw029_WT_2_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT${TAB}38
20220209.A-tw029_WT_3_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT${TAB}38
20220504.B-WTC_1_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT${TAB}28
20220504.B-WTC_2_R1${TAB}SE${TAB}iPSC_MG${TAB}ambra${TAB}WT${TAB}28
20220504.B-SLC-EX2B1_1_R1${TAB}SE${TAB}iPSC_MG_Slc37a2_mut1${TAB}ambra${TAB}Slc37a2${TAB}28
20220504.B-SLC-EX2B1_2_R1${TAB}SE${TAB}iPSC_MG_Slc37a2_mut1${TAB}ambra${TAB}Slc37a2${TAB}28
20220504.B-SLC-EX6C5_1_R1${TAB}SE${TAB}iPSC_MG_Slc37a2_mut2${TAB}ambra${TAB}Slc37a2${TAB}28
20220504.B-SLC-EX6C5_2_R1${TAB}SE${TAB}iPSC_MG_Slc37a2_mut2${TAB}ambra${TAB}Slc37a2${TAB}28
20220504.B-TREM2-A1_1_R1${TAB}SE${TAB}iPSC_MG_TREM2_mut${TAB}ambra${TAB}TREM2${TAB}28
20220504.B-TREM2-A1_2_R1${TAB}SE${TAB}iPSC_MG_TREM2_mut${TAB}ambra${TAB}TREM2${TAB}28
EOF

# these are human

cat <<EOF > ambra_config.yaml
## Important note:
## All paths defined in this configuration file must be either absolute or relative to the 
## location of the Snakefile!

## Reference annotation details
##--------------------------------------------------------------------------------------------
## Specify "Ensembl" or "Gencode" depending on your choice
annotation: Gencode

organism: Homo_sapiens # separate with underscore
build: GRCh38
release: 43
##--------------------------------------------------------------------------------------------


## Paths to existing reference files 
##--------------------------------------------------------------------------------------------
txome: /home/imallona/indices/gencode.v43.pc_transcripts.fa
genome: /home/imallona//indices/GRCh38.p13.genome.fa
gtf: /home/imallona/indices/gencode.v43.primary_assembly.annotation.gtf


##--------------------------------------------------------------------------------------------


## Paths to indexes that will be generated by the workflow
##--------------------------------------------------------------------------------------------
salmonindex: ./reference/SalmonIndex/Homo_sapiens.GRCh38.gencode38
salmonk: 31
STARindex: ./reference/STARIndex/Homo_sapiens.GRCh38.gencode38
##--------------------------------------------------------------------------------------------

## Additional STAR parameters
## Here, you can specify any optional parameters for the index building and/or alignment 
## with STAR. The following arguments are automatically populated and should NOT be 
## specified here:
## Indexing: runMode, runThreadN, genomeDir, genomeFastaFiles, sjdbGTFfile, sjdbOverhang
## Alignment: runMode, genomeDir, readFilesIn, runThreadN, outFileNamePrefix, outSAMtype, readFilesCommand
##--------------------------------------------------------------------------------------------
## Add or remove parameters inside the ""
additional_star_index: ""
additional_star_align: ""

## Additional Salmon parameters
## Here, you can specify any optional parameters for the index building and/or 
## abundance quantification with Salmon. The following arguments are automatically populated 
## based on the arguments specified elsewhere, and should NOT be specified here:
## Indexing: transcriptome input file, index directory, gencode flag
## Quantification: library type, fastq files, index directory, output directory, number of cores
##--------------------------------------------------------------------------------------------
## Add or remove parameters inside the ""
additional_salmon_index: "-k 31"

## Add or remove parameters inside the ""
## We specify the mean and standard deviation of the fragment length distribution, for use with Salmon. 
## This is important to specify for single-end reads.
## For paired-end reads, these values will define the prior, which is then updated 
## based on the observed fragment lengths.
additional_salmon_quant: "--seqBias --gcBias --fldMean 250 --fldSD 25"
##--------------------------------------------------------------------------------------------


## Information about the experiment
##--------------------------------------------------------------------------------------------
readlength: 100

## Path to metadata text file. This file must contain at least the following columns:
## names: the sample identifiers = the names of the FASTQ files (excluding the _R1/R2.fastq.gz part)
## type: either SE or PE, indicating whether the sample was analyzed 
## via single-end or paired-end sequencing.
metatxt: metadata_ambra_only.tsv

## Variables used for model fitting
## design: design formula for use with edgeR, camera and DRIMSeq. Must be a string 
## of the form "~ <predictors>"
## contrast: (comma-separated if multiple) list of contrasts to estimate in edgeR_dge.Rmd
design: "~ 0 + treatment"
## contrast: iPSC_MG_Slc37a2_mutant-iPSC_MG,iPSC_MG_TREM2_mut-iPSC_MG,iPSC_MG_Slc37a2_mutant-iPSC_MG_TREM2_mut,iPSC_MG_Slc37a2_mutant-iPSC_MG_TREM2_KO_(McQuade),iPSC_MG_TREM2_mut-iPSC_MG_TREM2_KO_(McQuade),iPSC_MG-iPSC_MG_(Abud),iPSC_MG-iHPC_(Abud),iPSC_MG-CD14_M_(Abud),iPSC_MG-CD14_M_(Abud),iPSC_MG-Fetal_MG_(Abud),iPSC_MG-Adult_MG_(Abud),iPSC_MG-Blood_DC_(Abud)
contrast: treatmentiPSC_MG_Slc37a2_mut1-treatmentiPSC_MG,treatmentiPSC_MG_Slc37a2_mut2-treatmentiPSC_MG,treatmentiPSC_MG_TREM2_mut-treatmentiPSC_MG,treatmentiPSC_MG_Slc37a2_mut1-treatmentiPSC_MG_TREM2_mut,treatmentiPSC_MG_Slc37a2_mut2-treatmentiPSC_MG_TREM2_mut,treatmentiPSC_MG_Slc37a2_mut2-treatmentiPSC_MG_Slc37a2_mut1
## Gene sets used for gene set analysis with camera
## Comma-separated list of gene set categories to test with camera. 
## Must be a subset of H,C1,C2,C3,C4,C5,C6,C7
## Only required if variable "run_camera: is True (see below).
genesets: H,C2,C3,C5

## The maximal number of cores to use for FastQC, STAR, Salmon and DRIMSeq.
## Note that the actual number of cores available to Snakemake is determined by
## the --cores argument when it is invoked.
ncores: 20
##---------------------------------------------------------------------------------------------


## Path to a folder containing gzipped fastq files, and the file suffix (typically, either fastq or fq). 
## If you have paired-end fastq files, you also need to define the extension distinguishing the two read files. 
## More precisely, ARMOR assumes that paired-end fastq files are named 
## <sample-name>_<fqext1>.<fqsuffix>.gz and <sample-name>_<fqext2>.<fqsuffix>.gz.
## Single-end fastq files are supposed to be named 
## <sample-name>.<fqsuffix>.gz.
##---------------------------------------------------------------------------------------------
FASTQ: /home/imallona/avillani_microglia/data
fqext1: R1
fqext2: R2
fqsuffix: fastq
##---------------------------------------------------------------------------------------------


## Path to a folder that will store the output generated by the workflow. 
## Additional subfolders of this folder will be generated by the workflow. 
## To put output in the current directory, set output to ".".
##---------------------------------------------------------------------------------------------
output: /home/imallona/avillani_microglia/ambra_only_output/
##---------------------------------------------------------------------------------------------

## R setup
##---------------------------------------------------------------------------------------------
## Specify "True" if R should be installed in a conda environment or "False" if you want to use 
## your own R installation (then you have to set the path to your library in the .Renviron file)
useCondaR: True
Rbin: R
##---------------------------------------------------------------------------------------------

## Conditional conda rules
##---------------------------------------------------------------------------------------------
## Should read trimming, STAR mapping, DRIMSeq analysis and gene set analysis be performed? Set
## to False if the step is not required.
run_trimming: True
run_STAR: True
run_DRIMSeq: False
run_camera: True
##---------------------------------------------------------------------------------------------
EOF





## same for McQuade's TREM study, SRP281230


cat << EOF > metadata_mcquade_only.tsv
names${TAB}type${TAB}treatment${TAB}batch${TAB}mutation
SRR12608405${TAB}PE${TAB}iPSC_MG_WT_(McQuade)${TAB}mccquade_trem2${TAB}WT
SRR12608406${TAB}PE${TAB}iPSC_MG_WT_(McQuade)${TAB}mccquade_trem2${TAB}WT
SRR12608407${TAB}PE${TAB}iPSC_MG_WT_(McQuade)${TAB}mccquade_trem2${TAB}WT
SRR12608408${TAB}PE${TAB}iPSC_MG_WT_(McQuade)${TAB}mccquade_trem2${TAB}WT
SRR12608409${TAB}PE${TAB}iPSC_MG_TREM2_KO_(McQuade)${TAB}mccquade_trem2${TAB}TREM2_KO
SRR12608410${TAB}PE${TAB}iPSC_MG_TREM2_KO_(McQuade)${TAB}mccquade_trem2${TAB}TREM2_KO
SRR12608411${TAB}PE${TAB}iPSC_MG_TREM2_KO_(McQuade)${TAB}mccquade_trem2${TAB}TREM2_KO
SRR12608412${TAB}PE${TAB}iPSC_MG_TREM2_KO_(McQuade)${TAB}mccquade_trem2${TAB}TREM2_KO
EOF


cat <<EOF > config_mcquade.yaml
## Important note:
## All paths defined in this configuration file must be either absolute or relative to the 
## location of the Snakefile!

## Reference annotation details
##--------------------------------------------------------------------------------------------
## Specify "Ensembl" or "Gencode" depending on your choice
annotation: Gencode

organism: Homo_sapiens # separate with underscore
build: GRCh38
release: 43
##--------------------------------------------------------------------------------------------


## Paths to existing reference files 
##--------------------------------------------------------------------------------------------
txome: /home/imallona/indices/gencode.v43.pc_transcripts.fa
genome: /home/imallona//indices/GRCh38.p13.genome.fa
gtf: /home/imallona/indices/gencode.v43.primary_assembly.annotation.gtf


##--------------------------------------------------------------------------------------------


## Paths to indexes that will be generated by the workflow
##--------------------------------------------------------------------------------------------
salmonindex: ./reference/SalmonIndex/Homo_sapiens.GRCh38.gencode38
salmonk: 31
STARindex: ./reference/STARIndex/Homo_sapiens.GRCh38.gencode38
##--------------------------------------------------------------------------------------------

## Additional STAR parameters
## Here, you can specify any optional parameters for the index building and/or alignment 
## with STAR. The following arguments are automatically populated and should NOT be 
## specified here:
## Indexing: runMode, runThreadN, genomeDir, genomeFastaFiles, sjdbGTFfile, sjdbOverhang
## Alignment: runMode, genomeDir, readFilesIn, runThreadN, outFileNamePrefix, outSAMtype, readFilesCommand
##--------------------------------------------------------------------------------------------
## Add or remove parameters inside the ""
additional_star_index: ""
additional_star_align: ""

## Additional Salmon parameters
## Here, you can specify any optional parameters for the index building and/or 
## abundance quantification with Salmon. The following arguments are automatically populated 
## based on the arguments specified elsewhere, and should NOT be specified here:
## Indexing: transcriptome input file, index directory, gencode flag
## Quantification: library type, fastq files, index directory, output directory, number of cores
##--------------------------------------------------------------------------------------------
## Add or remove parameters inside the ""
additional_salmon_index: "-k 31"

## Add or remove parameters inside the ""
## We specify the mean and standard deviation of the fragment length distribution, for use with Salmon. 
## This is important to specify for single-end reads.
## For paired-end reads, these values will define the prior, which is then updated 
## based on the observed fragment lengths.
additional_salmon_quant: "--seqBias --gcBias --fldMean 250 --fldSD 25"
##--------------------------------------------------------------------------------------------


## Information about the experiment
##--------------------------------------------------------------------------------------------
readlength: 100

## Path to metadata text file. This file must contain at least the following columns:
## names: the sample identifiers = the names of the FASTQ files (excluding the _R1/R2.fastq.gz part)
## type: either SE or PE, indicating whether the sample was analyzed 
## via single-end or paired-end sequencing.
metatxt: metadata_mcquade_only.tsv

## Variables used for model fitting
## design: design formula for use with edgeR, camera and DRIMSeq. Must be a string 
## of the form "~ <predictors>"
## contrast: (comma-separated if multiple) list of contrasts to estimate in edgeR_dge.Rmd
design: "~ 0 + treatment"
contrast: treatmentiPSC_MG_TREM2_KO_(McQuade)-treatmentiPSC_MG_WT_(McQuade)
## Gene sets used for gene set analysis with camera
## Comma-separated list of gene set categories to test with camera. 
## Must be a subset of H,C1,C2,C3,C4,C5,C6,C7
## Only required if variable "run_camera: is True (see below).
genesets: H,C2,C3,C5

## The maximal number of cores to use for FastQC, STAR, Salmon and DRIMSeq.
## Note that the actual number of cores available to Snakemake is determined by
## the --cores argument when it is invoked.
ncores: 20
##---------------------------------------------------------------------------------------------


## Path to a folder containing gzipped fastq files, and the file suffix (typically, either fastq or fq). 
## If you have paired-end fastq files, you also need to define the extension distinguishing the two read files. 
## More precisely, ARMOR assumes that paired-end fastq files are named 
## <sample-name>_<fqext1>.<fqsuffix>.gz and <sample-name>_<fqext2>.<fqsuffix>.gz.
## Single-end fastq files are supposed to be named 
## <sample-name>.<fqsuffix>.gz.
##---------------------------------------------------------------------------------------------
FASTQ: /home/imallona/avillani_microglia/data
fqext1: 1
fqext2: 2
fqsuffix: fastq
##---------------------------------------------------------------------------------------------


## Path to a folder that will store the output generated by the workflow. 
## Additional subfolders of this folder will be generated by the workflow. 
## To put output in the current directory, set output to ".".
##---------------------------------------------------------------------------------------------
output: /home/imallona/avillani_microglia/mcquade_trem_only_output/
##---------------------------------------------------------------------------------------------

## R setup
##---------------------------------------------------------------------------------------------
## Specify "True" if R should be installed in a conda environment or "False" if you want to use 
## your own R installation (then you have to set the path to your library in the .Renviron file)
useCondaR: True
Rbin: R
##---------------------------------------------------------------------------------------------

## Conditional conda rules
##---------------------------------------------------------------------------------------------
## Should read trimming, STAR mapping, DRIMSeq analysis and gene set analysis be performed? Set
## to False if the step is not required.
run_trimming: True
run_STAR: True
run_DRIMSeq: False
run_camera: True
##---------------------------------------------------------------------------------------------
EOF

