#!/bin/bash

# Generated Using hmmCDR v0.2.1 w/ --output_all

# ONT
bedGraphToBigWig \
	HG002v1.1_ONT_hmmCDR_scores.bedgraph \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_ONT_hmmCDR_scores.bigwig
bedToBigBed \
    -type=bed9 \
    -as=autosql/hg002v1.1_ont_hmmCDR.as \
    HG002v1.1_ONT_hmmCDR.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_ONT_hmmCDR.bb
# make subCDR scores into int rather than float
awk '{ $5 = int($5); OFS="\t"; print }' HG002v1.1_ONT_hmmCDR_subCDR.bed > temp && \
    mv temp HG002v1.1_ONT_hmmCDR_subCDR.bed 
bedToBigBed \
    -type=bed9 \
    -as=autosql/hg002v1.1_ont_hmmCDR_subCDR.as \
    HG002v1.1_ONT_hmmCDR_subCDR.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_ONT_hmmCDR_subCDR.bb
sort -k1,1 -k2,2n HG002v1.1_ONT_hmmCDR_priorCDR.bed > temp && \
    mv temp HG002v1.1_ONT_hmmCDR_priorCDR.bed
bedToBigBed \
    -type=bed3 \
    -as=autosql/hg002v1.1_ont_hmmCDR_priors.as \
    HG002v1.1_ONT_hmmCDR_priorCDR.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_ONT_hmmCDR_priorCDR.bb

# HiFi
bedGraphToBigWig \
	HG002v1.1_HiFi_hmmCDR_scores.bedgraph \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_HiFi_hmmCDR_scores.bigwig
bedToBigBed \
    -type=bed9 \
    -as=autosql/hg002v1.1_hifi_hmmCDR.as \
    HG002v1.1_HiFi_hmmCDR.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_HiFi_hmmCDR.bb
# make subCDR scores into int rather than float
awk '{ $5 = int($5); OFS="\t"; print }' HG002v1.1_HiFi_hmmCDR_subCDR.bed > temp && \
    mv temp HG002v1.1_HiFi_hmmCDR_subCDR.bed
bedToBigBed \
    -type=bed9 \
    -as=autosql/hg002v1.1_hifi_hmmCDR_subCDR.as \
    HG002v1.1_HiFi_hmmCDR_subCDR.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_HiFi_hmmCDR_subCDR.bb
sort -k1,1 -k2,2n HG002v1.1_HiFi_hmmCDR_priorCDR.bed > temp && \
    mv temp HG002v1.1_HiFi_hmmCDR_priorCDR.bed
bedToBigBed \
    -type=bed3 \
    -as=autosql/hg002v1.1_hifi_hmmCDR_priors.as \
    HG002v1.1_HiFi_hmmCDR_priorCDR.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002v1.1_HiFi_hmmCDR_priorCDR.bb