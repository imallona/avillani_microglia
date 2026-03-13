## Aim

Bulk RNA-seq, Ambra Villani's in-house microglia iPSC-derived cultures (and engineered Slc37a2 and TREM2) plus public bulk RNA-seq data.

## Availability

- Raw sequencing  (fastq) and processed data (counts and others): https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE324751
- Preprint https://www.biorxiv.org/content/10.1101/2025.08.27.672578v2
- Zenodo snapshot https://zenodo.org/records/18997850
- Semi-private mirror: https://gitlab.uzh.ch/izaskun.mallona/avillani_microglia

## Methods

Inhouse RNA-seq and McQuade's TREM (PMID 31088905) raw reads were processed with ARMOR (PMC6643886). Reads were aligned and counted using the human genome GRCh38 assembly and Gencode release 43 annotation with salmon v1.4.0 and with STAR 2.7.7a. We downloaded Abud's and iPSCs data from the Sequence Read Archive (SRA) accessions SRP092075 and SRP155574, respectively, using recount3 (PMID 34844637) and GRCh38 as reference genome and Gencode's annotation. We modelled the salmon-generated inhouse count data with quasi-likelihood (QL) negative binomial generalized log-linear models and ran differential expression analysis with edgeR v3.36.0 using salmon outputs. 

We generated multi-dimensional scaling (MDS) plots based on normalized count data using edgeR v3.36.0. Briefly, MDS plots depict similarities between samples (including replicates and batches) in an unsupervised manner, depicting the two leading fold-change dimensions which explain the largest proportion of variation in gene expression across samples. Batch correction was performed using ComBat from the R package `sva` v3.42.0 using the origin (Abud's or inhouse) as batch.

Gene expression plots depict logCPMs as calculated by edgeR's `cpm(assay(x, 'counts'), log = TRUE,  prior.count = 2)` or scaled and centered logCPMs, as reported in figure legends.

Geneset enrichment analysis were run using camera from limma v3.50.3 (PMC3458527) and mSigDB annotations on differentially expressed genes as reported by edgeR. Selected genesets included: C2, curated gene sets from online pathway databases, publications in PubMed, and knowledge of domain experts; C5, Gene Ontology; and C8, cell type signatures.

### Note on methods

We processed McQuade's datasets - not sure these are part of the paper, **remove references to McQuade's if not**.

## Data

Public data: selected accessions from (see `00_get_data/00_get_data.sh` heredocs):

### GSE117829

> Abud EM, Ramirez RN, Martinez ES, Healy LM et al. iPSC-Derived Human Microglia-like Cells to Study Neurological Diseases. Neuron 2017 Apr 19;94(2):278-293.e9. PMID: 28426964

### GSE157652 

> McQuade A, Kang YJ, Hasselmann J, Jairaman A et al. Gene expression and functional deficits underlie TREM2-knockout microglia responses in human models of Alzheimer's disease. Nat Commun 2020 Oct 23;11(1):5370. PMID: 33097708

### GSE117829

> McQuade A, Coburn M, Tu CH, Hasselmann J et al. Development and validation of a simplified method to generate human microglia from pluripotent stem cells. Mol Neurodegener 2018 Dec 22;13(1):67. PMID: 30577865


## Tasks

- [x] Download fastqs
- [x] Write experimental design config files
- [x] Run ARMOR
  - [ ] Run extra DEG, if needed
- [x] Deploy iSEE
- [x] Meet and iterate (ongoing)

## Results

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pretium accumsan felis. 

### Apps

- http://imlspenticton.uzh.ch:3740/ambra_villani_microglia_only_2023/
- http://imlspenticton.uzh.ch:3740/ambra_villani_microglia_plus_abud_2023/
- http://imlspenticton.uzh.ch:3740/ambra_villani_microglia_plus_abud_and_mcquade_2023/

### Reports

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pretium accumsan felis. 

Some are open in penticton, e.g. http://imlspenticton.uzh.ch/imallona/avillani/03_custom/.

## Contact/questions

- Wet: ambra.villani aT mls.uzh.ch
- Dry: izaskun.mallona At mls.uzh.ch

## Log

Started Tue May  9 08:45:47 AM CEST 2023
