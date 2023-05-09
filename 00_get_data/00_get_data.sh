#!/bin/bash
##
## 09 May 2023
## Izaskun Mallona
##
## Retrieves RNA-seqs, with Ambra Villani


WD=~/avillani_microglia
SRA="/home/imallona/soft/sra/sratoolkit.3.0.1-ubuntu64/bin/"

mkdir -p $WD/data
cd $_

# Abud EM, Ramirez RN, Martinez ES, Healy LM et al.
# iPSC-Derived Human Microglia-like Cells to Study Neurological Diseases. Neuron 2017 Apr 19;94(2):278-293.e9. PMID: 28426964
# Series GSE117829

cat << EOF > abud.conf
iPSC_MG_(Abud),SRR4450428
iPSC_MG_(Abud),SRR4450429
iPSC_MG_(Abud),SRR4450430
iPSC_MG_(Abud),SRR4450431
iPSC_MG_(Abud),SRR4450432
iPSC_MG_(Abud),SRR4450433
iHPC_(Abud),SRR4450434
iHPC_(Abud),SRR4450435
iHPC_(Abud),SRR4450436
iPSC_(Abud),SRR4450437
iPSC_(Abud),SRR4450438
iPSC_(Abud),SRR4450439
iPSC_(Abud),SRR4450440
CD14_M_(Abud),SRR4450441
CD14_M_(Abud),SRR4450442
CD14_M_(Abud),SRR4450443
CD14_M_(Abud),SRR4450444
CD14_M_(Abud),SRR4450445
CD16_M_(Abud),SRR4450446
CD16_M_(Abud),SRR4450447
CD16_M_(Abud),SRR4450448
CD16_M_(Abud),SRR4450449
Fetal_MG_(Abud),SRR4450450
Fetal_MG_(Abud),SRR4450451
Fetal_MG_(Abud),SRR4450452
Adult_MG_(Abud),SRR4450453
Adult_MG_(Abud),SRR4450454
Adult_MG_(Abud),SRR4450455
Blood_DC_(Abud),SRR4450456
Blood_DC_(Abud),SRR4450457
Blood_DC_(Abud),SRR4450458
EOF

# McQuade A, Kang YJ, Hasselmann J, Jairaman A et al.
# Gene expression and functional deficits underlie TREM2-knockout microglia responses in human models of Alzheimer's disease.
#  Nat Commun 2020 Oct 23;11(1):5370. PMID: 33097708
# Series GSE157652 

cat << EOF > mcquade_trem2.conf
iPSC_MG_WT_(McQuade),SRR12608405,RNA-Seq,200,8208898600,PRJNA662330,SAMN16081313,3356654677,GEO,public,"fastq,sra,run.zq","s3,ncbi,gs","gs.US,ncbi.public,s3.us-east-1",SRX9091876,WT,GSM4772085,Illumina_HiSeq_4000,PAIRED,cDNA,TRANSCRIPTOMIC,Homo_sapiens,ILLUMINA,2020-09-09T00:00:00Z,2020-09-08T13:25:00Z,1,GSM4772085,Differentiated_in_vitro_from_iPSCs,SRP281230,None
iPSC_MG_WT_(McQuade),SRR12608406,RNA-Seq,200,10329688400,PRJNA662330,SAMN16081312,3968673561,GEO,public,"fastq,sra,run.zq","ncbi,s3,gs","s3.us-east-1,gs.US,ncbi.public",SRX9091877,WT,GSM4772086,Illumina_HiSeq_4000,PAIRED,cDNA,TRANSCRIPTOMIC,Homo_sapiens,ILLUMINA,2020-09-09T00:00:00Z,2020-09-08T13:29:00Z,1,GSM4772086,Differentiated_in_vitro_from_iPSCs,SRP281230,None
iPSC_MG_WT_(McQuade),SRR12608407,RNA-Seq,200,8766484200,PRJNA662330,SAMN16081311,3370939987,GEO,public,"run.zq,fastq,sra","ncbi,gs,s3","gs.US,ncbi.public,s3.us-east-1",SRX9091878,WT,GSM4772087,Illumina_HiSeq_4000,PAIRED,cDNA,TRANSCRIPTOMIC,Homo_sapiens,ILLUMINA,2020-09-09T00:00:00Z,2020-09-08T13:18:00Z,1,GSM4772087,Differentiated_in_vitro_from_iPSCs,SRP281230,None
iPSC_MG_WT_(McQuade),SRR12608408,RNA-Seq,200,8563295200,PRJNA662330,SAMN16081310,3294701237,GEO,public,"sra,run.zq,fastq","gs,s3,ncbi","ncbi.public,gs.US,s3.us-east-1",SRX9091879,WT,GSM4772088,Illumina_HiSeq_4000,PAIRED,cDNA,TRANSCRIPTOMIC,Homo_sapiens,ILLUMINA,2020-09-09T00:00:00Z,2020-09-08T13:15:00Z,1,GSM4772088,Differentiated_in_vitro_from_iPSCs,SRP281230,None
iPSC_MG_TREM2_KO_(McQuade),SRR12608409,RNA-Seq,200,9313877800,PRJNA662330,SAMN16081309,3584169709,GEO,public,"run.zq,fastq,sra","ncbi,s3,gs","gs.US,ncbi.public,s3.us-east-1",SRX9091880,KO,GSM4772089,Illumina_HiSeq_4000,PAIRED,cDNA,TRANSCRIPTOMIC,Homo_sapiens,ILLUMINA,2020-09-09T00:00:00Z,2020-09-08T13:37:00Z,1,GSM4772089,Differentiated_in_vitro_from_iPSCs,SRP281230,None
iPSC_MG_TREM2_KO_(McQuade),SRR12608410,RNA-Seq,200,10620709200,PRJNA662330,SAMN16081308,4055862457,GEO,public,"sra,fastq,run.zq","gs,s3,ncbi","ncbi.public,gs.US,s3.us-east-1",SRX9091881,KO,GSM4772090,Illumina_HiSeq_4000,PAIRED,cDNA,TRANSCRIPTOMIC,Homo_sapiens,ILLUMINA,2020-09-09T00:00:00Z,2020-09-08T13:43:00Z,1,GSM4772090,Differentiated_in_vitro_from_iPSCs,SRP281230,None
iPSC_MG_TREM2_KO_(McQuade),SRR12608411,RNA-Seq,200,9575394200,PRJNA662330,SAMN16081307,3690462303,GEO,public,"run.zq,fastq,sra","s3,gs,ncbi","ncbi.public,s3.us-east-1,gs.US",SRX9091882,KO,GSM4772091,Illumina_HiSeq_4000,PAIRED,cDNA,TRANSCRIPTOMIC,Homo_sapiens,ILLUMINA,2020-09-09T00:00:00Z,2020-09-08T13:22:00Z,1,GSM4772091,Differentiated_in_vitro_from_iPSCs,SRP281230,None
iPSC_MG_TREM2_KO_(McQuade),SRR12608412,RNA-Seq,200,9763439200,PRJNA662330,SAMN16081306,3920471218,GEO,public,"fastq,sra,run.zq","s3,ncbi,gs","ncbi.public,gs.US,s3.us-east-1",SRX9091883,KO,GSM4772092,Illumina_HiSeq_4000,PAIRED,cDNA,TRANSCRIPTOMIC,Homo_sapiens,ILLUMINA,2020-09-09T00:00:00Z,2020-09-08T13:19:00Z,1,GSM4772092,Differentiated_in_vitro_from_iPSCs,SRP281230,None
EOF


# McQuade A, Coburn M, Tu CH, Hasselmann J et al.
# Development and validation of a simplified method to generate human microglia from pluripotent stem cells.
# Mol Neurodegener 2018 Dec 22;13(1):67. PMID: 30577865
# Series GSE117829

cat << EOF > mcquade_ipsc.conf
SRR7613924,4916400000,1956222427,Differentiated_in_vitro_EGFP_iPS_line,sra,fastq,s3,s3.us-east-1,SRX4478491,GSM3309919,Differentiated_in_vitro_EGFP_iPS_line,SRP155574,,iPS-microglia2.0_no_sorting_1,iPSC_MG_2.0_(McQuade)
SRR7613925,19932120600,8012554398,Differentiated_in_vitro_EGFP_iPS_line,sra,fastq,s3,s3.us-east-1,SRX4478492,GSM3309920,Differentiated_in_vitro_EGFP_iPS_line,SRP155574,,iPS-microglia2.0_no_sorting_2,iPSC_MG_2.0_(McQuade)
SRR7613926,22666325400,9813820721,Differentiated_in_vitro_EGFP_iPS_line,sra,fastq,s3,s3.us-east-1,SRX4478493,GSM3309921,Differentiated_in_vitro_EGFP_iPS_line,SRP155574,,iPS-microglia2.0_no_sorting_3,iPSC_MG_2.0_(McQuade)
SRR8180288,10206793460,3669023139,Differentiated_in_vitro_EGFP_iPS_line,fastq,sra,s3,s3.us-east-1,SRX5000361,GSM3465679,Differentiated_in_vitro_EGFP_iPS_line,SRP155574,,IPS-HPC2.0_EGFP_1,iHPC_2.0_(McQuade)
SRR8180289,8951352440,3258337548,Differentiated_in_vitro_EGFP_iPS_line,fastq,sra,s3,s3.us-east-1,SRX5000362,GSM3465680,Differentiated_in_vitro_EGFP_iPS_line,SRP155574,,IPS-HPC2.0_EGFP_2,iHPC_2.0_(McQuade)
SRR8180290,9662263857,3454501000,Differentiated_in_vitro_EGFP_iPS_line,fastq,sra,s3,s3.us-east-1,SRX5000363,GSM3465681,Differentiated_in_vitro_EGFP_iPS_line,SRP155574,,IPS-HPC2.0_EGFP_3,iHPC_2.0_(McQuade)
EOF


# Ambra's data

cat << EOF > ambra.conf
WTC_EGFP_clone_6_iPSC-microglia,_day_34,20220209.A-av111_WT_001_R1.fastq,iPSC-MG,WT
WTC_EGFP_clone_6_iPSC-microglia,_day_34,20220209.A-av111_WT_002_R1.fastq,iPSC-MG,WT
WTC_EGFP_clone_6_iPSC-microglia,_day_34,20220209.A-av111_WT_003_R1.fastq,iPSC-MG,WT
WTC_EGFP_clone_6_iPSC-microglia,_day_38,20220209.A-tw029_WT_2_R1.fastq,iPSC-MG,WT
WTC_EGFP_clone_6_iPSC-microglia,_day_38,20220209.A-tw029_WT_3_R1.fastq,iPSC-MG,WT
WTC_EGFP_clone_6_iPSC-microglia,_day_28,20220504.B-WTC_1_R1.fastq,iPSC-MG,WT
WTC_EGFP_clone_6_iPSC-microglia,_day_28,20220504.B-WTC_2_R1.fastq,iPSC-MG,WT
Slc37a2_EX2B1_EGFP_clone_6_iPSC-microglia,_day_28,20220504.B-SLC-EX2B1_1_R1.fastq,iPSC-MG_Slc37a2_(mut1),Slc37a2_mutant
Slc37a2_EX2B1_EGFP_clone_6_iPSC-microglia,_day_28,20220504.B-SLC-EX2B1_2_R1.fastq,iPSC-MG_Slc37a2_(mut1),Slc37a2_mutant
Slc37a2_EX6C5_EGFP_clone_6_iPSC-microglia,_day_28,20220504.B-SLC-EX6C5_1_R1.fastq,iPSC-MG_Slc37a2_(mut2),Slc37a2_mutant
TREM2_A1_EGFP_clone_6_iPSC-microglia,_day_28,20220504.B-SLC-EX6C5_2_R1.fastq,iPSC-MG_Slc37a2_(mut2),Slc37a2_mutant
TREM2_A1_EGFP_clone_6_iPSC-microglia,_day_28,20220504.B-TREM2-A1_1_R1.fastq,iPSC-MG_TREM2_mut,TREM2_mutant
TREM2_A1_EGFP_clone_6_iPSC-microglia,_day_28,20220504.B-TREM2-A1_2_R1.fastq,iPSC-MG_TREM2_mut,TREM2_mutant
EOF

## install sra tookit

mkdir -p ~/soft/sra

cd $_

wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz

tar xzvf *tar.gz

## download


cd $WD/data


while IFS= read -r line
do
    srr=$(echo $line| cut -f2 -d',')
    echo $srr
    
    "$SRA"/prefetch $srr --output-file "$srr".sra &> \
                "$srr"_prefetch.log
    
    $SRA/vdbvalidate "$srr".sra &> "$srr"_vdbvalidation.log
    
    $SRA/fastq-dump  --gzip --split-files  "$srr".sra

    rm "$srr".sra
done < abud.conf 


while IFS= read -r line
do
    srr=$(echo $line| cut -f2 -d',')
    echo $srr
    
    "$SRA"/prefetch $srr --output-file "$srr".sra &> \
                "$srr"_prefetch.log
    
    $SRA/vdbvalidate "$srr".sra &> "$srr"_vdbvalidation.log
    
    $SRA/fastq-dump  --gzip --split-files  "$srr".sra

    rm "$srr".sra
done < mcquade_trem2.conf


while IFS= read -r line
do
    srr=$(echo $line| cut -f1 -d',')
    echo $srr
    
    "$SRA"/prefetch $srr --output-file "$srr".sra &> \
                "$srr"_prefetch.log
    
    $SRA/vdbvalidate "$srr".sra &> "$srr"_vdbvalidation.log
    
    $SRA/fastq-dump  --gzip --split-files  "$srr".sra

    rm "$srr".sra
done < mcquade_ipsc.conf


# Ambra's data - uncompress/rsync

mkdir ambra
cd $_

mv ~/ambra_villani_transfer_123461_files_4a03f22e.zip .

unzip *zip

mv *fastq.gz ..
cd ..

rmdir ambra
