# 01.Mapping_BWAMEM-GATKRealgn.pl

## step1: Mapping with BWA MEM and sort with samtools, connected with tunnel
NB: samtools should be v1.* or later
```
bwa mem -R ref.fa SampleID.1.fq.gz SampleID.2.fq.gz | samtools sort -O bam -o SampleID.sort.bam
samtools index SampleID.sort.bam
```

## step2: remove PCR duplicates with picard(http://broadinstitute.github.io/picard/)
```
java -jar picard.jar MarkDuplicates INPUT=SampleID.sort.bam OUTPUT=SampleID.rmdup.bam METRICS_FILE =SampleID.dup.txt REMOVE_DUPLICATES=true VALIDATION_STRINGENCY=SILENT CREATE_INDEX=true
```

## step3: do local realignment of reads to enhance the alignments in the vicinity of indel polymorphisms 
NB: GATK v3.6 
```
# use the RealignerTargetCreator to identify regions where realignment was needed
java -jar GenomeAnalysisTK.jar -R ref.fa -T RealignerTargetCreator -o SampleID.intervals -I SampleID.rmdup.bam 

# use IndelRealigner to realign the regions found in the RealignerTargetCreator step
java -jar GenomeAnalysisTK.jar -R ref.fa -T IndelRealigner -targetIntervals SampleID.intervals -o SampleID.realn.bam -I SampleID.rmdup.bam 
```

