#!/bin/bash

# generated using ipdSummary workflow, then making a bedgraph of the ipdRatio    
# using subreads found at: https://s3-us-west-2.amazonaws.com/human-pangenomics/index.html?prefix=backup/submissions/6dc50362-4163-4c79-9cf4-419deee8c5f9--UW_HG002_subreads/

# Attempting to retry with:
# - s3://human-pangenomics/submissions/25d8f069-2c4a-48ee-ad11-cab25aafd280--WUSTL_HG002_HiFi/HG002/PacBio_HiFi/m64043_211027_183048.hifi_reads.bam
# - s3://human-pangenomics/submissions/b0236dc6-c11f-43ec-8272-33c496f3a8fc--WUSTL_HG002_HiFi/HG002/PacBio_HiFi/m64043_210311_174418.hifi_reads.bam
# - s3://human-pangenomics/submissions/b0236dc6-c11f-43ec-8272-33c496f3a8fc--WUSTL_HG002_HiFi/HG002/PacBio_HiFi/m64043_210313_013127.hifi_reads.bam

# - s3://human-pangenomics/submissions/de000c71-bc38-4209-b86a-91d4eaadf68f--UW_HG002_HiFi/HG002/raw_data/PacBio_HiFi/m64004_210224_230828.hifi_reads.bam
# - s3://human-pangenomics/submissions/de000c71-bc38-4209-b86a-91d4eaadf68f--UW_HG002_HiFi/HG002/raw_data/PacBio_HiFi/m64014_210227_165255.hifi_reads.bam
# - s3://human-pangenomics/submissions/de000c71-bc38-4209-b86a-91d4eaadf68f--UW_HG002_HiFi/HG002/raw_data/PacBio_HiFi/m64015e_210223_010616.hifi_reads.bam
# - s3://human-pangenomics/submissions/de000c71-bc38-4209-b86a-91d4eaadf68f--UW_HG002_HiFi/HG002/raw_data/PacBio_HiFi/m64015e_210224_100310.hifi_reads.bam
# - s3://human-pangenomics/submissions/de000c71-bc38-4209-b86a-91d4eaadf68f--UW_HG002_HiFi/HG002/raw_data/PacBio_HiFi/m64076_210309_014547.hifi_reads.bam
# - s3://human-pangenomics/submissions/de000c71-bc38-4209-b86a-91d4eaadf68f--UW_HG002_HiFi/HG002/raw_data/PacBio_HiFi/m64076_210310_104300.hifi_reads.bam

grep -v $'chrM\t16570\t16571' beds/HG002_PacBio.ipdSummary.plus.bedgraph > temp && \
	mv temp beds/HG002_PacBio.ipdSummary.plus.bedgraph
grep -v $'chrM\t16570\t16571' beds/HG002_PacBio.ipdSummary.minus.bedgraph > temp && \
	mv temp beds/HG002_PacBio.ipdSummary.minus.bedgraph

conda activate ucsc-browsertools
bedGraphToBigWig \
	beds/HG002_PacBio.ipdSummary.plus.bedgraph \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002_PacBio.ipdSummary.plus.bigwig
bedGraphToBigWig \
	beds/HG002_PacBio.ipdSummary.minus.bedgraph \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	HG002_PacBio.ipdSummary.minus.bigwig
conda deactivate