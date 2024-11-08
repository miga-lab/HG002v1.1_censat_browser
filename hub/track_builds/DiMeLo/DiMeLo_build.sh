#!/bin/bash

# reads files are filtered for MAPQ<10 and aligned bases under 10kb
# methylation is filtered using `modkit call-mods -p 0.1`

# fix and sort bed12 files
conda activate python3
for file in beds/*.bed; do fix_ft_extract_bed12.py $file > temp && mv temp $file; done
conda deactivate
for file in beds/*.bed; do sort -k1,1 -k2,2n $file > temp && mv temp $file; done

# convert to bigbed12
conda activate ucsc-browsertools
bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_CENPA_AS_5mC_individual.as \
	beds/DiMeLo_CENPA_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	DiMeLo_CENPA_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_CENPA_AS_6mA_individual.as \
	beds/DiMeLo_CENPA_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	DiMeLo_CENPA_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bb

bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_CENPA_OLD_AS_5mC_individual.as \
	beds/DiMeLo_CENPA-OLD_AS_5mC_6mA_HG002v1.1_06_11_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	DiMeLo_CENPA-OLD_AS_5mC_6mA_HG002v1.1_06_11_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_CENPA_OLD_AS_5mC_individual.as \
	beds/DiMeLo_CENPA-OLD_AS_5mC_6mA_HG002v1.1_06_11_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	DiMeLo_CENPA-OLD_AS_5mC_6mA_HG002v1.1_06_11_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bb

bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_CENPA_YOUNG_AS_5mC_individual.as \
	beds/DiMeLo_CENPA-YOUNG_AS_5mC_6mA_HG002v1.1_06_11_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	DiMeLo_CENPA-YOUNG_AS_5mC_6mA_HG002v1.1_06_11_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_CENPA_YOUNG_AS_6mA_individual.as \
	beds/DiMeLo_CENPA-YOUNG_AS_5mC_6mA_HG002v1.1_06_11_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	DiMeLo_CENPA-YOUNG_AS_5mC_6mA_HG002v1.1_06_11_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bb

bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_CENPC_AS_5mC_individual.as \
	beds/DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_CENPC_AS_6mA_individual.as \
	beds/DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	DiMeLo_CENPC_AS_5mC_6mA_HG002v1.1_01_09_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bb

bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_H3K9ME3_AS_5mC_individual.as \
	beds/Dimelo_H3K9ME3-YOUNG_AS_5mC_6mA_HG002v1.1_08_05_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Dimelo_H3K9ME3-YOUNG_AS_5mC_6mA_HG002v1.1_08_05_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_5mC.bb
bedToBigBed \
    -type=bed12 \
    -as=autosql/DiMeLo_H3K9ME3_AS_6mA_individual.as \
	beds/Dimelo_H3K9ME3-YOUNG_AS_5mC_6mA_HG002v1.1_08_05_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bed \
	/public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
	Dimelo_H3K9ME3-YOUNG_AS_5mC_6mA_HG002v1.1_08_05_24_winnowmap_q10_10kb_modkit-p0.1_ft_extract_6mA.bb
conda deactivate