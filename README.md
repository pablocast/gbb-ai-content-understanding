# Azure AI Content Understanding Samples (Python)

Welcome! Content Understanding is a solution that analyzes and comprehends various media content, such as **documents, images, audio, and video**, transforming it into structured, organized, and searchable data.

- The samples in this repository default to the latest preview API version: **(2024-12-01-preview)**.

## Features

Azure AI Content Understanding is a new Generative AI-based [Azure AI service](https://learn.microsoft.com/en-us/azure/ai-services/content-understanding/overview), designed to process/ingest content of any type (documents, images, audio, and video) into a user-defined output format. Content Understanding offers a streamlined process to reason over large amounts of unstructured data, accelerating time-to-value by generating an output that can be integrated into automation and analytical workflows.

## Samples

| File | Description |
| --- | --- |
| [content_extraction.ipynb](notebooks/content_extraction.ipynb) | In this sample we will show content understanding API can help you get semantic information from your file. For example OCR with table in document, audio transcription, and face analysis in video. |
| [field_extraction.ipynb](notebooks/field_extraction.ipynb) | In this sample we will show how to create an analyzer to extract fields in your file. For example invoice amount in the document, how many people in an image, names mentioned in an audio, or summary of a video. You can customize the fields by creating your own analyzer template.  |
| [conversational_field_extraction.ipynb](notebooks/conversational_field_extraction.ipynb) | This sample shows you how to evaluate conversational audio data that has previously been transcribed with Content Understanding or Azure AI Speech in in an efficient way to optimize processing quality. This also allows you to re-analyze data in a cost-efficient way. This sample is based on the [field_extraction.ipynb](notebooks/field_extraction.ipynb) sample. |
| [analyzer_training.ipynb](notebooks/analyzer_training.ipynb) | If you want to futher boost the performance for field extraction, we can do training when you provide few labeled samples to the API. Note: This feature is available to document scenario now. |
| [management.ipynb](notebooks/management.ipynb) | This sample will demo how to create a minimal analyzer, list all the analyzers in your resource, and delete the analyzer you don't need. |
| [build_person_directory.ipynb](notebooks/build_person_directory.ipynb) | This sample will demo how to enroll people’s faces from images and build a Person Directory. | |

## Getting started
### GitHub Codespaces
You can run this repo virtually by using GitHub Codespaces, which will open a web-based VS Code in your browser.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?skip_quickstart=true&machine=basicLinux32gb&repo=899687170&ref=main&geo=UsEast&devcontainer_path=.devcontainer%2Fdevcontainer.json)

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

## More Samples using Azure Content Understanding
[Azure Search with Content Understanding](https://github.com/Azure-Samples/azure-ai-search-with-content-understanding-python)

[Azure Content Understanding with OpenAI](https://github.com/Azure-Samples/azure-ai-content-understanding-with-azure-openai-python)

## Notes

* **Trademarks** - This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow [Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general). Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship. Any use of third-party trademarks or logos is subject to those third-party’s policies.

* **Data Collection** - The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at https://go.microsoft.com/fwlink/?LinkID=824704. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
