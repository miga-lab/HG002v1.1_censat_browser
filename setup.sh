###############################################################################
##                           Prepare Conda Envs                              ##
###############################################################################

conda create \
	-c bioconda \
	-n ucsc-fatotwobit \
	ucsc-fatotwobit

conda create \
	-c bioconda \
	-n ucsc-bedtobigbed \
	ucsc-bedtobigbed

###############################################################################
##                           Pull In Hub Files                               ##
###############################################################################

cd /public/groups/migalab/

git clone https://github.com/jmenendez98/HG002v1.1_censat_browser.git

###############################################################################
##                           Prepare 2Bit File                               ##
###############################################################################

cd HG002v1.1_censat_browser/hub

wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/HG002/assemblies/hg002v1.1.fasta.gz

conda activate ucsc-fatotwobit

faToTwoBit \
	hg002v1.0.fasta.gz \
	hg002v1.0.fasta.2bit

conda deactivate

## Then execute all of the commands in each track_build's shell file

###############################################################################
##                                 DONE                                      ##
###############################################################################