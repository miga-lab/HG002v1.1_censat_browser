#########################
### RUN MODKIT PILEUP ###
#########################

pileup_bed="${mod_bam%.bam}_5mC_pileup.bed"

# run modkit pileup
modkit_v0.3.0 pileup \
	--threads 32 \
	--filter-threshold C:0.8 \
	--ignore h \
	--cpg \
	--ref ${ref_fasta} \
	--mask \
	--combine-strands \
	${mod_bam} ${pileup_bed}

# filter into bedgraph form while removing under 5 coverage CpG sites
pileup_bedgraph="${pileup_bed%.bed}.bedgraph"
awk 'BEGIN {OFS=FS="\t"} {if ($10 > 5) print $1, $2, $3, $11}' ${pileup_bed} > ${pileup_bedgraph}

##################################
### Convert bedgraph to bigwig ###
##################################

sort -k1,1 -k2,2n hg002v1.1_hifi_revio_3cells.pri_5mC_pileup.bedgraph > temp && 
	mv temp hg002v1.1_hifi_revio_3cells.pri_5mC_pileup.bedgraph

conda create -n ucsc-bedgraphtobigwig -c bioconda -c conda-forge ucsc-bedgraphtobigwig
conda activate ucsc-bedgraphtobigwig
bedGraphToBigWig ${begraph} ${genome_sizes} ${output_bigwig}
conda deactivate