# Clear the contents of the .env file
Set-Content -Path .env -Value ""

# Append new values to the .env file
$azureAiEndpoint = azd env get-value AZURE_AI_ENDPOINT

Add-Content -Path .env -Value "AZURE_AI_ENDPOINT=$(azd env get-value AZURE_AI_ENDPOINT)"
Add-Content -Path .env -Value "AZURE_OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)"
Add-Content -Path .env -Value "AZURE_OAI_DEPLOYMENT_NAME=$(azd env get-value AZURE_OAI_DEPLOYMENT_NAME)"
Add-Content -Path .env -Value "AZURE_OAI_DEPLOYMENT_MODEL=$(azd env get-value AZURE_OAI_DEPLOYMENT_MODEL)"
