#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data/$(date +%F),analysis/$(date +%F)}

# Downloading data

    cd data/

    #wget ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/bacteria/Mycoplasma_genitalium/assembly_summary.txt
    #wget ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Mycoplasma_genitalium/assembly_summary.txt

    # CDS=0 for APVE00000000 # Strain CMCC P0001 http://genomea.asm.org/content/1/5/e00716-13.full
    ftpdirpaths=($(grep 'AUYD00000000' assembly_summary.txt | cut -f20))
    ftpdirpaths=($(grep 'NCC2705\|AJTM00000000\|AJTF00000000\|AJTI00000000\|AJTJ00000000' assembly_summary.txt | cut -f20))

    echo ${#ftpdirpaths[@]}
    echo ${ftpdirpaths[@]}

    for URL in ${ftpdirpaths[@]}
    do
      #wget -nv $URL/{*.faa.gz,*.fna.gz,*.gbff.gz}
      wget -nv $URL/*_genomic.gbff.gz
      #wget -nv $URL/*.fna.gz
    done

    find . -name "*.gz" | xargs gunzip

# 

    #perl ../scripts/gbk_multiple2single.pl

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."
