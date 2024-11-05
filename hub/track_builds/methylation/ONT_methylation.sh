#!/bin/bash

# 5mC Methylation
modkit pileup \
    -t 32 \
    --ignore h \
    --force-allow-implicit \
    --cpg \
    --ref ${ref_fasta} \
    --combine-strands \
    --filter-threshold C:0.5 --mod-threshold m:0.8 \
    ${input_bam} ${output_5mC}
awk -F "\t" -v OFS="\t" '$10 > 10 {print $1, $2, $3, $11}' "${output_5mC}" > "${output_5mC_bedgraph}"
bedGraphToBigWig \
    Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bedgraph  \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bigwig

# 5hmC Methylation
modkit pileup \
    -t 32 \
    --ignore m \
    --force-allow-implicit \
    --cpg \
    --ref ${ref_fasta} \
    --combine-strands \
    --filter-threshold C:0.5 --mod-threshold h:0.8 \
    ${input_bam} ${output_5hmC}
awk -F "\t" -v OFS="\t" '$10 > 10 {print $1, $2, $3, $11}' "${output_5hmC}" > "${output_5hmC_bedgraph}"
