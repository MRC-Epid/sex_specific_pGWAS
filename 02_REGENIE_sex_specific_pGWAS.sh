#The REGENIE script provided below was used to conduct sex-stratified pGWASs for Olink measurements in UK Biobank.
#Variant and sample level QC was conducted as described in the Methods section of our study manuscript.
#Sex-stratified male-only and female-only analyses can be conducted by providing the relevant sample inclusion files with the "--keep" option below.
#All analyses were conducted using publicly available methods, as detailed in the Methods section of our study manuscript.

~/Programs/regenie/regenie_v3.1.4.gz_x86_64_Centos7_mkl \
--step 1 \
--bed /insert_path/input/UKBB_imputed_genotypes \
--covarFile /insert_path/input/relevant_covariates_file.txt  \
--phenoFile /insert_path/input/relevant_phenotype_file.txt \
--covarColList age,age2,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
--catCovarList chip,Batch \
--keep /insert_path/input/UKBB_Olink_female_only.txt \
--extract /insert_path/input/High_QC_filtered_UKBB_SNPs.prune.in \
--qt \
--bsize 1000 \
--threads 8 \
--lowmem \
--lowmem-prefix tmpdir/regenie_tmp_preds \
--out step1_UKBB_Olink_female/fit_bin_out_UKBB_Olink_step1_female

for i in {1..23}; do ~/Programs/regenie/regenie_v3.1.4.gz_x86_64_Centos7_mkl \
--step 2 \
--bgen/insert_path/input/ukb_imp_chr"$NUMBER".bgen \
--sample /insert_path/input/ukb_imp_chr"$NUMBER".sample \
--phenoFile  /insert_path/input/relevant_phenotype_file.txt \
--covarFile /insert_path/input/relevant_covariates_file.txt \
--covarColList age,age2,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
--catCovarList chip,Batch \
--keep /insert_path/input/UKBB_Olink_female_only.txt \
--qt \
--bsize 400 \
--minMAC 50 \
--minINFO 0.4 \
--threads 30 \
--gz \
--pred step1_UKBB_Olink_female/fit_bin_out_UKBB_Olink_step1_female_pred.list \
--out output/UKBB_trait_of_interest_female_only_chr"$NUMBER"; done

