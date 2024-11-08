#!/bin/bash

conda activate python3
python fix_ft_extract_bed12.py Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_msp.bed Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_msp.fix.bed && \
    sort -k1,1 -k2,2n Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_msp.fix.bed > temp && mv temp Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_msp.fix.bed
python fix_ft_extract_bed12.py Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_nuc.bed Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_nuc.fix.bed && \
    sort -k1,1 -k2,2n Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_nuc.fix.bed > temp && mv temp Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_nuc.fix.bed
python fix_ft_extract_bed12.py Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_5mC.bed Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_5mC.fix.bed && \
    sort -k1,1 -k2,2n Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_5mC.fix.bed > temp && mv temp Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_5mC.fix.bed
python fix_ft_extract_bed12.py Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_6mA.bed Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_6mA.fix.bed && \
    sort -k1,1 -k2,2n Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_6mA.fix.bed > temp && mv temp Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_6mA.fix.bed
conda deactivate

conda activate ucsc-browsertools
bedToBigBed \
    -type=bed12 \
    -as=ONT_Fiberseq_msp_individual.as \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_msp.fix.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_msp.bb
bedToBigBed \
    -type=bed12 \
    -as=ONT_Fiberseq_nuc_individual.as \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_nuc.fix.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_nuc.bb
bedToBigBed \
    -type=bed12 \
    -as=ONT_Fiberseq_5mC_individual.as \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_5mC.fix.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_5mC.bb
bedToBigBed \
    -type=bed12 \
    -as=ONT_Fiberseq_6mA_individual.as \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_6mA.fix.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Fiberseq_6mA_5mhCG_dorado082_HG002v1.1_winnowmap_merged_ft_extract_6mA.bb
conda deactivate