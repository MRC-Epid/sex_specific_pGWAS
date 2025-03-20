#The fastGWA (provided by GCTA) script provided below was used to conduct sex-stratified pGWASs for Somalogic measurements in Fenland study.
#Relevant covariates were adjusted for during the phenotype preparation process and variant and sample level QC was conducted as described in the Methods section of our study manuscript.
#Sex-stratified male-only and female-only analyses can be conducted by providing the relevant sample inclusion files with the "--keep" option below.
#All analyses were conducted using publicly available methods, as detailed in the Methods section of our study manuscript.

~/Programs/GCTA/gcta_1.93.2beta/gcta64 \
--mbgen /insert_path/sex-specific-pGWAS/input/bgen_final.txt \
--sample /insert_path/sex-specific-pGWAS/input/Fenland_QCed_samples.txt \
--keep /insert_path/sex-specific-pGWAS/input/Fenland_female_only_samples_keep.txt \
--grm-sparse /insert_path/sex-specific-pGWAS/input/Fenland_GRM_bgen-sparse \
--fastGWA-mlm \
--pheno /insert_path/sex-specific-pGWAS/input/Fenland_SomaLogic_invn_proteomics.txt \
--mpheno insert_the_order_of_trait_to_analyse_from_pheno_file \
--geno 0.05 \
--out /insert_path/sex-specific-pGWAS/output/Fenland_trait_of_interest_female_only
