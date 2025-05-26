# Azure AI Content Understanding Samples (Python)

Welcome! Content Understanding is a solution that analyzes and comprehends various media content, such as **documents, images, audio, and video**, transforming it into structured, organized, and searchable data.

- The samples in this repository default to the latest preview API version: **(2024-12-01-preview)**.

## Features

Azure AI Content Understanding is a new Generative AI-based [Azure AI service](https://learn.microsoft.com/en-us/azure/ai-services/content-understanding/overview), designed to process/ingest content of any type (documents, images, audio, and video) into a user-defined output format. Content Understanding offers a streamlined process to reason over large amounts of unstructured data, accelerating time-to-value by generating an output that can be integrated into automation and analytical workflows.

## Samples

| File | Description |
| --- | --- |
| [field_extraction.ipynb](notebooks/field_extraction.ipynb) | In this sample we will show how to create an analyzer to extract fields in your file.  | 
| [contrato.json](analyzer_templates/contrato.json) | In this sample we will show how to create a customized analyzer
| | 

## Getting started

### Local environment
1. Make sure the following tools are installed:

    * [Azure Developer CLI (azd)](https://aka.ms/install-azd)
    * [Python 3.11+](https://www.python.org/downloads/)

2. Create a virtual environment and install Python dependencies:
```bash
python3.11 -m venv .venv
.venv/Scripts/pip install -r requirements.txt
```

## Configure Azure Resources
###  Use `azd` commands to auto create temporal resources to run sample
1. Make sure you have permission to grant roles under subscription
2. Login Azure
    ```shell
    azd auth login
    ```
3. Setting up environment, following prompts to choose location
    ```shell
    azd up
    ```

## Open a Jupyter notebook and follow the step-by-step guidance

Navigate to the `notebooks` directory and select the sample notebook you are interested in. Since Codespaces is pre-configured with the necessary environment, you can directly execute each step in the notebook.
