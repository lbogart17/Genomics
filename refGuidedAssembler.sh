#index fasta reference
bwa index mt.fa


#start vwa vim alignment
bwa mem mt.fa ler.fq > ler.sam

#convert to binary 
samtools view -b -o ler.bam -s ler.sam 


#sort 
samtools sort ler.bam ler.sorted

#index my sorted.bam
samtools index ler.sorted.bam

# idk
samtools faidx mt.fa

# call vcf file 
samtools mpileup -gf mt.fa ler.sorted.bam | bcftools view -vcg - > snps_indels.vcf

echo "Now we're done!!!!"



  
