REF= 
perl FastaLengthStat.pl $REF > $REF.Length.stat.list
perl ref.static.pl $REF > $REF.statistics
samtools faidx $REF
bwa index $REF
java -Xmx5g -jar picard.jar CreateSequenceDictionary R=hg19.fasta O=hg19.dict
