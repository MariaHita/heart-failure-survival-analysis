# Paket yang dibutuhkan
library(survival)
library(survminer)

# Baca data
fp_ansur <- read.csv("C:/Users/ikemaya/Downloads/heart_failure_clinical_records_dataset.csv")

cox_model_full <- coxph(Surv(time, DEATH_EVENT) ~ age + anaemia + creatinine_phosphokinase + diabetes +
                          ejection_fraction + high_blood_pressure + platelets + serum_creatinine +
                          serum_sodium + sex + smoking, data = fp_ansur)
summary(cox_model_full)
anova(cox_model_full, test = "Chisq")
# Hitung p-value dari LRT
lrt_stat <- 2 * ( -468.23 - (-509.21) )
df <- 11
pval <- pchisq(lrt_stat, df, lower.tail = FALSE)
pval

# Backward selection dengan AIC
backward_model <- step(cox_model_full, direction = "backward")

# Lihat model hasil seleksi
summary(backward_model)

ph_test_back <- cox.zph(backward_model)
print(ph_test_back)

cox_td <- coxph(Surv(time, DEATH_EVENT) ~ age + anaemia + creatinine_phosphokinase +
                  high_blood_pressure + serum_creatinine + serum_sodium +
                  ejection_fraction + tt(ejection_fraction), 
                data = fp_ansur,
                tt = function(x, t, ...) x * log(t + 1))  # efek berubah terhadap log waktu
summary(cox_td)
backward_td <- step(cox_td, direction = "backward")

# Lihat model hasil seleksi
summary(backward_td)
anova(cox_td, test = "Chisq")

fp_ansur$ef_strata <- cut(fp_ansur$ejection_fraction,
                          breaks = c(-Inf, 40, 55, 70, Inf),
                          labels = c("Possible Heart Failure", "Restricted Flow", "Normal Flow", "Good Flow"),
                          right = FALSE)

# Pastikan variabel kategori
fp_ansur$ef_strata <- factor(fp_ansur$ef_strata)

# Model Cox dengan stratifikasi
cox_strata <- coxph(Surv(time, DEATH_EVENT) ~ age + anaemia + creatinine_phosphokinase + high_blood_pressure +
                      serum_creatinine + serum_sodium + strata(ef_strata),
                    data = fp_ansur)
summary(cox_strata)
backward_strata <- step(cox_strata, direction = "backward")

# Lihat model hasil seleksi
summary(backward_strata)
anova(cox_strata, test = "Chisq")
# Hitung p-value dari LRT
lrt_stat <- 2 * ( -405.73 - (-434.70) )
df <- 11
pval <- pchisq(lrt_stat, df, lower.tail = FALSE)
pval

# Model Terbaik
aic_df <- data.frame(Model = c("Stratified Cox", 
                               "Time Dependence Cox"),
                     AIC = c(AIC(cox_strata), AIC(backward_td)))
aic_df <- aic_df[order(aic_df$AIC), ]  # urutkan berdasarkan AIC
print(aic_df)