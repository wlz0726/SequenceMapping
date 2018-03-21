open(I,"CHB.CHS.txt");
while(<I>){
    chomp;
    my @a=split(/\s+/);
    `mkdir $a[1]`unless -e $a[1];
    `ln -s $a[5] $a[1]/$a[1].$a[0].bam`;
    `ln -s $a[5].bai $a[1]/$a[1].$a[0].bam.bai`;
    `ln -s $a[5].bai $a[1]/$a[1].$a[0].bai`;
}
close I;
