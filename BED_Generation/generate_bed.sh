#!/bin/bash

GENES="panel_genes.txt"
REF="refGene.txt"
OUT="panel_hg19_fullgene.bed"

> "$OUT"

while read gene; do
    # Extract gene entries from refGene
    grep -w "$gene" "$REF" | while read line; do
        
        chr=$(echo "$line" | awk '{print $3}')
        start=$(echo "$line" | awk '{print $5}')
        end=$(echo "$line" | awk '{print $6}')
        geneName=$(echo "$line" | awk '{print $13}')

        # Write full gene interval to BED
        echo -e "${chr}\t${start}\t${end}\t${geneName}" >> "$OUT"
    done
done < "$GENES"
