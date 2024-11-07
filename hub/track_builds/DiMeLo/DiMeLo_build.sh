#!/bin/bash

# reads files are filtered for MAPQ<10 and aligned bases under 10kb
# methylation is filtered using `modkit call-mods -p 0.1`

# sort and fix bed12 files
conda activate python3
sort -k1,1 -k2,2n DiMeLo_CENPA_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_modkit-p0.1_ft_extract_5mC.bed > temp && \
	mv temp DiMeLo_CENPA_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_modkit-p0.1_ft_extract_5mC.bed && \
	python3 fix_ft_extract_bed12.py DiMeLo_CENPA_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_modkit-p0.1_ft_extract_5mC.bed DiMeLo_CENPA_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_modkit-p0.1_ft_extract_5mC.fix.bed
#more
conda deactivate

# convert to bigbed12
conda activate ucsc-browsertools
bedToBigBed \
    -type=bed12 \
    -as=DiMeLo_CENPA_5mC_individual.as \
	Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb.ft_extract_CpG.fix.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Q100_ONT_5mC_HG002v1.1_winnowmap_q10_10kb.ft_extract_CpG.bb
#more
conda deactivate