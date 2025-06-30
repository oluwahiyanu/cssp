# Cloud Static Site CI/CD Pipeline 🚀

This project demonstrates how to deploy a static website to Azure Storage using a GitHub Actions CI/CD pipeline.

## 🔧 Technologies Used
- Azure CLI
- GitHub Actions
- Azure Storage Account (Static Website Hosting)
- Bash scripting

## 💡 Features
- Full CI/CD setup with GitHub Actions
- Azure login using Service Principal
- Automatic website deployment on every push to `master`

## 🛠 Project Structure
.
├── .github/workflows/
│ └── deploy.yml # GitHub Actions workflow
├── staticweb/ # HTML site files
│ ├── index.html
│ └── 404.html
└── deploy.sh # Bash deployment script

## 🚀 Deployment
Every push to the `master` branch triggers:
1. GitHub Action
2. Login to Azure via service principal
3. Upload static files to Azure Blob Storage

## 🔐 Secrets
Store the Azure credentials JSON under:
- **AZURE_CREDENTIALS** → GitHub → Settings → Secrets → Actions

## 📌 Outcome
Your site is deployed to:  
`https://<your-storage-account-name>.z22.web.core.windows.net/`

