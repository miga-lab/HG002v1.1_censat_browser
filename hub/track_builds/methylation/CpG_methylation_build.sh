#!/bin/bash

# modkit pileup from Q100 data. EXAMPLE: 
modkit pileup \
    -t 32 \
    --ignore h \
    --force-allow-implicit \
    --cpg \
    --ref ${ref_fasta} \
    --combine-strands \
    --filter-threshold C:0.5 --mod-threshold m:0.8 \
    ${input_bam} ${output_5mC}

# awk to make bedgraph of fraction modified with coverage over 10
awk -F "\t" -v OFS="\t" '$10 > 10 {print $1, $2, $3, $11}' "${output_5mC}" > "${output_5mC_bedgraph}"

### DID ABOVE FOR EACH OF THE FOLLOWING FILES

# sort bedgraph
sort -k1,1 -k2,2n Q100_HiFi_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bedgraph > temp && 
	mv temp Q100_HiFi_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bedgraph
sort -k1,1 -k2,2n Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bedgraph > temp && 
	mv temp Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bedgraph
sort -k1,1 -k2,2n Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5hmC.bedgraph > temp && 
	mv temp Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5hmC.bedgraph

conda activate ucsc-bedgraphtobigwig
bedGraphToBigWig \
	Q100_HiFi_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bedgraph \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Q100_HiFi_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bigwig
bedGraphToBigWig \
	Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bedgraph \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5mC.bigwig
bedGraphToBigWig \
	Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5hmC.bedgraph \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb_modkit5hmC.bigwig
conda deactivate