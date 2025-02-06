## Aim

Bulk RNA-seq, Ambra Villani's in-house microglia iPSC-derived cultures (and engineered Slc37a2 and TREM2) plus public bulk RBNA-seq data.

## Methods

Inhouse RNA-seq raw reads were processed with ARMOR (https://pmc.ncbi.nlm.nih.gov/articles/PMC6643886/) and Abud's data retrieved using recount3 (cite) from SRP092075. Reads were aligned and counted using the human genome GRCh38 assembly and Gencode release 43 annotation with salmon v1.4.0 and with STAR 2.7.7a. We modelled the salmon-generated count data with quasi-likelihood (QL) negative binomial generalized log-linear models and ran differential expression analysis with edgeR v3.36.0. Batch correction was performed using ComBat from the R package `sva` v3.42.0 using the origin (Abud's or inhouse) as batch.

Gene expression plots depict logCPMs as calculated by edgeR's `cpm(assay(x, 'counts'), log = TRUE,  prior.count = 2)` or scaled and centered logCPMs, as depicted within figure legends.

Geneset enrichment analysis were run using camera from limma v3.50.3 (PMID PMC3458527) and mSigDB annotations on differentially expressed genes as reported by edgeR. Selected genesets included: C2, curated gene sets from online pathway databases, publications in PubMed, and knowledge of domain experts; C5, Gene Ontology; and C8, cell type signatures.

### Note on methods

We processed McQuade's datasets - not sure these are part of the paper.

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
