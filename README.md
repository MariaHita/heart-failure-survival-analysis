# 🫀 Heart Failure Survival Analysis

<p align="center">
  <img src="https://img.shields.io/badge/Statistical%20Modeling-Survival%20Analysis-8B7EC8?style=for-the-badge" alt="Survival Analysis"/>
  <img src="https://img.shields.io/badge/Model-Cox%20Regression-C69BCF?style=for-the-badge" alt="Cox Regression"/>
  <img src="https://img.shields.io/badge/Language-R-276DC3?style=for-the-badge&logo=r" alt="R"/>
</p>

<p align="center">
  <i>Exploring clinical risk factors associated with heart failure survival using statistical modeling.</i>
</p>

## 📌 Project Overview

Heart failure is a serious medical condition that can affect patients' survival outcomes. Understanding the clinical factors associated with mortality risk is important for studying patient survival patterns.

This project applies **Survival Analysis** to investigate the survival time of heart failure patients using Cox Regression and evaluate the Proportional Hazards (PH) assumption.

The analysis combines descriptive statistics, Kaplan–Meier survival curves, Log-Rank tests, Cox Proportional Hazards Regression, and Extended Cox modeling. When the PH assumption is violated, alternative modeling approaches are considered to identify a more suitable model.

This project was developed as the final project for the *Introduction to Survival Analysis* course at Institut Teknologi Sepuluh Nopember (ITS), Surabaya, in 2025.

## 📑 Table of Contents

- [Research Objectives](#-research-objectives)
- [Dataset](#-dataset)
- [Variables](#-variables)
- [Methodology](#-methodology)
- [Analytical Workflow](#-analytical-workflow)
- [Key Findings](#-key-findings)
- [Best Model Comparison](#-best-model-comparison)
- [Hazard Ratio Interpretation](#-hazard-ratio-interpretation)
- [Tools and Technologies](#-tools-and-technologies)
- [Project Structure](#-project-structure)
- [Team Members](#-team-members)
- [Academic Information](#-academic-information)

## 🎯 Research Objectives

The project aims to:

- Analyze clinical factors associated with the survival time of heart failure patients.
- Identify clinical variables associated with mortality risk.
- Compare survival patterns across patient groups using Kaplan–Meier curves and Log-Rank tests.
- Evaluate the Proportional Hazards assumption in the Cox Regression model.
- Compare Stratified Cox and Time-Dependent Cox models using the Akaike Information Criterion (AIC).

## 📂 Dataset

The study uses the **Heart Failure Clinical Records Dataset**, obtained through Kaggle.

| Dataset Characteristic | Description |
|---|---|
| Number of observations | 299 patients |
| Number of clinical predictors initially considered | 11 |
| Survival time | Duration measured in days |
| Event of interest | Death recorded in the dataset |
| Censoring | Right-censored observations |

The dataset contains anonymized clinical records, including demographic characteristics, medical conditions, and laboratory measurements.

The analysis focuses on the recorded survival outcomes and does not identify individual patients.

## 🧬 Variables

### Survival Variables

- **Time:** Survival or observation duration in days.
- **Status:** Event indicator, distinguishing recorded deaths from censored observations.

### Clinical Predictors

| Variable | Description |
|---|---|
| Age | Patient age |
| Anaemia | Anaemia status |
| CPK | Creatine phosphokinase level |
| Diabetes | Diabetes status |
| Ejection Fraction | Percentage of blood pumped by the heart |
| High Blood Pressure | Hypertension status |
| Platelets | Platelet count |
| Serum Creatinine | Serum creatinine level |
| Serum Sodium | Serum sodium level |
| Sex | Patient sex |
| Smoking | Smoking status |

These predictors were considered during the initial analysis. The final models used selected variables according to the modeling procedures described in the report.

## 🧪 Methodology

### 1. Descriptive Statistical Analysis

Descriptive statistics and visualizations were used to summarize the patient characteristics and examine the distributions of clinical variables.

### 2. Kaplan–Meier Estimation

The Kaplan–Meier estimator was used to estimate survival functions and compare survival patterns across categories of clinical variables.

### 3. Log-Rank Test

The Log-Rank test was used to assess whether survival curves differed significantly between patient groups.

### 4. Cox Proportional Hazards Regression

The Cox Regression model was applied to examine the association between clinical predictors and the hazard of death.

### 5. Proportional Hazards Assumption Evaluation

The PH assumption was assessed using graphical and goodness-of-fit approaches. The report identifies **Ejection Fraction** as the variable that did not satisfy the PH assumption in the partial test.

### 6. Extended Cox Modeling

Two alternative approaches were investigated to address the PH assumption violation:

- **Stratified Cox Regression:** Ejection Fraction was used as a stratification variable.
- **Time-Dependent Cox Regression:** A time-dependent interaction involving Ejection Fraction was incorporated into the model.

### 7. Model Selection

The Stratified Cox and Time-Dependent Cox models were compared using the Akaike Information Criterion (AIC). A lower AIC indicates a better relative trade-off between model fit and complexity among the models compared.

## 🔍 Analytical Workflow

```text
Heart Failure Clinical Records
              │
              ▼
   Descriptive Statistics
              │
              ▼
   Kaplan–Meier Estimation
              │
              ▼
       Log-Rank Tests
              │
              ▼
    Cox Regression Model
              │
              ▼
  PH Assumption Evaluation
              │
              ▼
     Extended Cox Models
        ┌─────┴─────┐
        ▼           ▼
  Stratified Cox  Time-Dependent
        │           Cox
        └─────┬─────┘
              ▼
       AIC Comparison
              │
              ▼
   Best Model Interpretation
```

## 💡 Key Findings

### 1. Survival Differences

The Log-Rank test results reported in the study indicate significant survival differences across groups for:

- Age Group
- High Blood Pressure
- Serum Creatinine
- Serum Sodium

### 2. PH Assumption

The partial PH assumption test identified Ejection Fraction as the variable that violated the assumption, with a reported p-value of **0.029**.

This finding motivated the use of Extended Cox approaches rather than relying exclusively on the standard Cox Proportional Hazards model.

### 3. Best Model Selection

The report compared the Stratified Cox model and the Time-Dependent Cox model using AIC. The Stratified Cox model achieved the lower AIC and was selected as the preferred model among the two alternatives.

## 🏆 Best Model Comparison

The reported model comparison is summarized below.

| Model | Degrees of Freedom | AIC |
|---|---:|---:|
| Stratified Cox | 6 | **823.464** |
| Time-Dependent Cox | 7 | 948.812 |

The Stratified Cox model had the lower AIC, indicating a better relative fit-complexity trade-off compared with the Time-Dependent Cox model in this analysis.

## 📈 Hazard Ratio Interpretation

The report presents the following hazard ratios for variables in the selected Stratified Cox model.

| Variable | Reported Hazard Ratio | Interpretation |
|---|---:|---|
| Age Group | 1.0400 | Associated with an increase in mortality hazard |
| Anaemia | 1.6380 | The anaemia group has a higher estimated hazard |
| CPK | 1.0000 | The reported estimate is approximately neutral |
| High Blood Pressure | 1.6850 | The hypertension group has a higher estimated hazard |
| Serum Creatinine | 1.3950 | A higher level is associated with a higher estimated hazard |
| Serum Sodium | 0.9452 | A higher level is associated with a lower estimated hazard |

These estimates are interpreted conditional on the other variables in the fitted model, subject to the model's assumptions and coding.

**Important:** Hazard ratios describe relative instantaneous event rates, not absolute probabilities of death. The estimates also should not be interpreted as causal effects.

## 🛠️ Tools and Technologies

**Statistical Methods**
- Survival Analysis
- Kaplan–Meier Estimation
- Log-Rank Test
- Cox Proportional Hazards Regression
- Stratified Cox Regression
- Time-Dependent Cox Regression
- Hazard Ratio Interpretation
- Akaike Information Criterion (AIC)

**Tools**
- R / RStudio
- Microsoft Excel

## 📁 Project Structure

A suggested repository structure for organizing the project files:

```text
heart-failure-survival-analysis/
│
├── README.md
├── data/
│   └── README.md
├── scripts/
│   └── survival_analysis.R
├── reports/
│   └── Project_Report.pdf
└── figures/
    ├── kaplan_meier_curves/
    └── model_diagnostics/
```

*This is a suggested structure. Rename or remove folders and files to match the actual contents of the repository. Do not upload identifiable or otherwise sensitive patient information.*

## 👩‍💻 Team Members

This project was collaboratively developed by:

- **Maria Immaculata Dyah Hita Widowati**
- **Ike Maya Setya**
- **Kayla Yasmine Hernanda Putri**

## 🎓 Academic Information

| Detail | Information |
|---|---|
| Course | Introduction to Survival Analysis |
| Program | Undergraduate Statistics |
| Department | Department of Statistics |
| Faculty | Faculty of Science and Data Analytics |
| Institution | Institut Teknologi Sepuluh Nopember (ITS) |
| Location | Surabaya, Indonesia |
| Year | 2025 |

**Lecturers**

- Dr. Santi Wulan Purnami, S.Si., M.Si.
- Jerry Dwi Trijoyo Purnomo, S.Si., M.Si., Ph.D.

---

<p align="center">
  <i>From clinical data to survival insights through statistical modeling.</i>
</p>
