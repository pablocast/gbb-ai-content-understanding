#!/bin/bash

# Clear the contents of the .env file
> .env

# Append new values to the .env file
echo "AZURE_AI_ENDPOINT=$(azd env get-value AZURE_AI_ENDPOINT)" >> .env
echo "AZURE_OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)" >> .env
echo "AZURE_OAI_DEPLOYMENT_NAME=$(azd env get-value AZURE_OAI_DEPLOYMENT_NAME)" >> .env
echo "AZURE_OAI_DEPLOYMENT_MODEL=$(azd env get-value AZURE_OAI_DEPLOYMENT_MODEL)" >> .env
