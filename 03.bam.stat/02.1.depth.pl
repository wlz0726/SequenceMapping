# effective size = all_seq_num - N_number
# human: 3137161264-239850802=2897310462
my $genome_size="2897310462"; # human for human hg19 genome
my $dir=shift;
die "$0 <dir>
dir with you bam

$ ls dir
SampleA.bam SampleA.bam.bai SampleB.bam SampleB.bam.bai ...
\n"unless $dir;
open(O,"> $0.$dir.sh");
my @bam=<$dir/*bam>;
foreach my $bam(sort @bam){
    print O "perl BamGenomeCoverageStatistics.pl $bam $genome_size > $bam.GC;\n";
}
close O;
