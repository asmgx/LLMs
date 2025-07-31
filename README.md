# Can Reasoning LLMs Enhance Clinical Document Classification?
<img width="1867" height="980" alt="image" src="https://github.com/user-attachments/assets/06729ee5-cb5c-461b-bb60-13b01dc269fe" />

# Abstract
Background : Clinical document classification is a critical process in healthcare, converting unstructured medical texts into standardized ICD-10 diagnoses. This process faces challenges due to the complex and varied nature of
medical language, which includes domain specific terminology, abbreviations, and unique writing styles across institutions. Additionally, privacy regulations and limited high quality annotated datasets hinder the development
of robust models. LLMs have emerged as a transformative technology in healthcare, improving the efficiency and accuracy of tasks like clinical document classification by leveraging advanced natural language understanding.

Objective: The objective of this study is to evaluate the performance and consistency of LLMs in classifying clinical discharge summaries based on ICD-10 codes. By leveraging both reasoning and non-reasoning LLMs, the study aims to determine how effectively these models can identify and classify clinical patterns, providing insights into their potential for improving automated clinical coding accuracy and enhancing decision support in healthcare settings.

Methods: This study used a balanced subset of the MIMIC-IV dataset, comprising 3,000 discharge summaries including 150 positive and 150 negative samples for each of the top 10 ICD-10 codes. The summaries were tokenized using cTAKES, which converted clinical narratives into structured SNOMED codes, capturing contextual details such as affirmation or negation. Eight LLMs, including four reasoning (Qwen QWQ, Deepseek Reasoner, GPT o3 Mini, Gemini 2.0 Flash Thinking) and four non-reasoning models (Llama 3.3, GPT 4o Mini, Gemini 2.0 Flash, Deepseek Chat), were evaluated over three experimental runs. Final predictions were determined using majority voting across the runs to assess accuracy, F1 score, and consistency.

Results: Among the eight evaluated LLMs, reasoning models demonstrated superior performance in ICD-10 classification, achieving an average accuracy of 71% and an F1 score of 67%, compared to 68% accuracy and 60% F1 score
for non-reasoning models. Gemini 2.0 Flash Thinking achieved the highest accuracy at 75% and F1 score at 76%, while GPT 4o Mini had the lowest performance 64% accuracy, and 47% F1 score. Consistency analysis revealed
that non-reasoning models exhibited higher stability of 91% average consistency than reasoning models of 84%. Performance variations across ICD-10 codes highlighted strengths in identifying well defined conditions but challenges in classifying abstract diagnostic categories.

Conclusion: The evaluation of reasoning and non-reasoning LLMs in ICD-10 classification highlights a trade-off between accuracy and consistency. Reasoning models achieved higher classification accuracy and F1 scores, excelling in complex clinical cases, while non-reasoning models demonstrated superior stability across repeated trials. These findings suggest that a hybrid approach, leveraging the strengths of both model types, could optimize automated clinical coding by balancing accuracy and reliability. Future research should explore multi-label classification, domain specific fine tuning, and ensemble modeling to enhance performance and generalizability in real-world healthcare applications.

# Introduction
We evaluate reasoning vs. non-reasoning LLMs for ICD‑10 classification of clinical summaries and show reasoning models achieve higher accuracy but lower consistency, suggesting a trade‑off between performance and reliability.


# LLM Reports – Installation and Setup Guide
---

## 1. Prerequisites

### Hardware
- Windows 10/11 (64-bit) or Windows Server 2016+
- **8 GB RAM minimum** (16 GB recommended)
- **50 GB free disk space** (SSD recommended)

### Software
- [Microsoft SQL Server 2019/2022](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- [SQL Server Management Studio (SSMS)](https://aka.ms/ssmsfullsetup)
- [Visual Studio 2019/2022](https://visualstudio.microsoft.com/downloads/)
- [.NET 6.0/7.0 SDK](https://dotnet.microsoft.com/en-us/download)

---

## 2. Database Setup

### Step 2.1 – Prepare Data Files
1. Gather all provided data archives:
   - `Reps.zip`
   - `Tags.zip`
2. Place them into a single folder (e.g., `C:\LLMReports\Data`).
3. Extract all archives into the same directory.

> **Tip:** Use 7-Zip or WinRAR for reliable extraction.

---

### Step 2.2 – Create Database

1. Open **SQL Server Management Studio (SSMS)**.
2. Connect to your SQL Server instance.
3. Right-click **Databases → New Database**, name it `LLMReportsDB`.

![Screenshot Placeholder: Creating database in SSMS](#)

---

### Step 2.3 – Import CSV Files

#### Option A: Using Import Wizard
- Right-click `LLMReportsDB` → **Tasks → Import Data**
- Select **Flat File Source** → choose each CSV (`Reps.csv`, `Tags.csv`)
- Map columns to appropriate data types and complete import.

#### Option B: Using T-SQL `BULK INSERT`
```sql
BULK INSERT Reps
FROM 'C:\LLMReports\Data\Reps.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Tags
FROM 'C:\LLMReports\Data\Tags.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
```

### 3. Application Setup

#### Step 3.1 – Extract Application Files
- Locate `APIApp.zip`
- Extract to `C:\LLMReports\App`

#### Step 3.2 – Configure Database Connection
Edit the `appsettings.json` (or `web.config`) file:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Database=LLMReportsDB;Trusted_Connection=True;"
}
```
#### Step 3.3 – Build and Run
- Open the project in Visual Studio.
- Restore dependencies (NuGet).
- Build the solution (`Ctrl+Shift+B`).
- Run (`F5`) to start the application.

#### Step 3.4 – Use the Application
- Launch in browser (e.g., `https://localhost:5001`).
- Select the Report List.
- Choose the LLM Model (GPT, Gemini, Deepseek, etc.).
- Click **Go** to process and view results.

### 4. Automate Extraction and Import (Optional)

You can automate the process with PowerShell:

# Unzip files
```powershell
Expand-Archive -Path "C:\LLMReports\Data\Reps.zip" -DestinationPath "C:\LLMReports\Data"
Expand-Archive -Path "C:\LLMReports\Data\Tags.zip" -DestinationPath "C:\LLMReports\Data"
```
# Import CSV to SQL
sqlcmd -S . -d LLMReportsDB -Q "BULK INSERT Reps FROM 'C:\LLMReports\Data\Reps.csv' WITH (FIELDTERMINATOR=',', ROWTERMINATOR='\n', FIRSTROW=2)"
sqlcmd -S . -d LLMReportsDB -Q "BULK INSERT Tags FROM 'C:\LLMReports\Data\Tags.csv' WITH (FIELDTERMINATOR=',', ROWTERMINATOR='\n', FIRSTROW=2)"

### 5. Final Verification
- Ensure reports load from the database.
- Confirm LLM models can be selected and return outputs.
- Validate database connectivity via application logs.


### 6. Troubleshooting

**Cannot connect to SQL Server:**  
- Ensure SQL Server service is running and firewall (port 1433) is open.

**CSV import errors:**  
- Check for correct delimiters and headers in CSV files.

**Application fails to start:**  
- Verify .NET runtime is installed and dependencies are restored.


### License
This project is for internal development and testing purposes.

