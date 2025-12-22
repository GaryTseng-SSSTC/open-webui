# Open-Webui - Tutorials

**Pages:** 55

---

## API Endpoints

**URL:** https://docs.openwebui.com/getting-started/api-endpoints/

**Contents:**
- API Endpoints
- Authentication​
- Swagger Documentation Links​
- Notable API Endpoints​
  - 📜 Retrieve All Models​
  - 💬 Chat Completions​
  - 🦙 Ollama API Proxy Support​
    - 🔁 Generate Completion (Streaming)​
    - 📦 List Available Models​
    - 🧠 Generate Embeddings​

This guide provides essential information on how to interact with the API endpoints effectively to achieve seamless integration and automation using our models. Please note that this is an experimental setup and may undergo future updates for enhancement.

To ensure secure access to the API, authentication is required 🛡️. You can authenticate your API requests using the Bearer Token mechanism. Obtain your API key from Settings > Account in the Open WebUI, or alternatively, use a JWT (JSON Web Token) for authentication.

Make sure to set the ENV environment variable to dev in order to access the Swagger documentation for any of these services. Without this configuration, the documentation will not be available.

Access detailed API documentation for different services provided by Open WebUI:

Endpoint: GET /api/models

Description: Fetches all models created or added via Open WebUI.

Endpoint: POST /api/chat/completions

Description: Serves as an OpenAI API compatible chat completion endpoint for models on Open WebUI including Ollama models, OpenAI models, and Open WebUI Function models.

If you want to interact directly with Ollama models—including for embedding generation or raw prompt streaming—Open WebUI offers a transparent passthrough to the native Ollama API via a proxy route.

When using the Ollama Proxy endpoints, you must include the Content-Type: application/json header for POST requests, or the API may fail to parse the body. Authorization headers are also required if your instance is secured.

This is ideal for building search indexes, retrieval systems, or custom pipelines using Ollama models behind the Open WebUI.

The Retrieval Augmented Generation (RAG) feature allows you to enhance responses by incorporating data from external sources. Below, you will find the methods for managing files and knowledge collections via the API, and how to use them in chat completions effectively.

To utilize external data in RAG responses, you first need to upload the files. The content of the uploaded file is automatically extracted and stored in a vector database.

Endpoint: POST /api/v1/files/

After uploading, you can group files into a knowledge collection or reference them individually in chats.

Endpoint: POST /api/v1/knowledge/{id}/file/add

You can reference both individual files or entire collections in your RAG queries for enriched responses.

This method is beneficial when you want to focus the chat model's response on the content of a specific file.

Endpoint: POST /api/chat/completions

Leverage a knowledge collection to enhance the response when the inquiry may benefit from a broader context or multiple documents.

Endpoint: POST /api/chat/completions

These methods enable effective utilization of external knowledge via uploaded files and curated knowledge collections, enhancing chat applications' capabilities using the Open WebUI API. Whether using files individually or within collections, you can customize the integration based on your specific needs.

Open WebUI offers a myriad of benefits, making it an essential tool for developers and businesses alike:

By following these guidelines, you can swiftly integrate and begin utilizing the Open WebUI API. Should you encounter any issues or have questions, feel free to reach out through our Discord Community or consult the FAQs. Happy coding! 🌟

**Examples:**

Example 1 (bash):
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" http://localhost:3000/api/models
```

Example 2 (bash):
```bash
curl -X POST http://localhost:3000/api/chat/completions \-H "Authorization: Bearer YOUR_API_KEY" \-H "Content-Type: application/json" \-d '{      "model": "llama3.1",      "messages": [        {          "role": "user",          "content": "Why is the sky blue?"        }      ]    }'
```

Example 3 (python):
```python
import requestsdef chat_with_model(token):    url = 'http://localhost:3000/api/chat/completions'    headers = {        'Authorization': f'Bearer {token}',        'Content-Type': 'application/json'    }    data = {      "model": "granite3.1-dense:8b",      "messages": [        {          "role": "user",          "content": "Why is the sky blue?"        }      ]    }    response = requests.post(url, headers=headers, json=data)    return response.json()
```

Example 4 (bash):
```bash
curl http://localhost:3000/ollama/api/generate \  -H "Authorization: Bearer YOUR_API_KEY" \  -H "Content-Type: application/json" \  -d '{  "model": "llama3.2",  "prompt": "Why is the sky blue?"}'
```

---

## API Endpoints

**URL:** https://docs.openwebui.com/getting-started/api-endpoints

**Contents:**
- API Endpoints
- Authentication​
- Swagger Documentation Links​
- Notable API Endpoints​
  - 📜 Retrieve All Models​
  - 💬 Chat Completions​
  - 🦙 Ollama API Proxy Support​
    - 🔁 Generate Completion (Streaming)​
    - 📦 List Available Models​
    - 🧠 Generate Embeddings​

This guide provides essential information on how to interact with the API endpoints effectively to achieve seamless integration and automation using our models. Please note that this is an experimental setup and may undergo future updates for enhancement.

To ensure secure access to the API, authentication is required 🛡️. You can authenticate your API requests using the Bearer Token mechanism. Obtain your API key from Settings > Account in the Open WebUI, or alternatively, use a JWT (JSON Web Token) for authentication.

Make sure to set the ENV environment variable to dev in order to access the Swagger documentation for any of these services. Without this configuration, the documentation will not be available.

Access detailed API documentation for different services provided by Open WebUI:

Endpoint: GET /api/models

Description: Fetches all models created or added via Open WebUI.

Endpoint: POST /api/chat/completions

Description: Serves as an OpenAI API compatible chat completion endpoint for models on Open WebUI including Ollama models, OpenAI models, and Open WebUI Function models.

If you want to interact directly with Ollama models—including for embedding generation or raw prompt streaming—Open WebUI offers a transparent passthrough to the native Ollama API via a proxy route.

When using the Ollama Proxy endpoints, you must include the Content-Type: application/json header for POST requests, or the API may fail to parse the body. Authorization headers are also required if your instance is secured.

This is ideal for building search indexes, retrieval systems, or custom pipelines using Ollama models behind the Open WebUI.

The Retrieval Augmented Generation (RAG) feature allows you to enhance responses by incorporating data from external sources. Below, you will find the methods for managing files and knowledge collections via the API, and how to use them in chat completions effectively.

To utilize external data in RAG responses, you first need to upload the files. The content of the uploaded file is automatically extracted and stored in a vector database.

Endpoint: POST /api/v1/files/

After uploading, you can group files into a knowledge collection or reference them individually in chats.

Endpoint: POST /api/v1/knowledge/{id}/file/add

You can reference both individual files or entire collections in your RAG queries for enriched responses.

This method is beneficial when you want to focus the chat model's response on the content of a specific file.

Endpoint: POST /api/chat/completions

Leverage a knowledge collection to enhance the response when the inquiry may benefit from a broader context or multiple documents.

Endpoint: POST /api/chat/completions

These methods enable effective utilization of external knowledge via uploaded files and curated knowledge collections, enhancing chat applications' capabilities using the Open WebUI API. Whether using files individually or within collections, you can customize the integration based on your specific needs.

Open WebUI offers a myriad of benefits, making it an essential tool for developers and businesses alike:

By following these guidelines, you can swiftly integrate and begin utilizing the Open WebUI API. Should you encounter any issues or have questions, feel free to reach out through our Discord Community or consult the FAQs. Happy coding! 🌟

**Examples:**

Example 1 (bash):
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" http://localhost:3000/api/models
```

Example 2 (bash):
```bash
curl -X POST http://localhost:3000/api/chat/completions \-H "Authorization: Bearer YOUR_API_KEY" \-H "Content-Type: application/json" \-d '{      "model": "llama3.1",      "messages": [        {          "role": "user",          "content": "Why is the sky blue?"        }      ]    }'
```

Example 3 (python):
```python
import requestsdef chat_with_model(token):    url = 'http://localhost:3000/api/chat/completions'    headers = {        'Authorization': f'Bearer {token}',        'Content-Type': 'application/json'    }    data = {      "model": "granite3.1-dense:8b",      "messages": [        {          "role": "user",          "content": "Why is the sky blue?"        }      ]    }    response = requests.post(url, headers=headers, json=data)    return response.json()
```

Example 4 (bash):
```bash
curl http://localhost:3000/ollama/api/generate \  -H "Authorization: Bearer YOUR_API_KEY" \  -H "Content-Type: application/json" \  -d '{  "model": "llama3.2",  "prompt": "Why is the sky blue?"}'
```

---

## Azure AD Domain Services (LDAPS) Integration

**URL:** https://docs.openwebui.com/tutorials/integrations/azure-ad-ds-ldap

**Contents:**
- Azure AD Domain Services (LDAPS) Integration
- 1. Prerequisites​
- 2. Deploy Azure AD Domain Services​
- 3. Find the Secure LDAP External IP​
- 4. Enable Secure LDAP (LDAPS)​
  - 4.1. Certificate (PFX) Requirements​
  - 4.2. Generate a Wildcard PFX with OpenSSL (for testing)​
- 5. Configure Network Security Group (NSG)​
- 6. Create a Service Account in Entra ID​
- 7. Configure Open WebUI Environment Variables (.env)​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This guide explains how to integrate Open WebUI with Azure AD Domain Services (AAD DS) for secure LDAP (LDAPS) authentication.

In a production environment, use a PFX certificate issued by a public Certificate Authority (CA) and set LDAP_VALIDATE_CERT=true.

In the Azure Portal, search for and select Azure AD Domain Services.

Select your Subscription and Resource Group (or create a new one).

For DNS domain name, enter your domain (e.g., openwebui.onmicrosoft.com). This value will be used for LDAP_SEARCH_BASE later.

Keep the default settings for SKU, Replica Set, etc., and click Review + create.

After deployment, navigate to the Azure AD DS blade and note the Virtual network / Subnet. If your Open WebUI server is not in the same VNet, you must create an NSG rule to allow traffic on port 636.

Navigate to your AAD DS Blade → Overview.

Under Secure LDAP, find the External IP addresses.

This IP (e.g., 1.222.222.222) will be your LDAP_SERVER_HOST value in the .env file.

For production, we recommend using Let’s Encrypt or another public CA. The self-signed process below is for testing purposes only.

Create openssl_wildcard.cnf:

Replace {your_domain} with your actual domain.

Generate Key & Certificate:

If allowing access from the internet, restrict the source IP range to the minimum required for security. If Open WebUI is in the same VNet, this step can be skipped.

In the Azure Portal, navigate to Entra ID → Users → New user.

Set the username (e.g., ldap@{your_domain}.onmicrosoft.com).

Set a strong password and uncheck User must change password at next sign-in.

Go to the Groups tab and add the user to the AAD DC Administrators group (required for querying all users).

Here is an example configuration for your .env file:

Replace placeholders like {your_domain} and <STRONG-PASSWORD> with your actual values.

Open WebUI can synchronize group memberships directly from your LDAP directory. When a user logs in, their group information is fetched and updated within Open WebUI.

To enable this feature, add the following environment variables:

To enable full TLS validation (LDAP_VALIDATE_CERT="true"):

Restart Open WebUI after making this change.

Look for Verify return code: 0 (ok) to confirm the certificate is trusted.

A successful search will return the details of the specified user.

**Examples:**

Example 1 (ini):
```ini
[ req ]distinguished_name = req_distinguished_namex509_extensions = v3_careq_extensions  = v3_reqprompt = no[ req_distinguished_name ]C  = USST = CAL  = San FranciscoO  = MyTestOrgOU = TestDepartmentCN = *.{your_domain}.onmicrosoft.com[ v3_ca ]subjectKeyIdentifier = hashauthorityKeyIdentifier = keyid:always,issuerbasicConstraints     = critical, CA:FALSEkeyUsage             = critical, digitalSignature, keyEnciphermentextendedKeyUsage     = serverAuthsubjectAltName       = @alt_names[ v3_req ]basicConstraints  = CA:FALSEkeyUsage          = digitalSignature, keyEnciphermentextendedKeyUsage  = serverAuthsubjectAltName    = @alt_names[ alt_names ]DNS.1 = *.{your_domain}.onmicrosoft.comDNS.2 = {your_domain}.onmicrosoft.com
```

Example 2 (bash):
```bash
# Generate a private keyopenssl genrsa -out privatekey_wildcard.key 2048# Create a Certificate Signing Request (CSR)openssl req -new -key privatekey_wildcard.key \  -out wildcard.csr -config openssl_wildcard.cnf# Create a self-signed certificate (valid for 365 days)openssl x509 -req -days 365 -in wildcard.csr \  -signkey privatekey_wildcard.key \  -out certificate_wildcard.crt \  -extensions v3_req -extfile openssl_wildcard.cnf# Package into a PFX fileopenssl pkcs12 -export -out certificate_wildcard.pfx \  -inkey privatekey_wildcard.key -in certificate_wildcard.crt
```

Example 3 (env):
```env
################################################ LDAP###############################################ENABLE_LDAP="true"LDAP_SERVER_LABEL="Azure AD DS"LDAP_SERVER_HOST="1.222.222.222"LDAP_SERVER_PORT="636"# TLS OptionsLDAP_USE_TLS="true"LDAP_VALIDATE_CERT="false"          # Set to true for a public CA#LDAP_CA_CERT_FILE="/etc/ssl/certs/openwebui_ca.crt"# Bind AccountLDAP_APP_DN="ldap@{your_domain}.onmicrosoft.com"LDAP_APP_PASSWORD="<STRONG-PASSWORD>"# Search ScopeLDAP_SEARCH_BASE="DC={your_domain},DC=onmicrosoft,DC=com"LDAP_ATTRIBUTE_FOR_USERNAME="sAMAccountName"LDAP_ATTRIBUTE_FOR_MAIL="userPrincipalName"LDAP_SEARCH_FILTER="(&(objectClass=user)(objectCategory=person))"# Group Synchronization (Optional)# ENABLE_LDAP_GROUP_MANAGEMENT="true"# ENABLE_LDAP_GROUP_CREATION="true"# LDAP_ATTRIBUTE_FOR_GROUPS="memberOf"
```

Example 4 (bash):
```bash
sudo cp certificate_wildcard.crt /usr/local/share/ca-certificates/openwebui.crtsudo update-ca-certificates
```

---

## Azure CLI Authentication

**URL:** https://docs.openwebui.com/tutorials/integrations/azure-openai/azure-cli-auth

**Contents:**
- Azure CLI Authentication
- Prerequisites​
- Authentication Steps​
  - 1. Login with Azure CLI​
  - 2. Verify RBAC Permissions​
- Docker Configuration​
  - Dockerfile​
  - Docker Compose​
  - Start the compose stack​
  - UI Configuration​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This guide explains how to configure Open WebUI to authenticate with Azure OpenAI using Azure CLI and Entra ID authentication.

Run the following command to authenticate with your Azure subscription:

This will open a browser window for you to log in with your Azure credentials.

Ensure your user account or group has been assigned the Cognitive Services OpenAI User role for your Azure OpenAI resource. You can verify this in the Azure Portal:

Create or modify your Dockerfile to include Azure CLI:

Configure your docker-compose.yml to mount the Azure CLI configuration and set the appropriate environment variable:

Start the docker compose services using:

Once your Docker container is running:

If you encounter authentication issues:

**Examples:**

Example 1 (dockerfile):
```dockerfile
FROM --platform=$BUILDPLATFORM ghcr.io/open-webui/open-webui:${WEBUI_DOCKER_TAG-main}RUN pip install azure-cliCMD [ "bash", "start.sh"]
```

Example 2 (yaml):
```yaml
services:  ollama:    volumes:      - ollama:/root/.ollama    container_name: ollama    pull_policy: always    tty: true    restart: unless-stopped    image: ollama/ollama:${OLLAMA_DOCKER_TAG-latest}  open-webui:    build:      context: .      args:        OLLAMA_BASE_URL: '/ollama'      dockerfile: Dockerfile    container_name: open-webui    volumes:      - open-webui:/app/backend/data      - ${HOME}/.azure:/app/.azure # THIS IS THE IMPORTANT BIT, FOR WINDOWS REPLACE ${HOME}/.azure with %USERPROFILE%\.azure*    depends_on:      - ollama    ports:      - ${OPEN_WEBUI_PORT-3000}:8080    environment:      - 'OLLAMA_BASE_URL=http://ollama:11434/'      - AZURE_CONFIG_DIR=/app/.azure # THIS IS THE IMPORTANT BIT*      - 'WEBUI_SECRET_KEY='    extra_hosts:      - host.docker.internal:host-gateway    restart: unless-stoppedvolumes:  ollama: {}  open-webui: {}
```

Example 3 (bash):
```bash
docker compose up
```

---

## Azure OpenAI with EntraID

**URL:** https://docs.openwebui.com/tutorials/integrations/azure-openai/

**Contents:**
- Azure OpenAI with EntraID
- Overview​
- Authentication Methods​
  - Azure CLI Authentication​
  - 2. Workload Identity Authentication​
- Prerequisites​
- Quick Comparison​
- Next Steps​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This sections contains guides on how to integrate Open WebUI with Azure OpenAI using secure, keyless authentication via Azure Entra ID (formerly Azure AD). Instead of managing static API keys, you can leverage Azure's identity and access management for enhanced security.

OpenWebUI needs to be on version 0.6.30 or higher for this to work!

Open WebUI supports Azure OpenAI integration with Entra ID authentication, allowing you to authenticate without storing API keys. This provides several benefits:

Open WebUI supports all authentication methods supported by DefaultAzureCredential for Azure OpenAI.

By default DefaultAzureCredential tries all Azure Credentials, both development and production types. This might not be desirable if you know what authentication type you want to use since:

To fix this, if you're on version 0.6.31 or greater you can set the environment variable AZURE_TOKEN_CREDENTIALS to one of these specific values:

This would result in it only ever choosing the selected credential type

Or, if you prefer the automatic selection behaviour but wish to narrow it between development vs production options you can use:

Best for: Local development

Azure CLI authentication uses your local Azure credentials to authenticate with Azure OpenAI. This is the simplest method for getting started and works well for development environments.

→ Learn how to set up Azure CLI Authentication

Best for: Azure Kubernetes Service (AKS) production deployments and multi-tenant environments

Workload Identity provides a managed identity solution for AKS clusters, allowing pods to authenticate to Azure services without storing any credentials in the cluster.

→ Learn how to set up Workload Identity Authentication

Regardless of which authentication method you choose, you'll need:

Choose the authentication method that best fits your deployment environment:

Both methods provide secure, keyless authentication to Azure OpenAI and can be configured through the Open WebUI admin interface once the infrastructure is set up.

---

## Backend-Controlled, UI-Compatible API Flow

**URL:** https://docs.openwebui.com/tutorials/integrations/backend-controlled-ui-compatible-flow

**Contents:**
- Backend-Controlled, UI-Compatible API Flow
- Backend-Controlled, UI-Compatible API Flow
- Prerequisites​
- Overview​
  - Process Flow​
- Implementation Guide​
  - Critical Step: Enrich Chat Response with Assistant Message​
- Step-by-Step Implementation​
  - Step 1: Create Chat with User Message​
  - Step 2: Enrich Chat Response with Assistant Message​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This tutorial demonstrates how to implement server-side orchestration of Open WebUI conversations while ensuring that assistant replies appear properly in the frontend UI. This approach requires zero frontend involvement and allows complete backend control over the chat flow. This tutorial has been verified to work with Open WebUI version v0.6.15. Future versions may introduce changes in behavior or API structure.

Before following this tutorial, ensure you have:

This tutorial describes a comprehensive 7-step process that enables server-side orchestration of Open WebUI conversations while ensuring that assistant replies appear properly in the frontend UI.

The essential steps are:

This enables server-side orchestration while still making replies show up in the frontend UI exactly as if they were generated through normal user interaction.

The assistant message needs to be added to the chat response object in memory as a critical prerequisite before triggering the completion. This step is essential because the Open WebUI frontend expects assistant messages to exist in a specific structure.

The assistant message must appear in both locations:

Expected structure of the assistant message:

Without this enrichment, the assistant's response will not appear in the frontend interface, even if the completion is successful.

This starts the chat and returns a chatId that will be used in subsequent requests.

Add the assistant message to the chat response object in memory. Note that this can be combined with Step 1 by including the assistant message in the initial chat creation:

Note: This step can be performed in memory on the response object, or combined with Step 1 by including both user and empty assistant messages in the initial chat creation.

Send the enriched chat state containing both user and assistant messages to the server:

Generate the actual AI response using the completion endpoint:

For advanced use cases involving knowledge bases or document collections, include knowledge files in the completion request:

Assistant responses can be handled in two ways depending on your implementation needs:

If using stream: true in the completion request, you can process the streamed response in real-time and wait for the stream to complete. This is the approach used by the OpenWebUI web interface and provides immediate feedback.

For implementations that cannot handle streaming, poll the chat endpoint until the response is ready. Use a retry mechanism with exponential backoff:

For manual polling, you can use:

Once the assistant response is ready, mark it as completed:

Retrieve the completed conversation:

Retrieve knowledge base information for RAG integration:

Get details about a specific model:

For multi-turn conversations, you can send additional messages to an existing chat:

Assistant responses may be wrapped in markdown code blocks. Here's how to clean them:

This cleaning process handles:

Chat Creation - Required Fields:

Chat Creation - Optional Fields:

Message Structure - User Message:

Message Structure - Assistant Message:

ChatCompletionsRequest - Required Fields:

ChatCompletionsRequest - Optional Fields:

Knowledge File Status:

Use the Open WebUI backend APIs to:

Enhanced Capabilities:

This enables backend-controlled workflows that still appear properly in the Web UI frontend chat interface, providing seamless integration between programmatic control and user experience.

The key advantage of this approach is that it maintains full compatibility with the Open WebUI frontend while allowing complete backend orchestration of the conversation flow, including advanced features like knowledge integration and asynchronous response handling.

You can test your implementation by following the step-by-step CURL examples provided above. Make sure to replace placeholder values with your actual:

Start with a simple user message and gradually add complexity like knowledge integration and advanced features once the basic flow is working.

**Examples:**

Example 1 (json):
```json
{  "id": "<uuid>",  "role": "assistant",  "content": "",  "parentId": "<user-msg-id>",  "modelName": "gpt-4o",  "modelIdx": 0,  "timestamp": "<currentTimestamp>"}
```

Example 2 (bash):
```bash
curl -X POST https://<host>/api/v1/chats/new \  -H "Authorization: Bearer <token>" \  -H "Content-Type: application/json" \  -d '{    "chat": {      "title": "New Chat",      "models": ["gpt-4o"],      "messages": [        {          "id": "user-msg-id",          "role": "user",          "content": "Hi, what is the capital of France?",          "timestamp": 1720000000000,          "models": ["gpt-4o"]        }      ],      "history": {        "current_id": "user-msg-id",        "messages": {          "user-msg-id": {            "id": "user-msg-id",            "role": "user",            "content": "Hi, what is the capital of France?",            "timestamp": 1720000000000,            "models": ["gpt-4o"]          }        }      }    }  }'
```

Example 3 (java):
```java
// Example implementation in Javapublic void enrichChatWithAssistantMessage(OWUIChatResponse chatResponse, String model) {    OWUIMessage assistantOWUIMessage = buildAssistantMessage(chatResponse, model, "assistant", "");    assistantOWUIMessage.setParentId(chatResponse.getChat().getMessages().get(0).getId());    chatResponse.getChat().getMessages().add(assistantOWUIMessage);    chatResponse.getChat().getHistory().getMessages().put(assistantOWUIMessage.getId(), assistantOWUIMessage);}
```

Example 4 (bash):
```bash
curl -X POST https://<host>/api/v1/chats/<chatId> \  -H "Authorization: Bearer <token>" \  -H "Content-Type: application/json" \  -d '{    "chat": {      "id": "<chatId>",      "title": "New Chat",      "models": ["gpt-4o"],      "messages": [        {          "id": "user-msg-id",          "role": "user",          "content": "Hi, what is the capital of France?",          "timestamp": 1720000000000,          "models": ["gpt-4o"]        },        {          "id": "assistant-msg-id",          "role": "assistant",          "content": "",          "parentId": "user-msg-id",          "modelName": "gpt-4o",          "modelIdx": 0,          "timestamp": 1720000001000        }      ],      "history": {        "current_id": "assistant-msg-id",        "messages": {          "user-msg-id": {            "id": "user-msg-id",            "role": "user",            "content": "Hi, what is the capital of France?",            "timestamp": 1720000000000,            "models": ["gpt-4o"]          },          "assistant-msg-id": {            "id": "assistant-msg-id",            "role": "assistant",            "content": "",            "parentId": "user-msg-id",            "modelName": "gpt-4o",            "modelIdx": 0,            "timestamp": 1720000001000          }        }      }    }  }'
```

---

## Backing Up Your Instance

**URL:** https://docs.openwebui.com/tutorials/maintenance/backups

**Contents:**
- Backing Up Your Instance
- Ensuring data persistence​
- Using Docker volumes​
- Using direct host binds​
- Scripting A Backup Job​
- Files in persistent data store​
- File Level Backup Approaches
- Rsync Job With Container Interruption​
- Model Backup Script Using SQLite & ChromaDB Backup Functions To B2 Remote​
- Point In Time Snapshots​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

Nobody likes losing data!

If you're self-hosting Open WebUI, then you may wish to institute some kind of formal backup plan in order to ensure that you retain a second and third copy of parts of your configuration.

This guide is intended to recommend some basic recommendations for how users might go about doing that.

This guide assumes that the user has installed Open WebUI via Docker (or intends to do so)

Firstly, before deploying your stack with Docker, ensure that your Docker Compose uses a persistent data store. If you're using the Docker Compose from the Github repository that's already taken care of. But it's easy to cook up your own variations and forget to verify this.

Docker containers are ephemeral and data must be persisted to ensure its survival on the host filesystem.

If you're using the Docker Compose from the project repository, you will be deploying Open Web UI using Docker volumes.

For Ollama and Open WebUI the mounts are:

To find the actual bind path on host, run:

docker volume inspect ollama

docker volume inspect open-webui

Some users deploy Open Web UI with direct (fixed) binds to the host filesystem, like this:

If this is how you've deployed your instance, you'll want to note the paths on root.

However your instance is provisioned, it's worth inspecting the app's data store on your server to understand what data you'll be backing up. You should see something like this:

The first way to back up the application data is to take a file level backup approach ensuring that the persistent Open Web UI data is properly backed up.

There's an almost infinite number of ways in which technical services can be backed up, but rsync remains a popular favorite for incremental jobs and so will be used as a demonstration.

Users could target the entire data directory to back up all the instance data at once or create more selective backup jobs targeting individual components. You could add more descriptive names for the targets also.

A model rsync job could look like this:

To maintain data integrity, it's generally recommended to run database backups on cold filesystems. Our default model backup job can be modified slightly to bring down the stack before running the backup script and bring it back after.

The downside of this approach, of course, is that it will entail instance downtime. Consider running the job at times you won't be using the instance or taking "software" dailies (on the running data) and more robust weeklies (on cold data).

In addition taking backups, users may also wish to create point-in-time snapshots which could be stored locally (on the server), remotely, or both.

Once you've added your backup script and provisioned your backup storage, you'll want to QA the scripts to make sure that they're running as expected. Logging is highly advisable.

Set your new script(s) up to run using crontabs according to your desired run frequency.

In addition to scripting your own backup jobs, you can find commercial offerings which generally work by installing agents on your server that will abstract the complexities of running backups. These are beyond the purview of this article but provide convenient solutions.

Your Open WebUI instance might be provisioned on a host (physical or virtualised) which you control.

Host level backups involve creating snapshots or backups but of the entire VM rather than running applications.

Some may wish to leverage them as their primary or only protection while others may wish to layer them in as additional data protections.

The amount of backups that you will wish to take depends on your personal level of risk tolerance. However, remember that it's best practice to not consider the application itself to be a backup copy (even if it lives in the cloud!). That means that if you've provisioned your instance on a VPS, it's still a reasonable recommendation to keep two (independent) backup copies.

An example backup plan that would cover the needs of many home users:

This backup plan is a little more complicated but also more comprehensive .. it involves daily pushes to two cloud storage providers for additional redundancy.

In the interest of keeping this guide reasonably thorough these additional subjects were ommitted but may be worth your consideration depending upon how much time you have to dedicate to setting up and maintaining a data protection plan for your instance:

**Examples:**

Example 1 (yaml):
```yaml
ollama:  volumes:    - ollama:/root/.ollama
```

Example 2 (yaml):
```yaml
open-webui:  volumes:    - open-webui:/app/backend/data
```

Example 3 (yaml):
```yaml
services:  ollama:    container_name: ollama    image: ollama/ollama:${OLLAMA_DOCKER_TAG-latest}    volumes:      - /opt/ollama:/root/.ollama  open-webui:    container_name: open-webui    image: ghcr.io/open-webui/open-webui:${WEBUI_DOCKER_TAG-main}    volumes:      - /opt/open-webui:/app/backend/data
```

Example 4 (txt):
```txt
├── audit.log├── cache/├── uploads/├── vector_db/└── webui.db
```

---

## Browser Search Engine Integration

**URL:** https://docs.openwebui.com/tutorials/integrations/browser-search-engine

**Contents:**
- Browser Search Engine Integration
- Setting Up Open WebUI as a Search Engine​
  - Prerequisites​
  - Step 1: Set the WEBUI_URL Environment Variable​
    - Using Docker Environment Variables​
  - Step 2: Add Open WebUI as a Custom Search Engine​
  - For Chrome​
  - For Firefox​
  - Optional: Using Specific Models​
- Example Usage​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

Open WebUI allows you to integrate directly into your web browser. This tutorial will guide you through the process of setting up Open WebUI as a custom search engine, enabling you to execute queries easily from your browser's address bar.

Before you begin, ensure that:

Setting the WEBUI_URL environment variable ensures your browser knows where to direct queries.

If you are running Open WebUI using Docker, you can set the environment variable in your docker run command:

Alternatively, you can add the variable to your .env file:

Open Chrome and navigate to Settings.

Select Search engine from the sidebar, then click on Manage search engines.

Click Add to create a new search engine.

Fill in the details as follows:

Search engine: Open WebUI Search

Keyword: webui (or any keyword you prefer)

URL with %s in place of query:

Click Add to save the configuration.

If you wish to utilize a specific model for your search, modify the URL format to include the model ID:

Note: The model ID will need to be URL-encoded. Special characters like spaces or slashes need to be encoded (e.g., my model becomes my%20model).

Once the search engine is set up, you can perform searches directly from the address bar. Simply type your chosen keyword followed by your query:

This command will redirect you to the Open WebUI interface with your search results.

If you encounter any issues, check the following:

**Examples:**

Example 1 (bash):
```bash
docker run -d \  -p 3000:8080 \  --add-host=host.docker.internal:host-gateway \  -v open-webui:/app/backend/data \  --name open-webui \  --restart always \  -e WEBUI_URL="https://<your-open-webui-url>" \  ghcr.io/open-webui/open-webui:main
```

Example 2 (plaintext):
```plaintext
WEBUI_URL=https://<your-open-webui-url>
```

Example 3 (txt):
```txt
https://<your-open-webui-url>/?q=%s
```

Example 4 (txt):
```txt
https://<your-open-webui-url>/?models=<model_id>&q=%s
```

---

## Contributing Tutorials

**URL:** https://docs.openwebui.com/tutorials/tips/contributing-tutorial/

**Contents:**
- Contributing Tutorials
- Contributing Steps​
  - 📝 Updating the GitHub Pages Workflow and Config File​
- Important​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

We appreciate your interest in contributing tutorials to the Open WebUI documentation. Follow the steps below to set up your environment and submit your tutorial.

Fork the open-webui/docs GitHub Repository

Enable GitHub Actions

Configure GitHub Environment Variables

If you need to adjust deployment settings to fit your custom setup, here’s what to do:

a. Update .github/workflows/gh-pages.yml

Add environment variables for BASE_URL and SITE_URL to the build step if necessary:

b. Modify docusaurus.config.ts to Use Environment Variables

Update docusaurus.config.ts to use these environment variables, with default values for local or direct deployment:

This setup ensures consistent deployment behavior for forks and custom setups.

Run the gh-pages GitHub Workflow

Browse to Your Forked Copy

Submit a Pull Request

Community-contributed tutorials must include the the following:

How to Test Docusaurus Locally You can test your Docusaurus site locally with the following commands:

This will help you catch any issues before deploying

**Examples:**

Example 1 (yaml):
```yaml
- name: Build    env:      BASE_URL: ${{ vars.BASE_URL }}      SITE_URL: ${{ vars.SITE_URL }}    run: npm run build
```

Example 2 (typescript):
```typescript
const config: Config = {  title: "Open WebUI",  tagline: "ChatGPT-Style WebUI for LLMs (Formerly Ollama WebUI)",  favicon: "images/favicon.png",  url: process.env.SITE_URL || "https://openwebui.com",  baseUrl: process.env.BASE_URL || "/",  ...};
```

Example 3 (txt):
```txt
:::warningThis tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.:::
```

Example 4 (bash):
```bash
npm install   # Install dependenciesnpm run build # Build the site for production
```

---

## Contributing Tutorials

**URL:** https://docs.openwebui.com/tutorials/tips/contributing-tutorial

**Contents:**
- Contributing Tutorials
- Contributing Steps​
  - 📝 Updating the GitHub Pages Workflow and Config File​
- Important​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

We appreciate your interest in contributing tutorials to the Open WebUI documentation. Follow the steps below to set up your environment and submit your tutorial.

Fork the open-webui/docs GitHub Repository

Enable GitHub Actions

Configure GitHub Environment Variables

If you need to adjust deployment settings to fit your custom setup, here’s what to do:

a. Update .github/workflows/gh-pages.yml

Add environment variables for BASE_URL and SITE_URL to the build step if necessary:

b. Modify docusaurus.config.ts to Use Environment Variables

Update docusaurus.config.ts to use these environment variables, with default values for local or direct deployment:

This setup ensures consistent deployment behavior for forks and custom setups.

Run the gh-pages GitHub Workflow

Browse to Your Forked Copy

Submit a Pull Request

Community-contributed tutorials must include the the following:

How to Test Docusaurus Locally You can test your Docusaurus site locally with the following commands:

This will help you catch any issues before deploying

**Examples:**

Example 1 (yaml):
```yaml
- name: Build    env:      BASE_URL: ${{ vars.BASE_URL }}      SITE_URL: ${{ vars.SITE_URL }}    run: npm run build
```

Example 2 (typescript):
```typescript
const config: Config = {  title: "Open WebUI",  tagline: "ChatGPT-Style WebUI for LLMs (Formerly Ollama WebUI)",  favicon: "images/favicon.png",  url: process.env.SITE_URL || "https://openwebui.com",  baseUrl: process.env.BASE_URL || "/",  ...};
```

Example 3 (txt):
```txt
:::warningThis tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.:::
```

Example 4 (bash):
```bash
npm install   # Install dependenciesnpm run build # Build the site for production
```

---

## Deployment & Community Guides

**URL:** https://docs.openwebui.com/tutorials/deployment/

**Contents:**
- Deployment & Community Guides
- 📝 Written Guides​
- 📺 Video Gallery​

We are hiring! Shape the way humanity engages with intelligence.

The tutorials and videos below are created by the community and are not officially supported by the Open WebUI team. They serve as demonstrations for customizing and deploying Open WebUI for specific use cases.

Step-by-step articles for advanced deployment scenarios.

Are you a YouTuber or Blogger? We are looking for talented individuals to create content showcasing Open WebUI's features. If you make a high-quality video or guide, let us know and we'll feature it here!

A collection of community installation guides, reviews, and deployment tutorials.

---

## Environment Variable Configuration

**URL:** https://docs.openwebui.com/getting-started/env-configuration/

**Contents:**
- Environment Variable Configuration
- Overview​
  - Important Note on PersistentConfig Environment Variables​
- App/Backend​
  - General​
    - WEBUI_URL​
    - ENABLE_SIGNUP​
    - ENABLE_SIGNUP_PASSWORD_CONFIRMATION​
    - ENABLE_LOGIN_FORM​
    - ENABLE_PASSWORD_AUTH​

Open WebUI provides a large range of environment variables that allow you to customize and configure various aspects of the application. This page serves as a comprehensive reference for all available environment variables, providing their types, default values, and descriptions. As new variables are introduced, this page will be updated to reflect the growing configuration options.

This page is up-to-date with Open WebUI release version v0.6.42, but is still a work in progress to later include more accurate descriptions, listing out options available for environment variables, defaults, and improving descriptions.

When launching Open WebUI for the first time, all environment variables are treated equally and can be used to configure the application. However, for environment variables marked as PersistentConfig, their values are persisted and stored internally.

After the initial launch, if you restart the container, PersistentConfig environment variables will no longer use the external environment variable values. Instead, they will use the internally stored values.

In contrast, regular environment variables will continue to be updated and applied on each subsequent restart.

You can update the values of PersistentConfig environment variables directly from within Open WebUI, and these changes will be stored internally. This allows you to manage these configuration settings independently of the external environment variables.

Please note that PersistentConfig environment variables are clearly marked as such in the documentation below, so you can be aware of how they will behave.

To disable this behavior and force Open WebUI to always use your environment variables (ignoring the database), set ENABLE_PERSISTENT_CONFIG to False.

CRITICAL WARNING: When ENABLE_PERSISTENT_CONFIG is False, you may still be able to edit settings in the Admin UI. However, these changes are NOT saved permanently. They will persist only for the current session and will be lost when you restart the container, as the system will revert to the values defined in your environment variables.

The following environment variables are used by backend/open_webui/config.py to provide Open WebUI startup configuration. Please note that some variables may have different default values depending on whether you're running Open WebUI directly or via Docker. For more information on logging environment variables, see our logging documentation.

This variable has to be set before you start using OAuth/SSO for authentication. Since this is a persistent config environment variable, you can only change it through one of the following options:

Failure to set WEBUI_URL before using OAuth/SSO will result in failure to log in.

This should only ever be set to False when ENABLE_OAUTH_SIGNUP is also being used and set to True. Never disable this if OAUTH/SSO is not being used. Failure to do so will result in the inability to login.

If you are running larger instances, you WILL NEED to set this to a higher value like multiple hundreds if not thousands (e.g. 1000) otherwise your app may get stuck the default pool size (which is 40 threads) is full and will not react anymore.

This caches the external model lists retrieved from configured OpenAI-compatible and Ollama API endpoints (not Open WebUI's internal model configurations). Higher values improve performance by reducing redundant API requests to external providers but may delay visibility of newly added or removed models on those endpoints. A value of 0 disables caching and forces fresh API calls each time. In high-traffic scenarios, increasing this value (e.g., to 300 seconds) can significantly reduce load on external API endpoints while still providing reasonably fresh model data.

If you're running the application via Python and using the open-webui serve command, you cannot set the port using the PORT configuration. Instead, you must specify it directly as a command-line argument using the --port flag. For example:

This will run the Open WebUI on port 9999. The PORT environment variable is disregarded in this mode.

It is recommended to set this to a high single-digit or low double-digit value if you run Open WebUI with high concurrency, many users, and very fast streaming models.

When setting this environment variable in a .env file, make sure to escape the quotes by wrapping the entire value in double quotes and using escaped quotes (\") for the inner quotes. Example:

NEVER set this env var to debug in production.

This is the maximum amount of time the client will wait for a response before timing out. If set to an empty string (' '), the timeout will be set to None, effectively disabling the timeout and allowing the client to wait indefinitely.

The AIOHTTP_CLIENT_TIMEOUT_MODEL_LIST is set to 10 seconds by default to help ensure that all necessary connections are available when opening the web UI. This duration allows enough time for retrieving the model list even in cases of higher network latency. You can lower this value if quicker timeouts are preferred, but keep in mind that doing so may lead to some connections being dropped, depending on your network conditions.

DEFAULT_TITLE_GENERATION_PROMPT_TEMPLATE:

DEFAULT_FOLLOW_UP_GENERATION_PROMPT_TEMPLATE:

DEFAULT_TOOLS_FUNCTION_CALLING_PROMPT_TEMPLATE:

The JSON data structure of TOOL_SERVER_CONNECTIONS might evolve over time as new features are added.

When enabling ENABLE_AUTOCOMPLETE_GENERATION, ensure that you also configure AUTOCOMPLETE_GENERATION_INPUT_MAX_LENGTH and AUTOCOMPLETE_GENERATION_PROMPT_TEMPLATE accordingly.

DEFAULT_AUTOCOMPLETE_GENERATION_PROMPT_TEMPLATE:

DEFAULT_TAGS_GENERATION_PROMPT_TEMPLATE:

This variable replaces the deprecated ENABLE_API_KEY environment variable.

For API Key creation (and the API keys themselves) to work, you not only need to enable it globally, but also give specific user groups the permission for it

This variable replaces the deprecated ENABLE_API_KEY_ENDPOINT_RESTRICTIONS environment variable.

The value of API_KEYS_ALLOWED_ENDPOINTS should be a comma-separated list of endpoint URLs, such as /api/v1/messages, /api/v1/channels.

This variable replaces the deprecated API_KEY_ALLOWED_ENDPOINTS environment variable.

Setting JWT_EXPIRES_IN to -1 disables JWT expiration, making issued tokens valid forever. This is extremely dangerous in production and exposes your system to severe security risks if tokens are leaked or compromised.

Always set a reasonable expiration time in production environments (e.g., 3600s, 1h, 7d etc.) to limit the lifespan of authentication tokens.

NEVER use -1 in a production environment.

If you have already deployed with JWT_EXPIRES_IN=-1, you can rotate or change your WEBUI_SECRET_KEY to immediately invalidate all existing tokens.

When ENABLE_OAUTH_SIGNUP is enabled, setting WEBUI_SESSION_COOKIE_SAME_SITE to strict can cause login failures. This is because Open WebUI uses a session cookie to validate the callback from the OAuth provider, which helps prevent CSRF attacks.

However, a strict session cookie is not sent with the callback request, leading to potential login issues. If you experience this problem, use the default lax value instead.

If the value is not set, WEBUI_SESSION_COOKIE_SAME_SITE will be used as a fallback.

If the value is not set, WEBUI_SESSION_COOKIE_SECURE will be used as a fallback.

If set to False, authentication will be disabled for your Open WebUI instance. However, it's important to note that turning off authentication is only possible for fresh installations without any existing users. If there are already users registered, you cannot disable authentication directly. Ensure that no users are present in the database if you intend to turn off WEBUI_AUTH.

Password validation is applied to:

Existing users with passwords that don't meet the new requirements are not automatically forced to update their passwords, but will need to meet the requirements when they next change their password.

Custom Pattern Considerations

When defining a custom regex pattern, ensure it:

Invalid regex patterns will cause password validation to fail, potentially preventing user registration and password changes.

You MUST set WEBUI_SECRET_KEY to a secure, persistent value.

If you do NOT set this:

Do not leave this unset in production.

Required for Multi-Worker and Multi-Node Deployments AND HIGHLY RECOMMENDED IN SINGLE-WORKER ENVIRONMENTS

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set this variable. Without it, the following issues will occur:

If OFFLINE_MODE is enabled, this ENABLE_VERSION_UPDATE_CHECK flag is always set to false automatically.

Disabled when enabled:

Read more about offline mode in the offline mode guide.

Downloads of models, sentence transformers and other configurable items will NOT WORK when this is set to 1. RAG will also not work on a default installation, if this is set to True.

This variable is required to be set, otherwise you may experience Websocket issues and weird "{}" responses or "Unexpected token 'd', "data: {"id"... is not valid JSON".

If you experience Websocket issues, check the logs of Open WebUI. If you see lines like this engineio.base_server:_log_error_once:354 - https://yourdomain.com is not an accepted origin. then you need to configure your CORS_ALLOW_ORIGIN more broadly.

Example: CORS_ALLOW_ORIGIN: "https://yourdomain.com;http://yourdomain.com;https://yourhostname;http://youripaddress;http://localhost:3000"

Add all valid IPs, Domains and Hostnames one might access your Open WebUI to the variable. Once you did, no more websocket issues or warnings in the console should occur.

This is particularly useful for scenarios such as:

Provide a semicolon-separated list of scheme names without the ://. For example: app;file;electron;my-custom-scheme.

When configured, these custom schemes will be validated alongside http and https for any origins specified in CORS_ALLOW_ORIGIN.

PostgreSQL Dependencies To use pgvector, ensure you have PostgreSQL dependencies installed:

Only PGVector and ChromaDB will be consistently maintained by the Open WebUI team. The other vector stores are community-added vector databases.

Milvus is not actively maintained by the Open WebUI team. It is an addition by the community and is maintained by the community. If you want to use Milvus, be careful when upgrading Open WebUI (crate backups and snapshots for rollbacks) in case internal changes in Open WebUI lead to breakage.

Benefits of multitenancy mode:

Technical implementation:

Migration from Legacy Mode to Multitenancy

What happens when you enable multitenancy when you already have a normal milvus database with data in it:

Clean migration path from normal Milvus to multitenancy milvus:

This rebuilds ONLY knowledge base vectors into the new multitenancy collections Files, user memories, and web search history are NOT migrated by this operation

Verify knowledge bases are accessible and functional

Cleaning up legacy collections: After successful migration (from milvus to multitenancy milvus), legacy collections still consume resources. Remove them manually:

Current UI limitations:

Critical Considerations

Before enabling multitenancy on an existing installation:

For fresh installations, no migration concerns exist

For existing installations with valuable data:

To perform a full reset and switch to multitenancy:

The mapping of multitenancy relies on current Open WebUI naming conventions for collection names.

If Open WebUI changes how it generates collection names (e.g., "user-memory-" prefix, "file-" prefix, web search patterns, or hash formats), this mapping will break and route data to incorrect collections. POTENTIALLY CAUSING HUGE DATA CORRUPTION, DATA CONSISTENCY ISSUES AND INCORRECT DATA MAPPING INSIDE THE DATABASE.

If you use Multitenancy Mode, you should always check for any changes to the collection names and data mapping before upgrading, and upgrade carefully (snapshots and backups for rollbacks)!

PostgreSQL Dependencies To use pgvector, ensure you have PostgreSQL dependencies installed:

If set to false, open-webui will assume the postgreSQL database where embeddings will be stored is pre-configured with the vector extension. This also allows open-webui to run as a non superuser database user.

When choosing an index method, consider your dataset size and query patterns. HNSW generally provides better query performance but uses more memory, while IVFFlat can be more memory-efficient for larger datasets.

For IVFFlat indexes, choosing the right number of lists is crucial for query performance. Too few lists will result in slow queries, while too many will increase index size without significant performance gains.

Qdrant is not actively maintained by the Open WebUI team. It is an addition by the community and is maintained by the community. If you want to use Qdrant, be careful when upgrading Open WebUI (crate backups and snapshots for rollbacks) in case internal changes in Open WebUI lead to breakage.

If set to True, and QDRANT_URI points to a self-hosted server with TLS enabled and certificate signed by a private CA, set the environment variable GRPC_DEFAULT_SSL_ROOTS_FILE_PATH to the path of your PEM-encoded CA certificates file. See the gRPC Core Docs for more information.

This will disconect all Qdrant collections created in the previous pattern, which is non-multitenancy. Go to Admin Settings > Documents > Reindex Knowledge Base to migrate existing knowledges.

The Qdrant collections created in the previous pattern will still consume resources.

Currently, there is no button in the UI to only reset the vector DB. If you want to migrate knowledge to multitenancy:

Reindex Knowledge Base will ONLY migrate the knowledge base

If you decide to use the multitenancy pattern as your default and you don't need to migrate old knowledge, go to Admin Settings > Documents to reset vector and knowledge, which will delete all collections with the open_webui prefix and all stored knowledge.

The mapping of multitenancy relies on current Open WebUI naming conventions for collection names.

If Open WebUI changes how it generates collection names (e.g., "user-memory-" prefix, "file-" prefix, web search patterns, or hash formats), this mapping will break and route data to incorrect collections. POTENTIALLY CAUSING HUGE DATA CORRUPTION, DATA CONSISTENCY ISSUES AND INCORRECT DATA MAPPING INSIDE THE DATABASE.

If you use Multitenancy Mode, you should always check for any changes to the collection names and data mapping before upgrading, and upgrade carefully (snapshots and backups for rollbacks)!

When using Pinecone as the vector store, the following environment variables are used to control its behavior. Make sure to set these variables in your .env file or deployment environment.

When using S3 Vector Bucket as the vector store, the following environment variables are used to control its behavior. Make sure to set these variables in your .env file or deployment environment.

Note: this configuration assumes that AWS credentials will be available to your Open WebUI environment. This could be through environment variables like AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, or through IAM role permissions.

Docling 2.0.0+ Required

The Docling integration has been refactored to use server-side parameter passing. If you are using Docling:

The old individual environment variables (DOCLING_OCR_ENGINE, DOCLING_OCR_LANG, etc.) are no longer supported and will be ignored.

Description: Specifies all Docling processing parameters in JSON format. This is the primary configuration method for Docling processing options. All previously individual Docling settings are now configured through this single JSON object.

Supported Parameters:

dlparse vs dbparse: Note that the backend names use dlparse (Deep Learning Parse), not dbparse. For modern Docling (v2+), dlparse_v4 is generally recommended for the best balance of features.

Migration from Individual Docling Variables

If you were previously using individual DOCLING_* environment variables (such as DOCLING_OCR_ENGINE, DOCLING_OCR_LANG, etc.), these are now deprecated. You must migrate to using DOCLING_PARAMS as a single JSON configuration object.

When setting this environment variable in a .env file, ensure proper JSON formatting and escape quotes as needed:

Enabling this feature increases the text volume indexed by BM25, which may impact storage requirements and indexing performance. However, it significantly improves search results when users query based on document names, titles, or structural elements rather than just content.

DEFAULT_RAG_TEMPLATE:

When configuring RAG_FILE_MAX_SIZE and RAG_FILE_MAX_COUNT, ensure that the values are reasonable to prevent excessive file uploads and potential performance issues.

Check if your API and embedding model supports batched processing. Only increase this variable's value if it does - otherwise you might run into unexpected issues.

It may be needed to increase the value of THREAD_POOL_SIZE if many other users are simultaneously using your Open WebUI instance while having async embeddings turned on to prevent

Enabling this will potentially send thousands of requests per minute. If you are embedding locally, ensure that you can handle this amount of requests, otherwise turn this off to return to sequential embedding (slower but will always work). If you are embedding externally via API, ensure your rate limits are high enough to handle parallel embedding. (Usually, OpenAI can handle thousands of embedding requests per minute, even on the lowest API tier).

You MUST provide the full URL, including the endpoint path (e.g., https://api.yourprovider.com/v1/rerank). The system does not automatically append /v1/rerank or any other path to the base URL you provide.

DEFAULT_QUERY_GENERATION_PROMPT_TEMPLATE:

When enabling GOOGLE_DRIVE_INTEGRATION, ensure that you have configured GOOGLE_DRIVE_CLIENT_ID and GOOGLE_DRIVE_API_KEY correctly, and have reviewed Google's terms of service and usage guidelines.

For a step-by-step setup guide, check out our tutorial: Configuring OneDrive & SharePoint Integration.

Configuring OneDrive integration is a multi-step process that requires creating and correctly configuring an Azure App Registration. The authentication flow also depends on a browser pop-up window. Please ensure that your browser's pop-up blocker is disabled for your Open WebUI domain to allow the authentication and file selection window to appear.

This Client ID (also known as Application ID) is obtained from an Azure App Registration within your Microsoft Entra ID (formerly Azure AD) tenant. When configuring the App Registration in Azure, the Redirect URI must be set to the URL of your Open WebUI instance and configured as a Single-page application (SPA) type for the authentication to succeed.

This variable is essential for the work/school integration. It should point to the root SharePoint site associated with your tenant, enabling access to SharePoint document libraries.

This Tenant ID (also known as Directory ID) is required for the work/school integration. You can find this value on the main overview page of your Azure App Registration in the Microsoft Entra ID portal.

Block additional domains: WEB_FETCH_FILTER_LIST="!internal.company.com,!192.168.1.1" Allow only specific domains: WEB_FETCH_FILTER_LIST="example.com,trusted-site.org"

"WEB_LOADER_CONCURRENT_REQUESTS" was previously named "WEB_SEARCH_CONCURRENT_REQUESTS". The variable "WEB_SEARCH_CONCURRENT_REQUESTS" has been repurposed to control the concurrency of the search engine requests (see above). To control the web loader concurrency (fetching content from results), you MUST use "WEB_LOADER_CONCURRENT_REQUESTS".

Perplexity is different from perplexity_search. If you use perplexity_search, this variable is not relevant to you.

Perplexity is different from perplexity_search. If you use perplexity, this variable is not relevant to you.

When using playwright, you have two options:

Using a remote Playwright browser via PLAYWRIGHT_WS_URL can be beneficial for:

This timeout only applies when WEB_LOADER_ENGINE is set to safe_web or left empty (the default). It has no effect on Playwright or Firecrawl loader engines, which have their own timeout configurations (PLAYWRIGHT_TIMEOUT and Firecrawl's internal settings respectively).

Note: If none of the specified languages are available and en was not in your list, the system will automatically try English as a final fallback.

DEFAULT_IMAGE_PROMPT_GENERATION_PROMPT_TEMPLATE:

One minimalistic working setup for Gemini can look like this:

You can only configure one OAUTH provider at a time. You cannot have two or more OAUTH providers configured simultaneously.

ENABLE_LOGIN_FORM must be set to False when ENABLE_OAUTH_SIGNUP is set to True. Failure to do so will result in the inability to login.

By default, OAuth configurations are stored in the database and managed via the Admin Panel after the initial setup. Set this variable to False to force Open WebUI to always read OAuth settings from the environment variables on every restart. This is ideal for environments using GitOps or immutable infrastructure where configuration is managed exclusively through external files (e.g., Docker Compose, Kubernetes ConfigMaps).

Enabling this option bypasses email-based user identification, which is the standard method for uniquely identifying users across authentication systems. When enabled:

Only enable this if your identity provider does not support email scope and you have alternative user identification mechanisms in place.

This setting is designed for enterprise environments using identity providers that:

For most standard OAuth providers (Google, Microsoft, GitHub, etc.), this setting should remain False.

If the OAuth picture claim is disabled by setting OAUTH_PICTURE_CLAIM to '' (empty string), then setting this variable to true will not update the user profile pictures.

Required for Multi-Replica Deployments In any production environment running more than one instance of Open WebUI (e.g., Docker Swarm, Kubernetes), this variable MUST be explicitly set to a persistent, shared secret. If left unset, each replica will generate or use a different key, causing session decryption to fail intermittently as user requests are load-balanced across instances.

See https://support.google.com/cloud/answer/6158849?hl=en

You must also set OPENID_PROVIDER_URL or otherwise logout may not work.

See https://learn.microsoft.com/en-us/entra/identity-platform/quickstart-register-app

You must also set OPENID_PROVIDER_URL or otherwise logout may not work.

See https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps

You must also set OPENID_PROVIDER_URL or otherwise logout may not work.

See https://open.feishu.cn/document/sso/web-application-sso/login-overview

The environment variable OPENID_PROVIDER_URL MUST be configured, otherwise the logout functionality will not work for most providers. Even when using Microsoft, GitHub or other providers, you MUST set the OPENID_PROVIDER_URL environment variable.

If OAUTH_PICTURE_CLAIM is set to '' (empty string), then the OAuth picture claim is disabled and the user profile pictures will not be saved.

This is useful when you need a JWT access token for downstream validation or when your OAuth provider requires an audience hint for proper token generation. For Auth0, this is typically your API identifier (e.g., https://your-api.auth0.com/api/v2/). For Ory, specify the resource server you want to access.

For API Key creation (and the API keys themselves) to work, you not only need to give specific user groups the permission for it, but also enable it globally using ENABLE_API_KEYS

These variables are not specific to Open WebUI but can still be valuable in certain contexts.

If the endpoint is an S3-compatible provider like MinIO that uses a TLS certificate signed by a private CA, set the environment variable AWS_CA_BUNDLE to the path of your PEM-encoded CA certificates file. See the Amazon SDK Docs for more information.

For PostgreSQL support, ensure you installed with pip install open-webui[all] instead of the basic installation. Supports SQLite, Postgres, and encrypted SQLite via SQLCipher. Changing the URL does not migrate data between databases.

Documentation on the URL scheme is available here.

If your database password contains special characters, please ensure they are properly URL-encoded. For example, a password like p@ssword should be encoded as p%40ssword.

For configuration using individual parameters or encrypted SQLite, see the relevant sections below.

Required for Multi-Replica Setups For multi-replica or high-availability deployments (Kubernetes, Docker Swarm), you MUST use an external database (PostgreSQL) instead of SQLite. SQLite does not support concurrent writes from multiple instances and will result in database corruption or data inconsistency.

When DATABASE_URL is not explicitly set, Open WebUI will attempt to construct it using a combination of DATABASE_TYPE, DATABASE_USER, DATABASE_PASSWORD, DATABASE_HOST, DATABASE_PORT, and DATABASE_NAME. For this automatic construction to occur, all of these individual parameters must be provided. If any are missing, the default DATABASE_URL (SQLite file) or any explicitly set DATABASE_URL will be used instead.

For enhanced security, Open WebUI supports at-rest encryption for its primary SQLite database using SQLCipher. This is recommended for deployments handling sensitive data where using a larger database like PostgreSQL is not needed.

SQLCipher encryption requires additional dependencies that are not included by default. Before using this feature, you must install:

For Docker users, this means building a custom image with these dependencies included.

To enable encryption, you must configure two environment variables:

When these are set and a full DATABASE_URL is not explicitly defined, Open WebUI will automatically create and use an encrypted database file at ./data/webui.db.

Ensure the database password is kept secure, as it is needed to decrypt and access all application data.

More information about this setting can be found here.

More information about this setting can be found here.

More information about this setting can be found here.

Required for Multi-Worker and Multi-Node Deployments

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set the REDIS_URL value. Without it, the following issues will occur:

Redis serves as the central state store that allows multiple Open WebUI instances to coordinate and share critical application data.

Single Instance Deployments

If you're running Open WebUI as a single instance with UVICORN_WORKERS=1 (the default), Redis is not required. The application will function normally without it.

This option has no effect if REDIS_SENTINEL_HOSTS is defined.

Critical for Redis Sentinel Deployments

Without a socket connection timeout, Redis Sentinel failover can cause the application to hang indefinitely when a master node goes offline. The application may become completely unresponsive and even fail to restart.

For Sentinel deployments, it is strongly recommended to set this value (e.g., REDIS_SOCKET_CONNECT_TIMEOUT=5).

Interaction with WEBSOCKET_REDIS_OPTIONS

If you explicitly set WEBSOCKET_REDIS_OPTIONS, this variable will not apply to the AsyncRedisManager used for websocket communication. In that case, you must include socket_connect_timeout directly within WEBSOCKET_REDIS_OPTIONS:

If WEBSOCKET_REDIS_OPTIONS is not set, REDIS_SOCKET_CONNECT_TIMEOUT will be applied to websocket connections automatically.

Required for Multi-Worker and Multi-Node Deployments

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set this variable. Without it, the following issues will occur:

Required for Multi-Worker and Multi-Node Deployments

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set this variable. Without it, the following issues will occur:

Required for Multi-Worker and Multi-Node Deployments

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set this variable. Without it, the following issues will occur:

This option has no effect if WEBSOCKET_SENTINEL_HOSTS is defined.

AWS SSM and Docker compose cannot ingest raw JSON, as such you need to escape any double quotes like the following: {\"retry_on_timeout\": true, \"socket_connect_timeout\": 5, \"socket_timeout\": 5, \"max_connections\": 8}

Precedence with REDIS_SOCKET_CONNECT_TIMEOUT

When this variable is left empty (default), REDIS_SOCKET_CONNECT_TIMEOUT is automatically applied to websocket connections if set. However, if you explicitly set WEBSOCKET_REDIS_OPTIONS to any value, REDIS_SOCKET_CONNECT_TIMEOUT will not be injected—you must include socket_connect_timeout manually within this JSON if needed.

This can be very verbose, it is only recommended to use this flag when debugging Redis related issues.

This can be very verbose, it is only recommended to use this flag when debugging Redis related issues.

Experimental Feature - Known Limitations

This feature is currently experimental and has known compatibility issues:

Only enable this setting if:

For most deployments, the default browser cookie-based session management is sufficient and more stable.

When deploying in orchestrated environments like Kubernetes or using Helm charts, it's recommended to keep UVICORN_WORKERS set to 1. Container orchestration platforms already provide their own scaling mechanisms through pod replication, and using multiple workers inside containers can lead to resource allocation issues and complicate horizontal scaling strategies.

If you use UVICORN_WORKERS, you also need to ensure that related environment variables for scalable multi-worker setups are set accordingly.

When UVICORN_WORKERS > 1, starting the application can trigger concurrent database migrations from multiple worker processes, potentially causing database schema corruption or inconsistent states.

Recommendation: After pulling a new image or installing an update, always run Open WebUI with a single worker (UVICORN_WORKERS=1) first. This ensures the database migration completes successfully in a single process. Once the migration is finished and the application has started, you can then restart it with your desired number of workers.

For Kubernetes, Helm, Minikube, and other orchestrated setups: Ensure that your deployment strategy allows for a single-replica or single-worker init container/job to handle migrations before scaling up to multiple replicas or workers. This is critical to prevent race conditions during schema updates.

Open WebUI supports using proxies for HTTP and HTTPS retrievals. To specify proxy settings, Open WebUI uses the following environment variables:

Open WebUI provides environment variables to customize the pip installation process. Below are the environment variables used by Open WebUI for adjusting package installation behavior:

**Examples:**

Example 1 (bash):
```bash
open-webui serve --port 9999
```

Example 2 (json):
```json
[{"id": "string", "type": "string [info, success, warning, error]", "title": "string", "content": "string", "dismissible": false, "timestamp": 1000}]
```

Example 3 (text):
```text
WEBUI_BANNERS="[{\"id\": \"1\", \"type\": \"warning\", \"title\": \"Your messages are stored.\", \"content\": \"Your messages are stored and may be reviewed by human people. LLM's are prone to hallucinations, check sources.\", \"dismissible\": true, \"timestamp\": 1000}]"
```

Example 4 (json):
```json
[{"title": ["Title part 1", "Title part 2"], "content": "prompt"}]
```

---

## Environment Variable Configuration

**URL:** https://docs.openwebui.com/getting-started/env-configuration

**Contents:**
- Environment Variable Configuration
- Overview​
  - Important Note on PersistentConfig Environment Variables​
- App/Backend​
  - General​
    - WEBUI_URL​
    - ENABLE_SIGNUP​
    - ENABLE_SIGNUP_PASSWORD_CONFIRMATION​
    - ENABLE_LOGIN_FORM​
    - ENABLE_PASSWORD_AUTH​

Open WebUI provides a large range of environment variables that allow you to customize and configure various aspects of the application. This page serves as a comprehensive reference for all available environment variables, providing their types, default values, and descriptions. As new variables are introduced, this page will be updated to reflect the growing configuration options.

This page is up-to-date with Open WebUI release version v0.6.42, but is still a work in progress to later include more accurate descriptions, listing out options available for environment variables, defaults, and improving descriptions.

When launching Open WebUI for the first time, all environment variables are treated equally and can be used to configure the application. However, for environment variables marked as PersistentConfig, their values are persisted and stored internally.

After the initial launch, if you restart the container, PersistentConfig environment variables will no longer use the external environment variable values. Instead, they will use the internally stored values.

In contrast, regular environment variables will continue to be updated and applied on each subsequent restart.

You can update the values of PersistentConfig environment variables directly from within Open WebUI, and these changes will be stored internally. This allows you to manage these configuration settings independently of the external environment variables.

Please note that PersistentConfig environment variables are clearly marked as such in the documentation below, so you can be aware of how they will behave.

To disable this behavior and force Open WebUI to always use your environment variables (ignoring the database), set ENABLE_PERSISTENT_CONFIG to False.

CRITICAL WARNING: When ENABLE_PERSISTENT_CONFIG is False, you may still be able to edit settings in the Admin UI. However, these changes are NOT saved permanently. They will persist only for the current session and will be lost when you restart the container, as the system will revert to the values defined in your environment variables.

The following environment variables are used by backend/open_webui/config.py to provide Open WebUI startup configuration. Please note that some variables may have different default values depending on whether you're running Open WebUI directly or via Docker. For more information on logging environment variables, see our logging documentation.

This variable has to be set before you start using OAuth/SSO for authentication. Since this is a persistent config environment variable, you can only change it through one of the following options:

Failure to set WEBUI_URL before using OAuth/SSO will result in failure to log in.

This should only ever be set to False when ENABLE_OAUTH_SIGNUP is also being used and set to True. Never disable this if OAUTH/SSO is not being used. Failure to do so will result in the inability to login.

If you are running larger instances, you WILL NEED to set this to a higher value like multiple hundreds if not thousands (e.g. 1000) otherwise your app may get stuck the default pool size (which is 40 threads) is full and will not react anymore.

This caches the external model lists retrieved from configured OpenAI-compatible and Ollama API endpoints (not Open WebUI's internal model configurations). Higher values improve performance by reducing redundant API requests to external providers but may delay visibility of newly added or removed models on those endpoints. A value of 0 disables caching and forces fresh API calls each time. In high-traffic scenarios, increasing this value (e.g., to 300 seconds) can significantly reduce load on external API endpoints while still providing reasonably fresh model data.

If you're running the application via Python and using the open-webui serve command, you cannot set the port using the PORT configuration. Instead, you must specify it directly as a command-line argument using the --port flag. For example:

This will run the Open WebUI on port 9999. The PORT environment variable is disregarded in this mode.

It is recommended to set this to a high single-digit or low double-digit value if you run Open WebUI with high concurrency, many users, and very fast streaming models.

When setting this environment variable in a .env file, make sure to escape the quotes by wrapping the entire value in double quotes and using escaped quotes (\") for the inner quotes. Example:

NEVER set this env var to debug in production.

This is the maximum amount of time the client will wait for a response before timing out. If set to an empty string (' '), the timeout will be set to None, effectively disabling the timeout and allowing the client to wait indefinitely.

The AIOHTTP_CLIENT_TIMEOUT_MODEL_LIST is set to 10 seconds by default to help ensure that all necessary connections are available when opening the web UI. This duration allows enough time for retrieving the model list even in cases of higher network latency. You can lower this value if quicker timeouts are preferred, but keep in mind that doing so may lead to some connections being dropped, depending on your network conditions.

DEFAULT_TITLE_GENERATION_PROMPT_TEMPLATE:

DEFAULT_FOLLOW_UP_GENERATION_PROMPT_TEMPLATE:

DEFAULT_TOOLS_FUNCTION_CALLING_PROMPT_TEMPLATE:

The JSON data structure of TOOL_SERVER_CONNECTIONS might evolve over time as new features are added.

When enabling ENABLE_AUTOCOMPLETE_GENERATION, ensure that you also configure AUTOCOMPLETE_GENERATION_INPUT_MAX_LENGTH and AUTOCOMPLETE_GENERATION_PROMPT_TEMPLATE accordingly.

DEFAULT_AUTOCOMPLETE_GENERATION_PROMPT_TEMPLATE:

DEFAULT_TAGS_GENERATION_PROMPT_TEMPLATE:

This variable replaces the deprecated ENABLE_API_KEY environment variable.

For API Key creation (and the API keys themselves) to work, you not only need to enable it globally, but also give specific user groups the permission for it

This variable replaces the deprecated ENABLE_API_KEY_ENDPOINT_RESTRICTIONS environment variable.

The value of API_KEYS_ALLOWED_ENDPOINTS should be a comma-separated list of endpoint URLs, such as /api/v1/messages, /api/v1/channels.

This variable replaces the deprecated API_KEY_ALLOWED_ENDPOINTS environment variable.

Setting JWT_EXPIRES_IN to -1 disables JWT expiration, making issued tokens valid forever. This is extremely dangerous in production and exposes your system to severe security risks if tokens are leaked or compromised.

Always set a reasonable expiration time in production environments (e.g., 3600s, 1h, 7d etc.) to limit the lifespan of authentication tokens.

NEVER use -1 in a production environment.

If you have already deployed with JWT_EXPIRES_IN=-1, you can rotate or change your WEBUI_SECRET_KEY to immediately invalidate all existing tokens.

When ENABLE_OAUTH_SIGNUP is enabled, setting WEBUI_SESSION_COOKIE_SAME_SITE to strict can cause login failures. This is because Open WebUI uses a session cookie to validate the callback from the OAuth provider, which helps prevent CSRF attacks.

However, a strict session cookie is not sent with the callback request, leading to potential login issues. If you experience this problem, use the default lax value instead.

If the value is not set, WEBUI_SESSION_COOKIE_SAME_SITE will be used as a fallback.

If the value is not set, WEBUI_SESSION_COOKIE_SECURE will be used as a fallback.

If set to False, authentication will be disabled for your Open WebUI instance. However, it's important to note that turning off authentication is only possible for fresh installations without any existing users. If there are already users registered, you cannot disable authentication directly. Ensure that no users are present in the database if you intend to turn off WEBUI_AUTH.

Password validation is applied to:

Existing users with passwords that don't meet the new requirements are not automatically forced to update their passwords, but will need to meet the requirements when they next change their password.

Custom Pattern Considerations

When defining a custom regex pattern, ensure it:

Invalid regex patterns will cause password validation to fail, potentially preventing user registration and password changes.

You MUST set WEBUI_SECRET_KEY to a secure, persistent value.

If you do NOT set this:

Do not leave this unset in production.

Required for Multi-Worker and Multi-Node Deployments AND HIGHLY RECOMMENDED IN SINGLE-WORKER ENVIRONMENTS

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set this variable. Without it, the following issues will occur:

If OFFLINE_MODE is enabled, this ENABLE_VERSION_UPDATE_CHECK flag is always set to false automatically.

Disabled when enabled:

Read more about offline mode in the offline mode guide.

Downloads of models, sentence transformers and other configurable items will NOT WORK when this is set to 1. RAG will also not work on a default installation, if this is set to True.

This variable is required to be set, otherwise you may experience Websocket issues and weird "{}" responses or "Unexpected token 'd', "data: {"id"... is not valid JSON".

If you experience Websocket issues, check the logs of Open WebUI. If you see lines like this engineio.base_server:_log_error_once:354 - https://yourdomain.com is not an accepted origin. then you need to configure your CORS_ALLOW_ORIGIN more broadly.

Example: CORS_ALLOW_ORIGIN: "https://yourdomain.com;http://yourdomain.com;https://yourhostname;http://youripaddress;http://localhost:3000"

Add all valid IPs, Domains and Hostnames one might access your Open WebUI to the variable. Once you did, no more websocket issues or warnings in the console should occur.

This is particularly useful for scenarios such as:

Provide a semicolon-separated list of scheme names without the ://. For example: app;file;electron;my-custom-scheme.

When configured, these custom schemes will be validated alongside http and https for any origins specified in CORS_ALLOW_ORIGIN.

PostgreSQL Dependencies To use pgvector, ensure you have PostgreSQL dependencies installed:

Only PGVector and ChromaDB will be consistently maintained by the Open WebUI team. The other vector stores are community-added vector databases.

Milvus is not actively maintained by the Open WebUI team. It is an addition by the community and is maintained by the community. If you want to use Milvus, be careful when upgrading Open WebUI (crate backups and snapshots for rollbacks) in case internal changes in Open WebUI lead to breakage.

Benefits of multitenancy mode:

Technical implementation:

Migration from Legacy Mode to Multitenancy

What happens when you enable multitenancy when you already have a normal milvus database with data in it:

Clean migration path from normal Milvus to multitenancy milvus:

This rebuilds ONLY knowledge base vectors into the new multitenancy collections Files, user memories, and web search history are NOT migrated by this operation

Verify knowledge bases are accessible and functional

Cleaning up legacy collections: After successful migration (from milvus to multitenancy milvus), legacy collections still consume resources. Remove them manually:

Current UI limitations:

Critical Considerations

Before enabling multitenancy on an existing installation:

For fresh installations, no migration concerns exist

For existing installations with valuable data:

To perform a full reset and switch to multitenancy:

The mapping of multitenancy relies on current Open WebUI naming conventions for collection names.

If Open WebUI changes how it generates collection names (e.g., "user-memory-" prefix, "file-" prefix, web search patterns, or hash formats), this mapping will break and route data to incorrect collections. POTENTIALLY CAUSING HUGE DATA CORRUPTION, DATA CONSISTENCY ISSUES AND INCORRECT DATA MAPPING INSIDE THE DATABASE.

If you use Multitenancy Mode, you should always check for any changes to the collection names and data mapping before upgrading, and upgrade carefully (snapshots and backups for rollbacks)!

PostgreSQL Dependencies To use pgvector, ensure you have PostgreSQL dependencies installed:

If set to false, open-webui will assume the postgreSQL database where embeddings will be stored is pre-configured with the vector extension. This also allows open-webui to run as a non superuser database user.

When choosing an index method, consider your dataset size and query patterns. HNSW generally provides better query performance but uses more memory, while IVFFlat can be more memory-efficient for larger datasets.

For IVFFlat indexes, choosing the right number of lists is crucial for query performance. Too few lists will result in slow queries, while too many will increase index size without significant performance gains.

Qdrant is not actively maintained by the Open WebUI team. It is an addition by the community and is maintained by the community. If you want to use Qdrant, be careful when upgrading Open WebUI (crate backups and snapshots for rollbacks) in case internal changes in Open WebUI lead to breakage.

If set to True, and QDRANT_URI points to a self-hosted server with TLS enabled and certificate signed by a private CA, set the environment variable GRPC_DEFAULT_SSL_ROOTS_FILE_PATH to the path of your PEM-encoded CA certificates file. See the gRPC Core Docs for more information.

This will disconect all Qdrant collections created in the previous pattern, which is non-multitenancy. Go to Admin Settings > Documents > Reindex Knowledge Base to migrate existing knowledges.

The Qdrant collections created in the previous pattern will still consume resources.

Currently, there is no button in the UI to only reset the vector DB. If you want to migrate knowledge to multitenancy:

Reindex Knowledge Base will ONLY migrate the knowledge base

If you decide to use the multitenancy pattern as your default and you don't need to migrate old knowledge, go to Admin Settings > Documents to reset vector and knowledge, which will delete all collections with the open_webui prefix and all stored knowledge.

The mapping of multitenancy relies on current Open WebUI naming conventions for collection names.

If Open WebUI changes how it generates collection names (e.g., "user-memory-" prefix, "file-" prefix, web search patterns, or hash formats), this mapping will break and route data to incorrect collections. POTENTIALLY CAUSING HUGE DATA CORRUPTION, DATA CONSISTENCY ISSUES AND INCORRECT DATA MAPPING INSIDE THE DATABASE.

If you use Multitenancy Mode, you should always check for any changes to the collection names and data mapping before upgrading, and upgrade carefully (snapshots and backups for rollbacks)!

When using Pinecone as the vector store, the following environment variables are used to control its behavior. Make sure to set these variables in your .env file or deployment environment.

When using S3 Vector Bucket as the vector store, the following environment variables are used to control its behavior. Make sure to set these variables in your .env file or deployment environment.

Note: this configuration assumes that AWS credentials will be available to your Open WebUI environment. This could be through environment variables like AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, or through IAM role permissions.

Docling 2.0.0+ Required

The Docling integration has been refactored to use server-side parameter passing. If you are using Docling:

The old individual environment variables (DOCLING_OCR_ENGINE, DOCLING_OCR_LANG, etc.) are no longer supported and will be ignored.

Description: Specifies all Docling processing parameters in JSON format. This is the primary configuration method for Docling processing options. All previously individual Docling settings are now configured through this single JSON object.

Supported Parameters:

dlparse vs dbparse: Note that the backend names use dlparse (Deep Learning Parse), not dbparse. For modern Docling (v2+), dlparse_v4 is generally recommended for the best balance of features.

Migration from Individual Docling Variables

If you were previously using individual DOCLING_* environment variables (such as DOCLING_OCR_ENGINE, DOCLING_OCR_LANG, etc.), these are now deprecated. You must migrate to using DOCLING_PARAMS as a single JSON configuration object.

When setting this environment variable in a .env file, ensure proper JSON formatting and escape quotes as needed:

Enabling this feature increases the text volume indexed by BM25, which may impact storage requirements and indexing performance. However, it significantly improves search results when users query based on document names, titles, or structural elements rather than just content.

DEFAULT_RAG_TEMPLATE:

When configuring RAG_FILE_MAX_SIZE and RAG_FILE_MAX_COUNT, ensure that the values are reasonable to prevent excessive file uploads and potential performance issues.

Check if your API and embedding model supports batched processing. Only increase this variable's value if it does - otherwise you might run into unexpected issues.

It may be needed to increase the value of THREAD_POOL_SIZE if many other users are simultaneously using your Open WebUI instance while having async embeddings turned on to prevent

Enabling this will potentially send thousands of requests per minute. If you are embedding locally, ensure that you can handle this amount of requests, otherwise turn this off to return to sequential embedding (slower but will always work). If you are embedding externally via API, ensure your rate limits are high enough to handle parallel embedding. (Usually, OpenAI can handle thousands of embedding requests per minute, even on the lowest API tier).

You MUST provide the full URL, including the endpoint path (e.g., https://api.yourprovider.com/v1/rerank). The system does not automatically append /v1/rerank or any other path to the base URL you provide.

DEFAULT_QUERY_GENERATION_PROMPT_TEMPLATE:

When enabling GOOGLE_DRIVE_INTEGRATION, ensure that you have configured GOOGLE_DRIVE_CLIENT_ID and GOOGLE_DRIVE_API_KEY correctly, and have reviewed Google's terms of service and usage guidelines.

For a step-by-step setup guide, check out our tutorial: Configuring OneDrive & SharePoint Integration.

Configuring OneDrive integration is a multi-step process that requires creating and correctly configuring an Azure App Registration. The authentication flow also depends on a browser pop-up window. Please ensure that your browser's pop-up blocker is disabled for your Open WebUI domain to allow the authentication and file selection window to appear.

This Client ID (also known as Application ID) is obtained from an Azure App Registration within your Microsoft Entra ID (formerly Azure AD) tenant. When configuring the App Registration in Azure, the Redirect URI must be set to the URL of your Open WebUI instance and configured as a Single-page application (SPA) type for the authentication to succeed.

This variable is essential for the work/school integration. It should point to the root SharePoint site associated with your tenant, enabling access to SharePoint document libraries.

This Tenant ID (also known as Directory ID) is required for the work/school integration. You can find this value on the main overview page of your Azure App Registration in the Microsoft Entra ID portal.

Block additional domains: WEB_FETCH_FILTER_LIST="!internal.company.com,!192.168.1.1" Allow only specific domains: WEB_FETCH_FILTER_LIST="example.com,trusted-site.org"

"WEB_LOADER_CONCURRENT_REQUESTS" was previously named "WEB_SEARCH_CONCURRENT_REQUESTS". The variable "WEB_SEARCH_CONCURRENT_REQUESTS" has been repurposed to control the concurrency of the search engine requests (see above). To control the web loader concurrency (fetching content from results), you MUST use "WEB_LOADER_CONCURRENT_REQUESTS".

Perplexity is different from perplexity_search. If you use perplexity_search, this variable is not relevant to you.

Perplexity is different from perplexity_search. If you use perplexity, this variable is not relevant to you.

When using playwright, you have two options:

Using a remote Playwright browser via PLAYWRIGHT_WS_URL can be beneficial for:

This timeout only applies when WEB_LOADER_ENGINE is set to safe_web or left empty (the default). It has no effect on Playwright or Firecrawl loader engines, which have their own timeout configurations (PLAYWRIGHT_TIMEOUT and Firecrawl's internal settings respectively).

Note: If none of the specified languages are available and en was not in your list, the system will automatically try English as a final fallback.

DEFAULT_IMAGE_PROMPT_GENERATION_PROMPT_TEMPLATE:

One minimalistic working setup for Gemini can look like this:

You can only configure one OAUTH provider at a time. You cannot have two or more OAUTH providers configured simultaneously.

ENABLE_LOGIN_FORM must be set to False when ENABLE_OAUTH_SIGNUP is set to True. Failure to do so will result in the inability to login.

By default, OAuth configurations are stored in the database and managed via the Admin Panel after the initial setup. Set this variable to False to force Open WebUI to always read OAuth settings from the environment variables on every restart. This is ideal for environments using GitOps or immutable infrastructure where configuration is managed exclusively through external files (e.g., Docker Compose, Kubernetes ConfigMaps).

Enabling this option bypasses email-based user identification, which is the standard method for uniquely identifying users across authentication systems. When enabled:

Only enable this if your identity provider does not support email scope and you have alternative user identification mechanisms in place.

This setting is designed for enterprise environments using identity providers that:

For most standard OAuth providers (Google, Microsoft, GitHub, etc.), this setting should remain False.

If the OAuth picture claim is disabled by setting OAUTH_PICTURE_CLAIM to '' (empty string), then setting this variable to true will not update the user profile pictures.

Required for Multi-Replica Deployments In any production environment running more than one instance of Open WebUI (e.g., Docker Swarm, Kubernetes), this variable MUST be explicitly set to a persistent, shared secret. If left unset, each replica will generate or use a different key, causing session decryption to fail intermittently as user requests are load-balanced across instances.

See https://support.google.com/cloud/answer/6158849?hl=en

You must also set OPENID_PROVIDER_URL or otherwise logout may not work.

See https://learn.microsoft.com/en-us/entra/identity-platform/quickstart-register-app

You must also set OPENID_PROVIDER_URL or otherwise logout may not work.

See https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps

You must also set OPENID_PROVIDER_URL or otherwise logout may not work.

See https://open.feishu.cn/document/sso/web-application-sso/login-overview

The environment variable OPENID_PROVIDER_URL MUST be configured, otherwise the logout functionality will not work for most providers. Even when using Microsoft, GitHub or other providers, you MUST set the OPENID_PROVIDER_URL environment variable.

If OAUTH_PICTURE_CLAIM is set to '' (empty string), then the OAuth picture claim is disabled and the user profile pictures will not be saved.

This is useful when you need a JWT access token for downstream validation or when your OAuth provider requires an audience hint for proper token generation. For Auth0, this is typically your API identifier (e.g., https://your-api.auth0.com/api/v2/). For Ory, specify the resource server you want to access.

For API Key creation (and the API keys themselves) to work, you not only need to give specific user groups the permission for it, but also enable it globally using ENABLE_API_KEYS

These variables are not specific to Open WebUI but can still be valuable in certain contexts.

If the endpoint is an S3-compatible provider like MinIO that uses a TLS certificate signed by a private CA, set the environment variable AWS_CA_BUNDLE to the path of your PEM-encoded CA certificates file. See the Amazon SDK Docs for more information.

For PostgreSQL support, ensure you installed with pip install open-webui[all] instead of the basic installation. Supports SQLite, Postgres, and encrypted SQLite via SQLCipher. Changing the URL does not migrate data between databases.

Documentation on the URL scheme is available here.

If your database password contains special characters, please ensure they are properly URL-encoded. For example, a password like p@ssword should be encoded as p%40ssword.

For configuration using individual parameters or encrypted SQLite, see the relevant sections below.

Required for Multi-Replica Setups For multi-replica or high-availability deployments (Kubernetes, Docker Swarm), you MUST use an external database (PostgreSQL) instead of SQLite. SQLite does not support concurrent writes from multiple instances and will result in database corruption or data inconsistency.

When DATABASE_URL is not explicitly set, Open WebUI will attempt to construct it using a combination of DATABASE_TYPE, DATABASE_USER, DATABASE_PASSWORD, DATABASE_HOST, DATABASE_PORT, and DATABASE_NAME. For this automatic construction to occur, all of these individual parameters must be provided. If any are missing, the default DATABASE_URL (SQLite file) or any explicitly set DATABASE_URL will be used instead.

For enhanced security, Open WebUI supports at-rest encryption for its primary SQLite database using SQLCipher. This is recommended for deployments handling sensitive data where using a larger database like PostgreSQL is not needed.

SQLCipher encryption requires additional dependencies that are not included by default. Before using this feature, you must install:

For Docker users, this means building a custom image with these dependencies included.

To enable encryption, you must configure two environment variables:

When these are set and a full DATABASE_URL is not explicitly defined, Open WebUI will automatically create and use an encrypted database file at ./data/webui.db.

Ensure the database password is kept secure, as it is needed to decrypt and access all application data.

More information about this setting can be found here.

More information about this setting can be found here.

More information about this setting can be found here.

Required for Multi-Worker and Multi-Node Deployments

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set the REDIS_URL value. Without it, the following issues will occur:

Redis serves as the central state store that allows multiple Open WebUI instances to coordinate and share critical application data.

Single Instance Deployments

If you're running Open WebUI as a single instance with UVICORN_WORKERS=1 (the default), Redis is not required. The application will function normally without it.

This option has no effect if REDIS_SENTINEL_HOSTS is defined.

Critical for Redis Sentinel Deployments

Without a socket connection timeout, Redis Sentinel failover can cause the application to hang indefinitely when a master node goes offline. The application may become completely unresponsive and even fail to restart.

For Sentinel deployments, it is strongly recommended to set this value (e.g., REDIS_SOCKET_CONNECT_TIMEOUT=5).

Interaction with WEBSOCKET_REDIS_OPTIONS

If you explicitly set WEBSOCKET_REDIS_OPTIONS, this variable will not apply to the AsyncRedisManager used for websocket communication. In that case, you must include socket_connect_timeout directly within WEBSOCKET_REDIS_OPTIONS:

If WEBSOCKET_REDIS_OPTIONS is not set, REDIS_SOCKET_CONNECT_TIMEOUT will be applied to websocket connections automatically.

Required for Multi-Worker and Multi-Node Deployments

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set this variable. Without it, the following issues will occur:

Required for Multi-Worker and Multi-Node Deployments

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set this variable. Without it, the following issues will occur:

Required for Multi-Worker and Multi-Node Deployments

When deploying Open WebUI with UVICORN_WORKERS > 1 or in a multi-node/worker cluster with a load balancer (e.g. helm/kubectl/kubernetes/k8s, you must set this variable. Without it, the following issues will occur:

This option has no effect if WEBSOCKET_SENTINEL_HOSTS is defined.

AWS SSM and Docker compose cannot ingest raw JSON, as such you need to escape any double quotes like the following: {\"retry_on_timeout\": true, \"socket_connect_timeout\": 5, \"socket_timeout\": 5, \"max_connections\": 8}

Precedence with REDIS_SOCKET_CONNECT_TIMEOUT

When this variable is left empty (default), REDIS_SOCKET_CONNECT_TIMEOUT is automatically applied to websocket connections if set. However, if you explicitly set WEBSOCKET_REDIS_OPTIONS to any value, REDIS_SOCKET_CONNECT_TIMEOUT will not be injected—you must include socket_connect_timeout manually within this JSON if needed.

This can be very verbose, it is only recommended to use this flag when debugging Redis related issues.

This can be very verbose, it is only recommended to use this flag when debugging Redis related issues.

Experimental Feature - Known Limitations

This feature is currently experimental and has known compatibility issues:

Only enable this setting if:

For most deployments, the default browser cookie-based session management is sufficient and more stable.

When deploying in orchestrated environments like Kubernetes or using Helm charts, it's recommended to keep UVICORN_WORKERS set to 1. Container orchestration platforms already provide their own scaling mechanisms through pod replication, and using multiple workers inside containers can lead to resource allocation issues and complicate horizontal scaling strategies.

If you use UVICORN_WORKERS, you also need to ensure that related environment variables for scalable multi-worker setups are set accordingly.

When UVICORN_WORKERS > 1, starting the application can trigger concurrent database migrations from multiple worker processes, potentially causing database schema corruption or inconsistent states.

Recommendation: After pulling a new image or installing an update, always run Open WebUI with a single worker (UVICORN_WORKERS=1) first. This ensures the database migration completes successfully in a single process. Once the migration is finished and the application has started, you can then restart it with your desired number of workers.

For Kubernetes, Helm, Minikube, and other orchestrated setups: Ensure that your deployment strategy allows for a single-replica or single-worker init container/job to handle migrations before scaling up to multiple replicas or workers. This is critical to prevent race conditions during schema updates.

Open WebUI supports using proxies for HTTP and HTTPS retrievals. To specify proxy settings, Open WebUI uses the following environment variables:

Open WebUI provides environment variables to customize the pip installation process. Below are the environment variables used by Open WebUI for adjusting package installation behavior:

**Examples:**

Example 1 (bash):
```bash
open-webui serve --port 9999
```

Example 2 (json):
```json
[{"id": "string", "type": "string [info, success, warning, error]", "title": "string", "content": "string", "dismissible": false, "timestamp": 1000}]
```

Example 3 (text):
```text
WEBUI_BANNERS="[{\"id\": \"1\", \"type\": \"warning\", \"title\": \"Your messages are stored.\", \"content\": \"Your messages are stored and may be reviewed by human people. LLM's are prone to hallucinations, check sources.\", \"dismissible\": true, \"timestamp\": 1000}]"
```

Example 4 (json):
```json
[{"title": ["Title part 1", "Title part 2"], "content": "prompt"}]
```

---

## Exporting and Importing Database

**URL:** https://docs.openwebui.com/tutorials/maintenance/database

**Contents:**
- Exporting and Importing Database
  - Exporting Database​
  - Importing Database​
  - Notes​
  - Why It's Important​
- Related Guides​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

If you need to migrate your Open WebUI data (e.g., chat histories, configurations, etc.) from one server to another or back it up for later use, you can export and import the database. This guide assumes you're running Open WebUI using the internal SQLite database (not PostgreSQL).

Follow the steps below to export and import the webui.db file, which contains your database.

To export the database from your current Open WebUI instance:

Use docker cp to copy the database file: The webui.db file is located in the container inside the directory /app/backend/data. Run the following command to copy it into your local machine:

Transfer the exported file to the new server: You can use FileZilla or any other file transfer tool of your choice to move the webui.db file to the new server.

FileZilla is recommended for its ease of use when transferring files to the new server.

After moving the webui.db file to the new server, follow these steps:

Install and Run Open WebUI on the New Server: Set up and run Open WebUI using a Docker container. Follow the instructions provided in the 🚀 Getting Started to install and start the Open WebUI container. Once it's running, stop it before performing the import step.

Use docker cp to copy the database file to the container: Assuming the exported webui.db file is in your current working directory, copy it into the container:

Start the Open WebUI container: Start the container again to use the imported database.

The new server should now be running Open WebUI with your imported database.

This approach is particularly useful when:

With these steps, you can easily manage your Open WebUI migration or backup process. Keep in mind the database format you're using to ensure compatibility.

**Examples:**

Example 1 (bash):
```bash
docker cp open-webui:/app/backend/data/webui.db ./webui.db
```

Example 2 (bash):
```bash
docker stop open-webui
```

Example 3 (bash):
```bash
docker cp ./webui.db open-webui:/app/backend/data/webui.db
```

Example 4 (bash):
```bash
docker start open-webui
```

---

## Firefox AI Chatbot Sidebar

**URL:** https://docs.openwebui.com/tutorials/integrations/firefox-sidebar

**Contents:**
- Firefox AI Chatbot Sidebar
- 🦊 Firefox AI Chatbot Sidebar​
- Integrating Open WebUI as a Local AI Chatbot Browser Assistant in Mozilla Firefox
- Prerequisites​
- Enabling AI Chatbot in Firefox​
- Configuring about:config Settings​
  - browser.ml.chat.prompts.{#}​
  - browser.ml.chat.provider​
- URL Parameters for Open WebUI​
  - Models and Model Selection​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

Before integrating Open WebUI as a AI chatbot browser assistant in Mozilla Firefox, ensure you have:

Alternatively, you can enable AI Chatbot through the about:config page (described in the next section).

To add custom prompts, follow these steps:

The following URL parameters can be used to customize your Open WebUI instance:

See https://docs.openwebui.com/features/chat-features/url-params for more info on URL parameters and how to use them.

The following about:config settings can be adjusted for further customization:

To access the AI chatbot sidebar, use one of the following methods:

---

## HAProxy Configuration for Open WebUI

**URL:** https://docs.openwebui.com/tutorials/https/haproxy

**Contents:**
- HAProxy Configuration for Open WebUI
- Install HAProxy and Let's Encrypt​
  - Redhat derivatives​
  - Debian derivatives​
- HAProxy Configuration Basics​
- Issuing SSL Certificates with Let's Encrypt​
- HAProxy Manager (Easy Deployment Option)​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

HAProxy (High Availability Proxy) is specialized load-balancing and reverse proxy solution that is highly configurable and designed to handle large amounts of connections with a relatively low resource footprint. for more information, please see: https://www.haproxy.org/

First, install HAProxy and Let's Encrypt's certbot:

sudo dnf install haproxy certbot openssl -y

sudo apt install haproxy certbot openssl -y

HAProxy's configuration is by default stored in /etc/haproxy/haproxy.cfg. This file contains all the configuration directives that determine how HAProxy will operate.

The base configuration for HAProxy to work with Open WebUI is pretty simple.

You will see that we have ACL records (routers) for both Open WebUI and Let's Encrypt. To use WebSocket with OWUI, you need to have an SSL configured, and the easiest way to do that is to use Let's Encrypt.

You can use either the subdomain method or the path method for routing traffic to Open WebUI. The subdomain method requires a dedicated subdomain (e.g., chat.yourdomain.com), while the path method allows you to access Open WebUI through a specific path on your domain (e.g., yourdomain.com/owui/). Choose the method that best suits your needs and update the configuration accordingly.

You will need to expose port 80 and 443 to your HAProxy server. These ports are required for Let's Encrypt to validate your domain and for HTTPS traffic. You will also need to ensure your DNS records are properly configured to point to your HAProxy server. If you are running HAProxy at home, you will need to use port forwarding in your router to forward ports 80 and 443 to your HAProxy server.

Before starting HAProxy, you will want to generate a self signed certificate to use as a placeholder until Let's Encrypt issues a proper one. Here's how to generate a self-signed certificate:

Then combine the key and certificate into a PEM file that HAProxy can use:

cat /tmp/haproxy.crt /tmp/haproxy.key > /etc/haproxy/certs/haproxy.pem

Make sure you update the HAProxy configuration based on your needs and configuration.

Once you have your HAProxy configuration set up, you can use certbot to obtain and manage your SSL certificates. Certbot will handle the validation process with Let's Encrypt and automatically update your certificates when they are close to expiring (assuming you use the certbot auto-renewal service).

You can validate the HAProxy configuration by running haproxy -c -f /etc/haproxy/haproxy.cfg. If there are no errors, you can start HAProxy with systemctl start haproxy and verify it's running with systemctl status haproxy.

To ensure HAProxy starts with the system, systemctl enable haproxy.

When you have HAProxy configured, you can use Let's encrypt to issue your valid SSL certificate. First, you will need to register with Let's Encrypt. You should only need to do this one time:

certbot register --agree-tos --email your@email.com --non-interactive

Then you can request your certificate:

Once the certificate is issued, you will need to merge the certificate and private key files into a single PEM file that HAProxy can use.

You can then restart HAProxy to apply the new certificate: systemctl restart haproxy

If you would like to have something manage your HAProxy configuration and Let's Encrypt SSLs automatically, I have written a simple python script and created a docker container you can use to create and manage your HAProxy config and manage the Let's Encrypt certificate lifecycle.

https://github.com/shadowdao/haproxy-manager

Please do not expose port 8000 publicly if you use the script or container!

**Examples:**

Example 1 (shell):
```shell
#---------------------------------------------------------------------# Global settings#---------------------------------------------------------------------global    # to have these messages end up in /var/log/haproxy.log you will    # need to:    #    # 1) configure syslog to accept network log events. This is done    #    by adding the '-r' option to the SYSLOGD_OPTIONS in    #    /etc/sysconfig/syslog    #    # 2) configure local2 events to go to the /var/log/haproxy.log    #   file. A line like the following can be added to    #   /etc/sysconfig/syslog    #    #    local2.*                       /var/log/haproxy.log    #    log         127.0.0.1 local2    chroot      /var/lib/haproxy    pidfile     /var/run/haproxy.pid    maxconn     4000    user        haproxy    group       haproxy    daemon #adjust the dh-param if too low    tune.ssl.default-dh-param 2048#---------------------------------------------------------------------# common defaults that all the 'listen' and 'backend' sections will# use if not designated in their block#---------------------------------------------------------------------defaults    mode                    http    log                     global    option                  httplog    option                  dontlognull    option http-server-close    option forwardfor       #except 127.0.0.0/8    option                  redispatch    retries                 3    timeout http-request    300s    timeout queue           2m    timeout connect         120s    timeout client          10m    timeout server          10m    timeout http-keep-alive 120s    timeout check           10s    maxconn                 3000#httpfrontend web #Non-SSL    bind 0.0.0.0:80 #SSL/TLS bind 0.0.0.0:443 ssl crt /path/to/ssl/folder/    #Let's Encrypt SSL    acl letsencrypt-acl path_beg /.well-known/acme-challenge/    use_backend letsencrypt-backend if letsencrypt-acl #Subdomain method    acl chat-acl hdr(host) -i subdomain.domain.tld    #Path Method    acl chat-acl path_beg /owui/    use_backend owui_chat if chat-acl#Pass SSL Requests to Lets Encryptbackend letsencrypt-backend    server letsencrypt 127.0.0.1:8688#OWUI Chatbackend owui_chat    # add X-FORWARDED-FOR    option forwardfor    # add X-CLIENT-IP    http-request add-header X-CLIENT-IP %[src] http-request set-header X-Forwarded-Proto https if { ssl_fc }    server chat <ip>:3000
```

Example 2 (shell):
```shell
openssl req -x509 -newkey rsa:2048 -keyout /tmp/haproxy.key -out /tmp/haproxy.crt -days 3650 -nodes -subj "/CN=localhost"
```

Example 3 (shell):
```shell
certbot certonly -n --standalone --preferred-challenges http --http-01-port-8688 -d yourdomain.com
```

Example 4 (shell):
```shell
cat /etc/letsencrypt/live/{domain}/fullchain.pem /etc/letsencrypt/live/{domain}/privkey.pem > /etc/haproxy/certs/{domain}.pemchmod 600 /etc/haproxy/certs/{domain}.pemchown haproxy:haproxy /etc/haproxy/certs/{domain}.pem
```

---

## Helicone Integration with Open WebUI

**URL:** https://docs.openwebui.com/tutorials/integrations/helicone

**Contents:**
- Helicone Integration with Open WebUI
- How to integrate Helicone with OpenWebUI​
  - Step 1: Create a Helicone account and generate your API key​
  - Step 2: Create an OpenAI account and generate your API key​
  - Step 3: Run your Open WebUI application using Helicone's base URL​
  - Step 4: Make sure monitoring is working​
- Learn more​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

Helicone is an open-source LLM observability platform for developers to monitor, debug, and improve production-ready applications, including your Open WebUI deployment.

By enabling Helicone, you can log LLM requests, evaluate and experiment with prompts, and get instant insights that helps you push changes to production with confidence.

Create a Helicone account and log in to generate an API key.

— Make sure to generate a write only API key. This ensures you only allow logging data to Helicone without read access to your private data.

Create an OpenAI account and log into OpenAI's Developer Portal to generate an API key.

To launch your first Open WebUI application, use the command from Open WebUI docs and include Helicone's API BASE URL so you can query and monitor automatically.

If you already have a Open WebUI application deployed, go to the Admin Panel > Settings > Connections and click on the + sign for "Managing OpenAI API Connections". Update the following properties:

To make sure your integration is working, log into Helicone's dashboard and review the "Requests" tab.

You should see the requests you have made through your Open WebUI interface already being logged into Helicone.

For a comprehensive guide on Helicone, you can check out Helicone's documentation.

**Examples:**

Example 1 (bash):
```bash
# Set your environment variables   export HELICONE_API_KEY=<YOUR_API_KEY>   export OPENAI_API_KEY=<YOUR_OPENAI_API_KEY>   # Run Open WebUI with Helicone integration   docker run -d -p 3000:8080 \     -e OPENAI_API_BASE_URL="https://oai.helicone.ai/v1/$HELICONE_API_KEY" \     -e OPENAI_API_KEY="$OPENAI_API_KEY" \     --name open-webui \     ghcr.io/open-webui/open-webui
```

---

## HTTPS using Caddy

**URL:** https://docs.openwebui.com/tutorials/https/caddy

**Contents:**
- HTTPS using Caddy
- HTTPS Using Caddy​
- Docker​
  - Installing Docker​
- OpenWebUI​
  - Installing OpenWebUI​
- Caddy​
  - Installing Caddy​
  - Configure Caddy​
- Testing HTTPS​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

Ensuring secure communication between your users and the Open WebUI is paramount. HTTPS (HyperText Transfer Protocol Secure) encrypts the data transmitted, protecting it from eavesdroppers and tampering. By configuring Caddy as a reverse proxy, you can seamlessly add HTTPS to your Open WebUI deployment, enhancing both security and trustworthiness.

This guide is simple walkthrough to set up a Ubuntu server with Caddy as a reverse proxy for Open WebUI, enabling HTTPS with automatic certificate management.

There's a few steps we'll follow to get everything set up:

Follow the guide to set up Docker's apt repository Docker

I've included docker-compose as it's needed to run docker compose.

Here's the command I've used to install Docker on Ubuntu:

I'd go ahead and create a directory for the Open WebUI project:

Create a docker-compose.yml file in the ~/open-webui directory. I've left in a commented section for setting some environment varibles for Qdrant, but you can follow that for any other environment variables you might need to set.

Caddy is a powerful web server that automatically manages TLS certificates for you, making it an excellent choice for serving Open WebUI over HTTPS.

Follow the guide to set up Caddy's on Ubuntu.

You're going to need to change the CaddyFile to use your domain.

To do that, edit the file /etc/caddy/Caddyfile.

Then the configuration should have the following:

Make sure to replace your-domain.com with your actual domain name.

Now assuming you've already set up your DNS records to point to your server's IP address, you should be able to test if Open WebUI is accessible via HTTPS by running docker compose up in the ~/open-webui directory.

You should now be able to access Open WebUI at https://your-domain.com.

I wanted to include a quick note on how to update Open WebUI without losing your data. Since we're using a volume to store the data, you can simply pull the latest image and restart the container.

First we need to stop and remove the existing container:

Then you can start the container again:

Now you can start the Open WebUI container again:

**Examples:**

Example 1 (bash):
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose
```

Example 2 (bash):
```bash
mkdir -p ~/open-webuicd ~/open-webui
```

Example 3 (yaml):
```yaml
services:    open-webui:        image: ghcr.io/open-webui/open-webui:main        container_name: open-webui        ports:            - "8080:8080"        volumes:            - ./data:/app/backend/data        # environment:        #     - "QDRANT_API_KEY=API_KEY_HERE"        #     - "QDRANT_URI=https://example.com"        restart: unless-stopped
```

Example 4 (bash):
```bash
sudo nano /etc/caddy/Caddyfile
```

---

## HTTPS using Nginx

**URL:** https://docs.openwebui.com/tutorials/https/nginx

**Contents:**
- HTTPS using Nginx
  - Nginx Proxy Manager​
    - Prerequisites​
    - Nginx Proxy Manager Steps​
        - Here is a simple example how it's done in https://www.duckdns.org/domains​
    - Access the WebUI​
  - Let's Encrypt​
    - Prerequisites​
  - Step 1: Initial Setup for Certificate Validation​
  - Step 2: Obtain the SSL Certificate​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

Ensuring secure communication between your users and the Open WebUI is paramount. HTTPS (HyperText Transfer Protocol Secure) encrypts the data transmitted, protecting it from eavesdroppers and tampering. By configuring Nginx as a reverse proxy, you can seamlessly add HTTPS to your Open WebUI deployment, enhancing both security and trustworthiness.

This guide provides three methods to set up HTTPS:

A very common and difficult-to-debug issue with WebSocket connections is a misconfigured Cross-Origin Resource Sharing (CORS) policy. When running Open WebUI behind a reverse proxy like Nginx Proxy Manager, you must set the CORS_ALLOW_ORIGIN environment variable in your Open WebUI configuration.

Failure to do so will cause WebSocket connections to fail, even if you have enabled "Websockets support" in Nginx Proxy Manager.

Choose the method that best fits your deployment needs.

Nginx Proxy Manager (NPM) allows you to easily manage reverse proxies and secure your local applications, like Open WebUI, with valid SSL certificates from Let's Encrypt. This setup enables HTTPS access, which is necessary for using voice input features on many mobile browsers due to their security requirements, without exposing the application's specific port directly to the internet.

Create Directories for Nginx Files:

Set Up Nginx Proxy Manager with Docker:

Configure DNS and Domain:

Access Nginx Proxy Manager at http://server_ip:81. For example: 192.168.0.6:81

Log in with the default credentials (admin@example.com / changeme). Change them as asked.

Go to SSL Certificates → Add SSL Certificate → Let's Encrypt.

Write your email and domain name you got from DuckDNS. One domain name contains an asterisk and another does not. Example: *.hello.duckdns.org and hello.duckdns.org.

Select Use a DNS challenge, choose DuckDNS, and paste your API token. example: dns_duckdns_token=f4e2a1b9-c78d-e593-b0d7-67f2e1c9a5b8

Agree to Let’s Encrypt terms and save. Change propagation time if needed (120 seconds).

For each service (e.g., openwebui, nextcloud), go to Hosts → Proxy Hosts → Add Proxy Host.

Fill in the domain name (e.g., openwebui.hello.duckdns.org).

Set the scheme to HTTP (default), enable Websockets support and point to your Docker IP (if docker with open-webui is running on the same computer as NGINX manager, this will be the same IP as earlier (example: 192.168.0.6)

Select the SSL certificate generated earlier, force SSL, and enable HTTP/2.

A very common and difficult-to-debug issue with WebSocket connections is a misconfigured Cross-Origin Resource Sharing (CORS) policy. When running Open WebUI behind a reverse proxy like Nginx Proxy Manager, you must set the CORS_ALLOW_ORIGIN environment variable in your Open WebUI configuration.

Failure to do so will cause WebSocket connections to fail, even if you have enabled "Websockets support" in Nginx Proxy Manager.

While Nginx Proxy Manager handles most configuration automatically, be aware that:

The default NPM configuration handles this correctly - only modify caching if you know what you're doing.

Example: If you access your UI at https://openwebui.hello.duckdns.org, you must set:

You can also provide a semicolon-separated list of allowed domains. Do not skip this step.

Access Open WebUI via HTTPS at either hello.duckdns.org or openwebui.hello.duckdns.org (in whatever way you set it up).

Firewall Note: Be aware that local firewall software (like Portmaster) might block internal Docker network traffic or required ports. If you experience issues, check your firewall rules to ensure necessary communication for this setup is allowed.

Let's Encrypt provides free SSL certificates trusted by most browsers, ideal for securing your production environment. 🔐

This guide uses a two-phase approach:

Heads up! Let's Encrypt cannot issue certificates for an IP address. You must use a domain name.

First, we'll set up the necessary files and a temporary Nginx configuration that allows Let's Encrypt's servers to verify your domain.

Make sure you followed the Prerequisites above.

Create the Directory Structure

From your project's root directory, run this command to create folders for your Nginx configuration and Let's Encrypt certificates:

Create a Temporary Nginx Configuration

Create the file nginx/conf.d/open-webui.conf. This initial config only listens on port 80 and serves the validation files for Certbot.

⚠️ Remember to replace <YOUR_DOMAIN_NAME> with your actual domain.

Update Your docker-compose.yml

Add the nginx service to your docker-compose.yml and ensure your open-webui service is configured to use the shared Docker network.

Now we'll run a script that uses Docker to fetch the certificate.

Create the Certificate Request Script

Create an executable script named enable_letsencrypt.sh in your project root.

⚠️ Remember to replace <YOUR_DOMAIN_NAME> and <YOUR_EMAIL_ADDRESS> with your actual information.

Make the Script Executable

Execute the script. It will automatically start Nginx, request the certificate, and then stop Nginx.

When using NGINX with Open WebUI, proper caching is crucial for performance while ensuring authentication remains secure. The configuration below includes:

The configuration below implements these rules automatically.

With the certificate saved in your ssl directory, you can now update the Nginx configuration to enable HTTPS.

Update the Nginx Configuration for SSL

Replace the entire contents of nginx/conf.d/open-webui.conf with the final configuration below.

⚠️ Replace all 4 instances of <YOUR_DOMAIN_NAME> with your domain.

Start both Nginx and Open WebUI with the final, secure configuration.

You can now access your Open WebUI instance securely via HTTPS.

➡️ https://<YOUR_DOMAIN_NAME>

Let's Encrypt certificates expire every 90 days. You should set up a cron job to renew them automatically.

Open the crontab editor:

Add the following line to run a renewal check every day at 3:30 AM. It will only renew if the certificate is close to expiring.

Using self-signed certificates is suitable for development or internal use where trust is not a critical concern.

Create Directories for Nginx Files:

Create Nginx Configuration File:

conf.d/open-webui.conf:

Generate Self-Signed SSL Certificates:

Update Docker Compose Configuration:

Add the Nginx service to your docker-compose.yml:

Access Open WebUI via HTTPS at:

https://your_domain_or_IP

For basic internal/development installations, you can use nginx and a self-signed certificate to proxy Open WebUI to https, allowing use of features such as microphone input over LAN. (By default, most browsers will not allow microphone input on insecure non-localhost urls)

This guide assumes you installed Open WebUI using pip and are running open-webui serve

You will first need to install openssl

You can download and install precompiled binaries from the Shining Light Productions (SLP) website.

Alternatively, if you have Chocolatey installed, you can use it to install OpenSSL quickly:

Open a command prompt or PowerShell.

Run the following command to install OpenSSL:

After installation, open a command prompt and type:

If it displays the OpenSSL version (e.g., OpenSSL 3.x.x ...), it is installed correctly.

Download the official Nginx for Windows from nginx.org or use a package manager like Chocolatey. Extract the downloaded ZIP file to a directory (e.g., C:\nginx).

Run the following command:

Move the generated nginx.key and nginx.crt files to a folder of your choice, or to the C:\nginx directory

Open C:\nginx\conf\nginx.conf in a text editor

If you want Open WebUI to be accessible over your local LAN, be sure to note your LAN ip address using ipconfig e.g., 192.168.1.15

Set it up as follows:

Save the file, and check the configuration has no errors or syntax issues by running nginx -t. You may need to cd C:\nginx first depending on how you installed it

Run nginx by running nginx. If an nginx service is already started, you can reload new config by running nginx -s reload

You should now be able to access Open WebUI on https://192.168.1.15 (or your own LAN ip as appropriate). Be sure to allow windows firewall access as needed.

After setting up HTTPS, access Open WebUI securely at:

Ensure that your DNS records are correctly configured if you're using a domain name. For production environments, it's recommended to use Let's Encrypt for trusted SSL certificates.

**Examples:**

Example 1 (bash):
```bash
mkdir ~/nginx_configcd ~/nginx_config
```

Example 2 (bash):
```bash
nano docker-compose.yml
```

Example 3 (yaml):
```yaml
services:  app:    image: 'jc21/nginx-proxy-manager:latest'    restart: unless-stopped    ports:      - '80:80'      - '81:81'      - '443:443'    volumes:      - ./data:/data      - ./letsencrypt:/etc/letsencrypt
```

Example 4 (bash):
```bash
docker-compose up -d
```

---

## Improve Local LLM Performance with Dedicated Task Models

**URL:** https://docs.openwebui.com/tutorials/tips/improve-performance-local

**Contents:**
- Improve Local LLM Performance with Dedicated Task Models
- Improve Performance with Dedicated Task Models​
- Why Does Open-WebUI Feel Slow?​
- ⚡ How to Optimize Task Model Performance​
  - Step 1: Access the Admin Panel​
  - Step 2: Configure the Task Model​
  - Step 3: Save Your Changes and Test​
- 🚀 Recommended Setup for Local Models​
- ⚙️ Environment Variables for Performance​
  - Task Model Configuration​

Open-WebUI provides several automated features—such as title generation, tag creation, autocomplete, and search query generation—to enhance the user experience. However, these features can generate multiple simultaneous requests to your local model, which may impact performance on systems with limited resources.

This guide explains how to optimize your setup by configuring a dedicated, lightweight task model or by selectively disabling automation features, ensuring that your primary chat functionality remains responsive and efficient.

By default, Open-WebUI has several background tasks that can make it feel like magic but can also place a heavy load on local resources:

Each of these features makes asynchronous requests to your model. For example, continuous calls from the autocomplete feature can significantly delay responses on devices with limited memory or processing power, such as a Mac with 32GB of RAM running a 32B quantized model.

Optimizing the task model can help isolate these background tasks from your main chat application, improving overall responsiveness.

Follow these steps to configure an efficient task model:

Go to Interface > Set Task Model.

Choose one of the following options based on your needs:

Lightweight Local Model (Recommended)

Hosted API Endpoint (For Maximum Speed)

When using OpenRouter, we highly recommend configuring the Model IDs (Allowlist) in the connection settings. Importing thousands of models can clutter your selector and degrade admin panel performance.

Disable Unnecessary Automation

Implementing these recommendations can greatly improve the responsiveness of Open-WebUI while allowing your local models to efficiently handle chat interactions.

You can also configure performance-related settings via environment variables. Add these to your Docker Compose file or .env file.

Many of these settings can also be configured directly in the Admin Panel > Settings interface. Environment variables are useful for initial deployment configuration or when managing settings across multiple instances.

Set a dedicated lightweight model for background tasks:

For larger instances with many concurrent users:

For a complete list of environment variables, see the Environment Variable Configuration documentation.

By applying these configuration changes, you'll support a more responsive and efficient Open-WebUI experience, allowing your local LLM to focus on delivering high-quality chat interactions without unnecessary delays.

**Examples:**

Example 1 (bash):
```bash
# For Ollama modelsTASK_MODEL=llama3.2:3b# For OpenAI-compatible endpointsTASK_MODEL_EXTERNAL=gpt-4o-mini
```

Example 2 (bash):
```bash
# Disable automatic title generationENABLE_TITLE_GENERATION=False# Disable follow-up question suggestionsENABLE_FOLLOW_UP_GENERATION=False# Disable autocomplete suggestions (triggers on every keystroke - high impact!)ENABLE_AUTOCOMPLETE_GENERATION=False# Disable automatic tag generationENABLE_TAGS_GENERATION=False# Disable search query generation for RAG (if not using web search)ENABLE_SEARCH_QUERY_GENERATION=False# Disable retrieval query generationENABLE_RETRIEVAL_QUERY_GENERATION=False
```

Example 3 (bash):
```bash
# Cache model list responses (seconds) - reduces API callsMODELS_CACHE_TTL=300# Cache LLM-generated search queries - eliminates duplicate LLM calls when both web search and RAG are activeENABLE_QUERIES_CACHE=True# Convert base64 images to file URLs - reduces response size and database strainENABLE_CHAT_RESPONSE_BASE64_IMAGE_URL_CONVERSION=True# Batch streaming tokens to reduce CPU load (recommended: 5-10 for high concurrency)CHAT_RESPONSE_STREAM_DELTA_CHUNK_SIZE=5# Enable gzip compression for HTTP responses (enabled by default)ENABLE_COMPRESSION_MIDDLEWARE=True
```

Example 4 (bash):
```bash
# Disable real-time chat saving for better performance (trades off data persistence)ENABLE_REALTIME_CHAT_SAVE=False
```

---

## Integrate with Amazon Bedrock

**URL:** https://docs.openwebui.com/tutorials/integrations/amazon-bedrock

**Contents:**
- Integrate with Amazon Bedrock
- Integrating Open-WebUI with Amazon Bedrock
- Prerequisites​
- What is Amazon Bedrock​
- Integration Steps
- Step 1: Verify access to Amazon Bedrock Base Models​
- Step 2: Configure the Bedrock Access Gateway​
- Step 3: Add Connection in Open-WebUI​
- Step 4: Start using Bedrock Base Models​
- Other Helpful Tutorials​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

In this tutorial, we'll explore one of the most common and popular approaches to integrate Open-WebUI with Amazon Bedrock.

In order to follow this tutorial, you must have the following:

Direct from AWS' website:

"Amazon Bedrock is a fully managed service that offers a choice of high-performing foundation models (FMs) from leading AI companies like AI21 Labs, Anthropic, Cohere, Luma, Meta, Mistral AI, poolside (coming soon), Stability AI, and Amazon through a single API, along with a broad set of capabilities you need to build generative AI applications with security, privacy, and responsible AI. Using Amazon Bedrock, you can easily experiment with and evaluate top FMs for your use case, privately customize them with your data using techniques such as fine-tuning and Retrieval Augmented Generation (RAG), and build agents that execute tasks using your enterprise systems and data sources. Since Amazon Bedrock is serverless, you don't have to manage any infrastructure, and you can securely integrate and deploy generative AI capabilities into your applications using the AWS services you are already familiar with."

To learn more about Bedrock, visit: Amazon Bedrock's Official Page

Before we can integrate with Bedrock, you first have to verify that you have access to at least one, but preferably many, of the available Base Models. At the time of this writing (Feb 2025), there were 47 base models available. You can see in the screenshot below that I have access to multiple models. You'll know if you have access to a model if it says "✅ Access Granted" next to the model. If you don't have access to any models, you will get an error on the next step.

AWS provides good documentation for request accessing / enabling these models in the Amazon Bedrock's Model Access Docs

Now that we have access to at least one Bedrock base model, we need to configure the Bedrock Access Gateway, or BAG. You can think of the BAG as kind of proxy or middleware developed by AWS that wraps around AWS native endpoints/SDK for Bedrock and, in turn, exposes endpoints that are compatible with OpenAI's schema, which is what Open-WebUI requires.

For reference, here is a simple mapping between the endpoints:

The BAG repo can be found in the Bedrock Access Gateway Repo

To set-up the BAG, follow the below steps:

We're now ready to build and launch the docker container using:

You should now be able to access the BAG's swagger page at: http://localhost:8000/docs

Now that you the BAG up-and-running, it's time to add it as a new connection in Open-WebUI.

You should now see all your Bedrock models available!

These are a few other very helpful tutorials when working to integrate Open-WebUI with Amazon Bedrock.

**Examples:**

Example 1 (bash):
```bash
docker build . -f Dockerfile -t bedrock-gatewaydocker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN -e AWS_REGION=us-east-1 -d -p 8000:80 bedrock-gateway
```

---

## Integrate with OneDrive & SharePoint

**URL:** https://docs.openwebui.com/tutorials/integrations/onedrive-sharepoint/

**Contents:**
- Integrate with OneDrive & SharePoint
- Configuring OneDrive & SharePoint Integration
- Prerequisites​
- Integration for OneDrive for Business & SharePoint (Work/School)
- Step 1: Create the Azure App Registration​
- Step 2: Configure the SPA Redirect URI​
- Step 3: Configure API Permissions​
- Step 4: Gather Credentials for Business Integration​
- Step 5: Configure Environment Variables for Business Integration​
- Integration for Personal OneDrive (Optional)

This tutorial provides a step-by-step guide for integrating Open WebUI with Microsoft OneDrive for Business & SharePoint, as well as the separate, optional integration for Personal Microsoft OneDrive accounts. You can enable one or both integrations. This documentation is up to date as of Open WebUI v0.6.37.

This guide will walk you through the entire process of configuring Open WebUI to allow users to attach files directly from their Microsoft accounts. This process involves creating one or two application registrations in the Microsoft Azure portal and setting the correct environment variables in your Open WebUI instance.

To successfully complete this tutorial, you will need:

This is the primary integration for organizational use. Follow these steps to allow users to access files from their work or school accounts.

First, you need to register an application in your organization's Microsoft Entra ID (formerly Azure AD) tenant.

Open WebUI is a Single-Page Application (SPA) and uses the Microsoft Authentication Library (MSAL). It is critical to configure the Redirect URI correctly.

Next, grant the application permission to read files from OneDrive and SharePoint on behalf of your users.

Admin Consent is Mandatory Open WebUI uses the .default scope for a seamless enterprise experience, meaning it relies on pre-approved permissions. If admin consent is not granted here, non-admin users will be blocked from logging in with an "Admin approval required" error.

From the Overview page of the App Registration you just created, copy the following values:

Set the following environment variables in your Open WebUI deployment to enable the work/school integration:

After setting these variables and restarting Open WebUI, you must also enable the OneDrive toggle in the admin panel. See the Final Step section below for details.

To enable support for personal Microsoft accounts, you must create a second, separate App Registration configured for consumers.

From the Overview page of this new "Personal" App Registration, copy the Application (client) ID. This will be used for a different environment variable.

Add the following environment variable to your Open WebUI deployment:

After setting your environment variables and restarting your Open WebUI instance, you must explicitly enable the feature in the admin panel. The environment variables alone do not activate the integration.

Admin Toggle is Required

This step is mandatory even though you've set ENABLE_ONEDRIVE_INTEGRATION=true in your environment. Some configuration options in Open WebUI are persistent database settings that are initialized on first startup but must be activated through the admin interface.

After enabling the admin toggle and refreshing, verify the integration is working:

Disable Pop-up Blockers!

The OneDrive file picker and authentication flow happen in a pop-up window. If nothing happens when you click a OneDrive option, your browser is almost certainly blocking pop-ups. You must disable the pop-up blocker for your Open WebUI domain for the integration to work. Note that some browsers (like Chrome) may have additional restrictions compared to others (like Edge).

OneDrive option not appearing in the attachment menu:

Files not loading or folders not clickable:

Authentication pop-up not appearing:

You have now successfully configured OneDrive integration, providing seamless file access for your users.

**Examples:**

Example 1 (bash):
```bash
# Enable the OneDrive integration feature globallyENABLE_ONEDRIVE_INTEGRATION=true# --- Business & SharePoint Configuration ---# The Application (client) ID from your Business App RegistrationONEDRIVE_CLIENT_ID_BUSINESS="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"# The Directory (tenant) ID from your Business App RegistrationONEDRIVE_SHAREPOINT_TENANT_ID="yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy"# The root URL of your SharePoint instanceONEDRIVE_SHAREPOINT_URL="https://your-tenant-name.sharepoint.com"
```

Example 2 (bash):
```bash
# --- Personal Account Configuration (Optional) ---# The Application (client) ID from your *second*, Personal App RegistrationONEDRIVE_CLIENT_ID_PERSONAL="zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzzzzzz"
```

---

## Integrate with OneDrive & SharePoint

**URL:** https://docs.openwebui.com/tutorials/integrations/onedrive-sharepoint

**Contents:**
- Integrate with OneDrive & SharePoint
- Configuring OneDrive & SharePoint Integration
- Prerequisites​
- Integration for OneDrive for Business & SharePoint (Work/School)
- Step 1: Create the Azure App Registration​
- Step 2: Configure the SPA Redirect URI​
- Step 3: Configure API Permissions​
- Step 4: Gather Credentials for Business Integration​
- Step 5: Configure Environment Variables for Business Integration​
- Integration for Personal OneDrive (Optional)

This tutorial provides a step-by-step guide for integrating Open WebUI with Microsoft OneDrive for Business & SharePoint, as well as the separate, optional integration for Personal Microsoft OneDrive accounts. You can enable one or both integrations. This documentation is up to date as of Open WebUI v0.6.37.

This guide will walk you through the entire process of configuring Open WebUI to allow users to attach files directly from their Microsoft accounts. This process involves creating one or two application registrations in the Microsoft Azure portal and setting the correct environment variables in your Open WebUI instance.

To successfully complete this tutorial, you will need:

This is the primary integration for organizational use. Follow these steps to allow users to access files from their work or school accounts.

First, you need to register an application in your organization's Microsoft Entra ID (formerly Azure AD) tenant.

Open WebUI is a Single-Page Application (SPA) and uses the Microsoft Authentication Library (MSAL). It is critical to configure the Redirect URI correctly.

Next, grant the application permission to read files from OneDrive and SharePoint on behalf of your users.

Admin Consent is Mandatory Open WebUI uses the .default scope for a seamless enterprise experience, meaning it relies on pre-approved permissions. If admin consent is not granted here, non-admin users will be blocked from logging in with an "Admin approval required" error.

From the Overview page of the App Registration you just created, copy the following values:

Set the following environment variables in your Open WebUI deployment to enable the work/school integration:

After setting these variables and restarting Open WebUI, you must also enable the OneDrive toggle in the admin panel. See the Final Step section below for details.

To enable support for personal Microsoft accounts, you must create a second, separate App Registration configured for consumers.

From the Overview page of this new "Personal" App Registration, copy the Application (client) ID. This will be used for a different environment variable.

Add the following environment variable to your Open WebUI deployment:

After setting your environment variables and restarting your Open WebUI instance, you must explicitly enable the feature in the admin panel. The environment variables alone do not activate the integration.

Admin Toggle is Required

This step is mandatory even though you've set ENABLE_ONEDRIVE_INTEGRATION=true in your environment. Some configuration options in Open WebUI are persistent database settings that are initialized on first startup but must be activated through the admin interface.

After enabling the admin toggle and refreshing, verify the integration is working:

Disable Pop-up Blockers!

The OneDrive file picker and authentication flow happen in a pop-up window. If nothing happens when you click a OneDrive option, your browser is almost certainly blocking pop-ups. You must disable the pop-up blocker for your Open WebUI domain for the integration to work. Note that some browsers (like Chrome) may have additional restrictions compared to others (like Edge).

OneDrive option not appearing in the attachment menu:

Files not loading or folders not clickable:

Authentication pop-up not appearing:

You have now successfully configured OneDrive integration, providing seamless file access for your users.

**Examples:**

Example 1 (bash):
```bash
# Enable the OneDrive integration feature globallyENABLE_ONEDRIVE_INTEGRATION=true# --- Business & SharePoint Configuration ---# The Application (client) ID from your Business App RegistrationONEDRIVE_CLIENT_ID_BUSINESS="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"# The Directory (tenant) ID from your Business App RegistrationONEDRIVE_SHAREPOINT_TENANT_ID="yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy"# The root URL of your SharePoint instanceONEDRIVE_SHAREPOINT_URL="https://your-tenant-name.sharepoint.com"
```

Example 2 (bash):
```bash
# --- Personal Account Configuration (Optional) ---# The Application (client) ID from your *second*, Personal App RegistrationONEDRIVE_CLIENT_ID_PERSONAL="zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzzzzzz"
```

---

## Integrating Continue.dev VS Code Extension with Open WebUI

**URL:** https://docs.openwebui.com/tutorials/integrations/continue-dev

**Contents:**
- Integrating Continue.dev VS Code Extension with Open WebUI
- Download Extension​
- Setup​
  - Example config​
  - Miscellaneous Configuration Settings​
  - Models​
  - Name​
  - Provider​
  - Model​
  - Legacy completions endpoint​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

You can download the VS Code extension on the Visual Studio Marketplace or directly via the EXTENSION:MARKETPLACE within VS Code by searching for continue. Once installed, you can access the application via the continue tab in the side bar of VS Code.

VS Code side bar icon:

Click on the assistant selector to the right of the main chat input. Then hover over Local Assistant and click on the settings icon (⚙️). This will open the config.yaml file in your editor. Here you can change the settings of your Local Assistant.

Currently the ollama provider does not support authentication so we cannot use this provider with Open WebUI. However Ollama and Open WebUI both have compatibility with OpenAI API spec. Read more about the specification in the Ollama blog post on OpenAI compatibility. We can still setup continue.dev to use the openai provider which will allow us to use Open WebUI's authentication token.

Below you find an example config for Llama3 as the model with a local Open WebUI setup.

These values are needed by the extension to work properly. Find more information in the official config guide.

The context section provides additional information to the models. Find more information in the official config guide and in the context provider guide.

The models section is where you specify all models you want to add. Find more information in the official models guide.

Sets the name for the model you want to use. This will be displayed within the chat input of the extension.

Specifies the method used to communicate with the API, which in our case is the OpenAI API endpoint provided by Open WebUI.

This is the actual name of your model in Open WebUI. Navigate to Admin Panel > Settings > Models, and then click on your preferred LLM. Below the user-given name, you'll find the actual model name.

This setting is not needed for Open WebUI, though more information is available in the original guide.

This is a crucial step: you need to direct the continue.dev extension requests to your Open WebUI instance. Either use an actual domain name if the instance is hosted somewhere (e.g., https://example.com/api) or your localhost setup (e.g., http://localhost:3000/api). You can find more information about the URLs in the API Endpoints guide.

To authenticate with your Open WebUI instance, you'll need to generate an API key. Follow the instructions in this guide to create it.

The roles will allow your model to be used by the extension for certain tasks. For the beginning you can choose chat and edit. You can find more information about roles in the official roles guide.

The setup is now completed and you can interact with your model(s) via the chat input. Find more information about the features and usage of the continue.dev plugin in the official documentation.

**Examples:**

Example 1 (yaml):
```yaml
name: Local Assistantversion: 1.0.0schema: v1models:  - name: LLama3    provider: openai    model: Meta-Llama-3-8B-Instruct-Q4_K_M.gguf    env:      useLegacyCompletionsEndpoint: false    apiBase: http://localhost:3000/api    apiKey: YOUR_OPEN_WEBUI_API_KEY    roles:      - chat      - editcontext:  - provider: code  - provider: docs  - provider: diff  - provider: terminal  - provider: problems  - provider: folder  - provider: codebase
```

Example 2 (yaml):
```yaml
name: Local Assistantversion: 1.0.0schema: v1
```

Example 3 (yaml):
```yaml
context:  - provider: code  - provider: docs  - provider: diff  - provider: terminal  - provider: problems  - provider: folder  - provider: codebase
```

Example 4 (yaml):
```yaml
models:  - ...
```

---

## Jupyter Notebook Integration

**URL:** https://docs.openwebui.com/tutorials/integrations/jupyter

**Contents:**
- Jupyter Notebook Integration
- What are Jupyter Notebooks​
- Step 0: Configuration Summary​
- Step 1: Launch OUI and Jupyter
- Step 2: Configure Code Execution for Jupyter
- Step 3: Test the Connection​
  - Create a CSV​
  - Create a Visualization​
  - Create a Notebook​
- Note about workflow​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

[!WARNING] This documentation was created based on the current version (0.5.16) and is constantly being updated.

Starting in v0.5.11, Open-WebUI released a new feature called Jupyter Notebook Support in Code Interpreter. This feature allow you to integrate Open-WebUI with Jupyter. There have already been several improvements to this feauture over the subsequent releases, so review the release notes carefully.

This tutorial walks you through the basics of setting-up the connection between the two services.

Jupyter Notebook is an open-source web application that allows users to create and share documents containing live code, equations, visualizations, and narrative text. It's particularly popular in data science, scientific computing, and education because it enables users to combine executable code (in languages like Python, R, or Julia) with explanatory text, images, and interactive visualizations all in one document. Jupyter Notebooks are especially useful for data analysis and exploration because they allow users to execute code in small, manageable chunks while documenting their thought process and findings along the way. This format makes it easy to experiment, debug code, and create comprehensive, shareable reports that demonstrate both the analysis process and results.

See Jupyter's website for more info at: Project Juptyer

Here is the target configuration we're going to set-up through this tutorial.

To accomplish this, I used docker-compose to launch a stack that includes both services, along with my LLMs, but this should also work if run each docker container separately.

You can launch the above stack by running the below command in the directory where the docker-compose file is saved:

You should now be able to access both services at the following URLs:

When accessing the Jupyter service, you will need the JUPYTER_TOKEN defined above. For this tutorial, I've picked a dummary token value of 123456.

Now that we have Open-WebUI and Jupter running, we need to configure Open-WebUI's Code Execution to use Jupyter under Admin Panel -> Settings -> Code Execution. Since Open-WebUI is constantly releasing and improving this feature, I recommend always reviewing the possible configuraitons in the configs.py file for the latest and greatest. As of v0.5.16, this includes the following:

To start, let's confirm what's in our Jupyter directory. As you can see from the image below, we only have an empty work folder.

Let's run our first prompt. Make sure you've selected the Code Execution button.

We can see the CSVs were created and are now accessible within Jupyter.

Let's run our second prompt. Again, make sure you've selected the Code Execution button.

We can see the visualizations were created and are now accessible within Jupyter.

Let's run our last prompt together. In this prompt, we'll create an entirely new notebook using just a prompt.

We can see the visualizations were created and are now accessible within Jupyter.

While testing this feature, I noticed several times that Open-WebUI would not automatically save the code or output generated within Open-WebUI to my instance of Jupyter. To force it to output the file/item I created, I often followed this two-step workflow, which first creates the code artifact I want and then asks it to save it to my instance of Jupyter.

Are you using the Code Execution feature and/or Jupyter? If so, please reach out. I'd love to hear how you're using it so I can continue adding examples to this tutorial of other awesome ways you can use this feature!

**Examples:**

Example 1 (yaml):
```yaml
version: "3.8"services:open-webui:image: ghcr.io/open-webui/open-webui:latestcontainer_name: open-webuiports:- "3000:8080"volumes:- open-webui:/app/backend/datajupyter:image: jupyter/minimal-notebook:latestcontainer_name: jupyter-notebookports:- "8888:8888"volumes:- jupyter_data:/home/jovyan/workenvironment:- JUPYTER_ENABLE_LAB=yes- JUPYTER_TOKEN=123456volumes:open-webui:jupyter_data:
```

Example 2 (bash):
```bash
docker-compose up -d
```

Example 3 (txt):
```txt
Prompt: Create two CSV files using fake data. The first CSV should be created using vanilla python and the second CSV should be created using the pandas library. Name the CSVs data1.csv and data2.csv
```

Example 4 (txt):
```txt
Prompt: Create several visualizations in python using matplotlib and seaborn and save them to jupyter
```

---

## Keep Your Open WebUI Healthy with Monitoring 🩺

**URL:** https://docs.openwebui.com/getting-started/advanced-topics/monitoring

**Contents:**
- Keep Your Open WebUI Healthy with Monitoring 🩺
- 🚦 Levels of Monitoring​
- Level 1: Basic Health Check Endpoint ✅​
  - Using Uptime Kuma for Basic Health Checks 🐻​
- Level 2: Open WebUI Model Connectivity 🔗​
  - Authentication Setup for API Key 🔑​
  - Using Uptime Kuma for Model Connectivity Monitoring 🐻​
- Level 3: Model Response Testing (Deep Health Check) 🤖​

Monitoring your Open WebUI instance is crucial for ensuring it runs reliably, performs well, and allows you to quickly identify and resolve any issues. This guide outlines three levels of monitoring, from basic availability checks to in-depth model response testing.

We'll cover three levels of monitoring, progressing from basic to more comprehensive:

The simplest level of monitoring is checking the /health endpoint. This endpoint is publicly accessible (no authentication required) and returns a 200 OK status code when the Open WebUI service is running correctly.

You can use curl or any HTTP client to check this endpoint:

Expected Output: A successful health check will return a 200 OK HTTP status code. The content of the response body is usually not important for a basic health check.

Uptime Kuma is a fantastic, open-source, and easy-to-use self-hosted uptime monitoring tool. It's highly recommended for monitoring Open WebUI.

Steps to Set Up in Uptime Kuma:

What This Check Verifies:

To go beyond basic availability, you can monitor the /api/models endpoint. This endpoint requires authentication and verifies that Open WebUI can successfully communicate with your configured model providers (e.g., Ollama, OpenAI) and retrieve a list of available models.

Why Monitor Model Connectivity?

API Endpoint Details:

See the Open WebUI API documentation for full details about the /api/models endpoint and its response structure.

How to Test with curl (Authenticated):

You'll need an API key to access this endpoint. See the "Authentication Setup" section below for instructions on generating an API key.

(Replace YOUR_API_KEY with your actual API key and your-open-webui-instance with your Open WebUI address.)

Expected Output: A successful request will return a 200 OK status code and a JSON response containing a list of models.

Before you can monitor the /api/models endpoint, you need to enable API keys in Open WebUI and generate one:

Enable API Keys (Admin Required):

Generate an API Key (User Settings):

(Optional but Recommended): For security best practices, consider creating a non-administrator user account specifically for monitoring and generate an API key for that user. This limits the potential impact if the monitoring API key is compromised.

If you don't see the API key generation option in your settings, contact your Open WebUI administrator to ensure API keys are enabled.

Create a New Monitor in Uptime Kuma:

Configure JSON Query (Verify Model List):

Add Authentication Headers:

Set Monitoring Interval: Recommended interval: 300 seconds (5 minutes) or longer, as model lists don't typically change very frequently.

Alternative JSON Queries (Advanced):

You can use more specific JSONata queries to check for particular models or providers. Here are some examples:

You can test and refine your JSONata queries at jsonata.org using a sample API response to ensure they work as expected.

For the most comprehensive monitoring, you can test if models are actually capable of processing requests and generating responses. This involves sending a simple chat completion request to the /api/chat/completions endpoint.

Why Test Model Responses?

How to Test with curl (Authenticated POST Request):

This test requires an API key and sends a POST request with a simple message to the chat completions endpoint.

(Replace YOUR_API_KEY, your-open-webui-instance, and llama3.1 with your actual values.)

Expected Output: A successful request will return a 200 OK status code and a JSON response containing a chat completion. You can verify that the response includes the word "HEALTHY" (or a similar expected response based on your prompt).

Setting up Level 3 Monitoring in Uptime Kuma would involve configuring an HTTP(s) monitor with a POST request, JSON body, authentication headers, and potentially JSON query to validate the response content. This is a more advanced setup and can be customized based on your specific needs.

By implementing these monitoring levels, you can proactively ensure the health, reliability, and performance of your Open WebUI instance, providing a consistently positive experience for users.

**Examples:**

Example 1 (bash):
```bash
# Basic health check - no authentication needed   curl https://your-open-webui-instance/health
```

Example 2 (bash):
```bash
# Authenticated model connectivity check   curl -H "Authorization: Bearer YOUR_API_KEY" https://your-open-webui-instance/api/models
```

Example 3 (bash):
```bash
# Test model response - authenticated POST requestcurl -X POST https://your-open-webui-instance/api/chat/completions \  -H "Authorization: Bearer YOUR_API_KEY" \  -H "Content-Type: application/json" \  -d '{    "messages": [{"role": "user", "content": "Respond with the word HEALTHY"}],    "model": "llama3.1",  # Replace with a model you expect to be available    "temperature": 0      # Set temperature to 0 for consistent responses  }'
```

---

## LibreTranslate Integration

**URL:** https://docs.openwebui.com/tutorials/integrations/libre-translate

**Contents:**
- LibreTranslate Integration
- Overview​
- Setting up LibreTranslate in Docker​
  - Step 1: Create a Docker Compose File​
  - Step 2: Create a stack.env File​
  - Step 3: Run the Docker Compose File​
- Configuring the Integration in Open WebUI​
- Troubleshooting​
- Benefits of Integration​
- Conclusion​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

LibreTranslate is a free and open-source machine translation API that supports a wide range of languages. LibreTranslate is a self hosted, offline capable, and easy to setup, and unlike other APIs, it doesn't rely on proprietary providers such as Google or Azure to perform translations. Instead, its translation engine is powered by the open source Argos Translate library. You can integrate LibreTranslate with Open WebUI to leverage its machine translation capabilities. This documentation provides a step-by-step guide to setting up LibreTranslate in Docker and configuring the integration within Open WebUI.

To set up LibreTranslate in Docker, follow these steps:

Create a new file named docker-compose.yml in a directory of your choice. Add the following configuration to the file:

Create a new file named stack.env in the same directory as your docker-compose.yml file. Add the following configuration to the file:

Run the following command to start the LibreTranslate service:

This will start the LibreTranslate service in detached mode.

Once you have LibreTranslate up and running in Docker, you can configure the integration within Open WebUI. There are several community integrations available, including:

Choose the integration that best suits your needs and follow the instructions to configure it within Open WebUI.

Supported languages for the LibreTranslate pipeline & function: Really just all the languages that can be found within LibreTranslate, but here is the list:

Integrating LibreTranslate with Open WebUI provides several benefits, including:

Integrating LibreTranslate with Open WebUI is a straightforward process that can enhance the functionality of your Open WebUI instance. By following the steps outlined in this documentation, you can set up LibreTranslate in Docker and configure the integration within Open WebUI.

**Examples:**

Example 1 (yml):
```yml
services:  libretranslate:    container_name: libretranslate    image: libretranslate/libretranslate:v1.6.0    restart: unless-stopped    ports:      - "5000:5000"    env_file:      - stack.env    volumes:      - libretranslate_api_keys:/app/db      - libretranslate_models:/home/libretranslate/.local:rw    tty: true    stdin_open: true    healthcheck:      test: ['CMD-SHELL', './venv/bin/python scripts/healthcheck.py']volumes:  libretranslate_models:  libretranslate_api_keys:
```

Example 2 (bash):
```bash
# LibreTranslateLT_DEBUG="false"LT_UPDATE_MODELS="true"LT_SSL="false"LT_SUGGESTIONS="false"LT_METRICS="false"LT_HOST="0.0.0.0"LT_API_KEYS="false"LT_THREADS="12"LT_FRONTEND_TIMEOUT="2000"
```

Example 3 (bash):
```bash
docker-compose up -d
```

Example 4 (txt):
```txt
Albanian, Arabic, Azerbaijani, Bengali, Bulgarian, Catalan, Valencian, Chinese, Czech, Danish, Dutch, English, Flemish, Esperanto, Estonian, Finnish, French, German, Greek, Hebrew, Hindi, Hungarian, Indonesian, Irish, Italian, Japanese, Korean, Latvian, Lithuanian, Malay, Persian, Polish, Portuguese, Romanian, Moldavian, Moldovan, Russian, Slovak, Slovenian, Spanish, Castilian, Swedish, Tagalog, Thai, Turkish, Ukrainian, Urdu
```

---

## Local LLM Setup with IPEX-LLM on Intel GPU

**URL:** https://docs.openwebui.com/tutorials/integrations/ipex_llm

**Contents:**
- Local LLM Setup with IPEX-LLM on Intel GPU
- Local LLM Setup with IPEX-LLM on Intel GPU​
- Start Ollama Serve on Intel GPU​
- Configure Open WebUI​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This guide is verified with Open WebUI setup through Manual Installation.

IPEX-LLM is a PyTorch library for running LLM on Intel CPU and GPU (e.g., local PC with iGPU, discrete GPU such as Arc A-Series, Flex and Max) with very low latency.

This tutorial demonstrates how to setup Open WebUI with IPEX-LLM accelerated Ollama backend hosted on Intel GPU. By following this guide, you will be able to setup Open WebUI even on a low-cost PC (i.e. only with integrated GPU) with a smooth experience.

Refer to this guide from IPEX-LLM official documentation about how to install and run Ollama serve accelerated by IPEX-LLM on Intel GPU.

If you would like to reach the Ollama service from another machine, make sure you set or export the environment variable OLLAMA_HOST=0.0.0.0 before executing the command ollama serve.

Access the Ollama settings through Settings -> Connections in the menu. By default, the Ollama Base URL is preset to https://localhost:11434, as illustrated in the snapshot below. To verify the status of the Ollama service connection, click the Refresh button located next to the textbox. If the WebUI is unable to establish a connection with the Ollama server, you will see an error message stating, WebUI could not connect to Ollama.

If the connection is successful, you will see a message stating Service Connection Verified, as illustrated below.

If you want to use an Ollama server hosted at a different URL, simply update the Ollama Base URL to the new URL and press the Refresh button to re-confirm the connection to Ollama.

---

## Monitoring and Debugging with Langfuse

**URL:** https://docs.openwebui.com/tutorials/integrations/langfuse

**Contents:**
- Monitoring and Debugging with Langfuse
- Langfuse Integration with Open WebUI​
- How to integrate Langfuse with Open WebUI​
- Quick Start Guide​
  - Step 1: Setup Open WebUI​
  - Step 2: Set Up Pipelines​
  - Step 3: Connecting Open WebUI with Pipelines​
  - Step 4: Adding the Langfuse Filter Pipeline​
  - Step 5: See your traces in Langfuse​
- Learn more​

Langfuse (GitHub) offers open source observability and evaluations for Open WebUI. By enabling the Langfuse integration, you can trace your application data with Langfuse to develop, monitor, and improve the use of Open WebUI, including:

Langfuse integration steps

Pipelines in Open WebUI is an UI-agnostic framework for OpenAI API plugins. It enables the injection of plugins that intercept, process, and forward user prompts to the final LLM, allowing for enhanced control and customization of prompt handling.

To trace your application data with Langfuse, you can use the Langfuse pipeline, which enables real-time monitoring and analysis of message interactions.

Make sure to have Open WebUI running. To do so, have a look at the Open WebUI documentation.

Launch Pipelines by using Docker. Use the following command to start Pipelines:

In the Admin Settings, create and save a new connection of type OpenAI API with the following details:

Next, navigate to Admin Settings->Pipelines and add the Langfuse Filter Pipeline. Specify that Pipelines is listening on http://host.docker.internal:9099 (as configured earlier) and install the Langfuse Filter Pipeline by using the Install from Github URL option with the following URL:

Now, add your Langfuse API keys below. If you haven't signed up to Langfuse yet, you can get your API keys by creating an account here.

Note: Capture usage (token counts) for OpenAi models while streaming is enabled, you have to navigate to the model settings in Open WebUI and check the "Usage" box below Capabilities.

You can now interact with your Open WebUI application and see the traces in Langfuse.

Example trace in the Langfuse UI:

For a comprehensive guide on Open WebUI Pipelines, visit this post.

**Examples:**

Example 1 (bash):
```bash
docker run -p 9099:9099 --add-host=host.docker.internal:host-gateway -v pipelines:/app/pipelines --name pipelines --restart always ghcr.io/open-webui/pipelines:main
```

Example 2 (txt):
```txt
https://github.com/open-webui/pipelines/blob/main/examples/filters/langfuse_v3_filter_pipeline.py
```

---

## Notion (MCP)

**URL:** https://docs.openwebui.com/tutorials/integrations/mcp-notion

**Contents:**
- Notion (MCP)
- Method 1: Streamable HTTP (Recommended)​
  - 1. Configure Tool​
  - 2. Authenticate & Grant Access​
- Method 2: Self-Hosted via MCPO (Advanced)​
  - 1. Configure MCPO​
  - 2. Connect Open WebUI​
- Creating an Internal Integration​
  - 1. Create Integration​
  - 2. Configure Capabilities & Copy Secret​

This guide enables Open WebUI to interact with your Notion workspace—searching pages, reading content, creating docs, and managing databases—using the Model Context Protocol (MCP).

This integration utilizes the official Notion MCP server, which specializes in automatic Markdown conversion. When the AI reads a Notion page, it receives clean, structured Markdown rather than raw JSON blocks, significantly improving the model's ability to understand and summarize your notes.

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This method connects directly to Notion's hosted MCP endpoint (https://mcp.notion.com/mcp). It utilizes standard OAuth and is natively supported by Open WebUI without extra containers.

Streamable HTTP is preferred for its simplicity and enhanced security. It handles authentication via Notion's official OAuth flow, meaning you do not need to manually manage secrets or integration tokens.

You MUST set the WEBUI_SECRET_KEY environment variable in your Docker setup to a persistent value. If you do not, your Notion OAuth session will become invalid every time you restart the container, forcing you to re-authenticate repeatedly.

You can automatically prefill the connection settings by importing the JSON configuration below.

Once the tool is added, you must authenticate to link your specific workspace.

For security reasons, Notion's OAuth session may expire after a period of inactivity or if you restart your Open WebUI instance. If this happens, you will see a Failed to connect to MCP server 'ntn' error.

This is intended behavior by Notion to keep your workspace secure. To refresh your session, revisit the steps above to complete the "Connect with Notion MCP" authorization flow again.

This method is for advanced users who prefer to run the MCP server locally within their own infrastructure using MCPO. Unlike Streamable HTTP, this method requires you to manually manage your own credentials.

Direct local execution (stdio) of MCP servers is not natively supported in Open WebUI. To run the Notion MCP server locally (using Docker or Node.js) within your infrastructure, you must use MCPO to bridge the connection.

To use this method, you must first create an internal integration to obtain a Secret Key. Please complete the Creating an Internal Integration section below before proceeding with the configuration steps here.

Follow the installation instructions in the MCPO Repository to get it running. Configure your MCPO instance to run the Notion server using one of the runtimes below by adding the JSON block to your mcpo-config.json file.

Note: Replace secret_YOUR_KEY_HERE with the secret obtained from the Creating an Internal Integration section.

This configuration uses the official Node.js package.

This configuration uses the official Docker image.

Once MCPO is running and configured with Notion:

Required for Method 2, creating an internal integration within Notion ensures you have the necessary credentials and permission scopes readily available.

You must select Internal for the integration type. Public integrations require a different OAuth flow that is not covered in this guide.

Once saved, you will be directed to the configuration page.

While the Notion MCP server limits the scope of the API (e.g., databases cannot be deleted), exposing your workspace to LLMs carries a non-zero risk.

Security-conscious users can create a safer, Read-Only integration by unchecking Update content and Insert content. The AI will be able to search and answer questions based on your notes but will be physically unable to modify or create pages.

Your Internal Integration Secret allows access to your Notion data. Treat it like a password. Do not share it or commit it to public repositories.

By default, your new internal integration has zero access to your workspace. It cannot see any pages until you explicitly invite it. If you skip this step, the AI will return "Object not found" errors.

You can grant access centrally or on a per-page basis.

Still in the Notion Integration dashboard:

By default, users must toggle the tool ON in the chat menu. You can configure a specific model to have Notion access enabled by default for every conversation.

For the most reliable experience, we recommend creating a dedicated "Notion Assistant" model. This allows you to provide a specialized System Prompt, a helpful Knowledge Base, and quick-start Prompt Suggestions that teaches the model how to navigate Notion's structure.

First, create a knowledge base with the official Notion MCP documentation. This will help the model understand its own capabilities.

For optimal RAG performance, we recommend converting web documentation into clean Markdown. You can use Jina Reader (or the hosted https://r.jina.ai/ API) to strip clutter and format the page specifically for LLMs.

Simply visit https://r.jina.ai/https://developers.notion.com/docs/mcp-supported-tools, copy the output, and save it as a .md file to upload.

Now, create the dedicated agent and attach the knowledge base you just made.

While the knowledge base helps the model understand Notion's capabilities, injecting large amounts of documentation can sometimes interfere with tool calling on smaller models (overloading the context).

If you notice the model failing to call tools correctly or hallucinating parameters, detach the knowledge base and rely solely on the System Prompt provided above.

Under the Prompts section, click the + button to add a few helpful starting prompts.

LLMs cannot "browse" Notion like a human. For most actions, the model first needs to know the Page ID or URL. Always ask the model to search for a page first before asking it to read or modify it.

This integration supports a wide range of tools for searching, reading, creating, and updating Notion pages and databases.

For a complete list of available tools, their descriptions, and specific usage examples, please refer to the official Notion MCP documentation.

Standard API request limits apply to your use of Notion MCP, totaled across all tool calls.

If you encounter rate limit errors, prompt your model to reduce the number of parallel searches or operations. For example, instead of "Search for A, B, and C," try asking for them sequentially.

**Examples:**

Example 1 (json):
```json
[  {    "type": "mcp",    "url": "https://mcp.notion.com/mcp",    "spec_type": "url",    "spec": "",    "path": "openapi.json",    "auth_type": "oauth_2.1",    "key": "",    "info": {      "id": "ntn",      "name": "Notion",      "description": "A note-taking and collaboration platform that allows users to create, organize, and share notes, databases, and other content."    }  }]
```

Example 2 (json):
```json
{  "mcpServers": {    "notion": {      "command": "npx",      "args": [        "-y",        "@notionhq/notion-mcp-server"      ],      "env": {        "NOTION_TOKEN": "secret_YOUR_KEY_HERE"      }    }  }}
```

Example 3 (json):
```json
{  "mcpServers": {    "notion": {      "command": "docker",      "args": [        "run",        "--rm",        "-i",        "-e",        "NOTION_TOKEN",        "mcp/notion"      ],      "env": {        "NOTION_TOKEN": "secret_YOUR_KEY_HERE"      }    }  }}
```

Example 4 (json):
```json
[  {    "type": "openapi",    "url": "http://<YOUR_MCPO_IP>:<PORT>/notion",    "spec_type": "url",    "spec": "",    "path": "openapi.json",    "auth_type": "bearer",    "key": "",    "info": {      "id": "notion-local",      "name": "Notion (Local)",      "description": "Local Notion integration via MCPO"    }  }]
```

---

## One-Click Ollama + Open WebUI Launcher (Linux)

**URL:** https://docs.openwebui.com/tutorials/tips/one-click-ollama-launcher

**Contents:**
- One-Click Ollama + Open WebUI Launcher (Linux)
- Prerequisites​
- Overview​
- Step 1: Create the Ollama Stop Script​
- Step 2: Configure Sudo Permissions​
- Step 3: Create the Main Startup Script​
- Step 4: Test the Script​
- Step 5: Create the Desktop Entry​
- Step 6: Optional Customizations​
  - Custom Icon​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This tutorial shows you how to create a convenient desktop launcher that automatically starts both Ollama and Open WebUI services with a single click, then opens your browser to the correct local address. This is perfect for users who have Open WebUI installed in a conda environment and want a streamlined startup experience.

Before starting this tutorial, ensure you have:

This solution creates three components:

First, we'll create a script to cleanly stop the Ollama service. This prevents the common "address already in use" error when restarting Ollama.

Create a directory for your scripts and the stop script:

Create stop_ollama.sh:

Add the following content:

Make the script executable:

To avoid entering your password every time the script runs, we'll configure sudo to allow passwordless execution of our stop script.

⚠️ Important: This step requires careful attention to security. Only grant permissions to the specific script path.

Open the sudo configuration:

Add this line at the bottom of the file (replace yourusername with your actual username):

Save and exit the editor (in nano: Ctrl+X, then Y, then Enter).

Now create the main script that orchestrates the entire startup process.

Create start_services.sh:

Add the following content (make sure to replace yourusername with your actual username and openwebui with your actual conda environment name):

Make the script executable:

Before creating the desktop entry, test your script to ensure it works:

If there are any errors, check that:

Create a desktop entry file to make this accessible from your application menu:

Add the following content (replace yourusername with your actual username):

Make the desktop entry executable:

You can download an Ollama icon and use it instead of the default terminal icon:

If you're not using GNOME Terminal, modify the gnome-terminal commands in the startup script. For example:

If your Open WebUI is installed in a different conda environment, update the environment name in the startup script:

After completing all steps:

If you get permission denied errors:

If services fail to start:

If the browser doesn't open automatically:

For non-GNOME environments:

This setup requires sudo access for stopping the Ollama service. The sudo configuration is limited to a specific script to minimize security risks, but you should:

You now have a convenient one-click solution for starting your Ollama and Open WebUI setup! This approach is particularly useful for development workflows where you frequently start and stop these services.

The terminal tabs remain open so you can monitor service logs and easily stop the services when needed (Ctrl+C in each respective tab).

**Examples:**

Example 1 (bash):
```bash
mkdir -p ~/ollama-open-webuicd ~/ollama-open-webui
```

Example 2 (bash):
```bash
nano stop_ollama.sh
```

Example 3 (bash):
```bash
#!/bin/bashsystemctl stop ollama
```

Example 4 (bash):
```bash
chmod +x ~/ollama-open-webui/stop_ollama.sh
```

---

## Open WebUI RAG Tutorial

**URL:** https://docs.openwebui.com/tutorials/tips/rag-tutorial

**Contents:**
- Open WebUI RAG Tutorial
- Tutorial: Configuring RAG with Open WebUI Documentation​
- Overview​
  - What is RAG?​
- Setup​
  - Step-by-Step Setup: Open WebUI Documentation as Knowledge Base​
- Create and Configure the Model​
  - Create a Custom Model with the Knowledge Base​
- Examples and Usage​
  - Query the Open WebUI Documentation Model​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

In this tutorial, you will learn how to use Retrieval-Augmented Generation (RAG) with Open WebUI to load real-world documentation as a knowledge base. We will walk through how to use the latest Open WebUI Documentation as an example for this setup.

Retrieval-Augmented Generation (RAG) combines LLMs with retrieved knowledge from external sources. The system retrieves relevant data from uploaded documents or knowledge bases, enhancing the quality and accuracy of responses.

This tutorial demonstrates how to:

Follow these steps to set up RAG with Open WebUI Documentation:

Download the Documentation:

Locate the Markdown Files:

Create a Knowledge Base:

Click Create Knowledge.

With the RAG-enabled model, the system retrieves the most relevant sections from the documentation to answer your query.

With this setup, you can effectively use the Open WebUI Documentation to assist users by retrieving relevant information for their queries. Enjoy building and querying your custom knowledge-enhanced models!

**Examples:**

Example 1 (txt):
```txt
User: "How do I configure environment variables?"System: "Refer to Section 3.2: Use the `.env` file to manage configurations."
```

Example 2 (txt):
```txt
User: "How do I update Open WebUI using Docker?"System: "Refer to `docker/updating.md`: Use `docker pull` and restart the container."
```

---

## Quick Start

**URL:** https://docs.openwebui.com/getting-started/quick-start/

**Contents:**
- Quick Start
- Quick Start with Docker 🐳​
- Step 1: Pull the Open WebUI Image​
  - Slim Image Variant​
  - Specific release version​
- Step 2: Run the Container​
  - Important Flags​
  - Using GPU Support​
    - Single-User Mode (Disabling Login)​
    - Advanced Configuration: Connecting to Ollama on a Different Server​

We are hiring! Shape the way humanity engages with intelligence.

Important Note on User Roles and Privacy:

Choose your preferred installation method below:

Follow these steps to install Open WebUI with Docker.

Start by pulling the latest Open WebUI Docker image from the GitHub Container Registry.

For environments with limited storage or bandwidth, Open WebUI offers slim image variants that exclude pre-bundled models. These images are significantly smaller but download required models (whisper, embedding models) on first use.

You can also pull a specific Open WebUI release version directly by using a versioned image tag. This is recommended for production environments to ensure stable and reproducible deployments.

Run the container with default settings. This command includes a volume mapping to ensure persistent data storage.

To use the slim variant instead:

For Nvidia GPU support, add --gpus all to the docker run command:

To bypass the login page for a single-user setup, set the WEBUI_AUTH environment variable to False:

You cannot switch between single-user mode and multi-account mode after this change.

To connect Open WebUI to an Ollama server located on another host, add the OLLAMA_BASE_URL environment variable:

After the container is running, access Open WebUI at:

http://localhost:3000

For detailed help on each Docker flag, see Docker's documentation.

To uninstall Open WebUI running with Docker, follow these steps:

Stop and Remove the Container:

Remove the Image (Optional):

Remove the Volume (Optional, WARNING: Deletes all data): If you want to completely remove your data (chats, settings, etc.):

To update your local Docker installation to the latest version, you can either use Watchtower or manually update the container.

The original containrrr/watchtower is no longer maintained and may fail with newer Docker versions. We recommend using the nickfedor/watchtower fork.

If you run Open WebUI with UVICORN_WORKERS > 1 (e.g., in a production environment), you MUST ensure the update migration runs on a single worker first to prevent database schema corruption.

Steps for proper update:

With Watchtower, you can automate the update process:

(Replace open-webui with your container's name if it's different.)

Stop and remove the current container:

Pull the latest version:

Start the container again:

Both methods will get your Docker instance updated and running with the latest build.

Using Docker Compose simplifies the management of multi-container Docker applications.

Docker Compose requires an additional package, docker-compose-v2.

Warning: Older Docker Compose tutorials may reference version 1 syntax, which uses commands like docker-compose build. Ensure you use version 2 syntax, which uses commands like docker compose build (note the space instead of a hyphen).

Here is an example configuration file for setting up Open WebUI with Docker Compose:

For environments with limited storage or bandwidth, you can use the slim image variant that excludes pre-bundled models:

Note: Slim images download required models (whisper, embedding models) on first use, which may result in longer initial startup times but significantly smaller image sizes.

To start your services, run the following command:

A useful helper script called run-compose.sh is included with the codebase. This script assists in choosing which Docker Compose files to include in your deployment, streamlining the setup process.

Note: For Nvidia GPU support, you change the image from ghcr.io/open-webui/open-webui:main to ghcr.io/open-webui/open-webui:cuda and add the following to your service definition in the docker-compose.yml file:

This setup ensures that your application can leverage GPU resources when available.

To uninstall Open WebUI running with Docker Compose, follow these steps:

Stop and Remove the Services: Run this command in the directory containing your docker-compose.yml file:

Remove the Volume (Optional, WARNING: Deletes all data): If you want to completely remove your data (chats, settings, etc.):

Remove the Image (Optional):

Docker has released an Open WebUI Docker extension that uses Docker Model Runner for inference. You can read their getting started blog here: Run Local AI with Open WebUI + Docker Model Runner

You can find troubleshooting steps for the extension in their Github repository: Open WebUI Docker Extension - Troubleshooting

While this is an amazing resource to try out Open WebUI with little friction, it is not an officially supported installation method - you may run into unexpected bugs or behaviors while using it. For example, you are not able to log in as different users in the extension since it is designed to be for a single local user. If you run into issues using the extension, please submit an issue on the extension's Github repository.

Podman is a daemonless container engine for developing, managing, and running OCI Containers.

List Running Containers:

If networking issues arise (specifically on rootless Podman), you may need to adjust the network bridge settings.

Older Podman instructions often recommended slirp4netns. However, slirp4netns is being deprecated and will be removed in Podman 6.

The modern successor is pasta, which is the default in Podman 5.0+.

If you are running Ollama or other services directly on your host machine, use the special DNS name host.containers.internal to point to your computer.

No special flags are usually needed to access the host via host.containers.internal.

If you are on an older version of Podman and pasta is not available:

Once inside Open WebUI, navigate to Settings > Admin Settings > Connections and set your Ollama API connection to: http://host.containers.internal:11434

Refer to the Podman documentation for advanced configurations.

To uninstall Open WebUI running with Podman, follow these steps:

Stop and Remove the Container:

Remove the Image (Optional):

Remove the Volume (Optional, WARNING: Deletes all data): If you want to completely remove your data (chats, settings, etc.):

Podman Quadlets allow you to manage containers as native systemd services. This is the recommended way to run production containers on Linux distributions that use systemd (like Fedora, RHEL, Ubuntu, etc.).

Create the configuration directory: For a rootless user deployment:

Create the container file: Create a file named ~/.config/containers/systemd/open-webui.container with the following content:

Reload systemd and start the service:

Enable auto-start on boot:

To update the image, simply pull the new version (podman pull ghcr.io/open-webui/open-webui:main) and restart the service (systemctl --user restart open-webui).

Podman supports Kubernetes like-syntax for deploying resources such as pods, volumes without having the overhead of a full Kubernetes cluster. More about Kube Play.

If you don't have Podman installed, check out Podman's official website.

Here is an example of a Podman Kube Play file to deploy:

To start your pod, run the following command:

For Nvidia GPU support, you need to replace the container image with ghcr.io/open-webui/open-webui:cuda and need to specify the device (GPU) required in the pod resources limits as followed:

To successfully have the open-webui container access the GPU(s), you will need to have the Container Device Interface (CDI) for the GPU you wish to access installed in your Podman Machine. You can check Podman GPU container access.

This installation method requires knowledge on Docker Swarms, as it utilizes a stack file to deploy 3 seperate containers as services in a Docker Swarm.

It includes isolated containers of ChromaDB, Ollama, and OpenWebUI. Additionally, there are pre-filled Environment Variables to further illustrate the setup.

Choose the appropriate command based on your hardware setup:

Directories for your volumes need to be created on the host, or you can specify a custom location or volume.

The current example utilizes an isolated dir data, which is within the same dir as the docker-stack.yaml.

Additional Requirements:

Modify the Ollama Service within docker-stack.yaml and remove the lines for generic_resources:

This guide provides instructions for setting up Docker and running Open WebUI in a Windows Subsystem for Linux (WSL) environment.

If you haven't already, install WSL by following the official Microsoft documentation:

Docker Desktop is the easiest way to get Docker running in a WSL environment. It handles the integration between Windows and WSL automatically.

Download Docker Desktop: https://www.docker.com/products/docker-desktop/

Install Docker Desktop: Follow the installation instructions, making sure to select the "WSL 2" backend during the setup process.

Open Docker Desktop: Start the Docker Desktop application.

Enable WSL Integration:

Now you can run Open WebUI by following the standard Docker instructions from within your WSL terminal.

Run Docker Commands in WSL: Always run docker commands from your WSL terminal, not from PowerShell or Command Prompt.

File System Access: When using volume mounts (-v), make sure the paths are accessible from your WSL distribution.

The uv runtime manager ensures seamless Python environment management for applications like Open WebUI. Follow these steps to get started:

Pick the appropriate installation command for your operating system:

Once uv is installed, running Open WebUI is a breeze. Use the command below, ensuring to set the DATA_DIR environment variable to avoid data loss. Example paths are provided for each platform:

Windows (PowerShell):

Setting DATA_DIR ensures your chats and settings are saved in a predictable location. If you don't set it, uvx might store it in a temporary folder that gets deleted when the process ends.

To remove Open WebUI when running with uvx:

Stop the Server: Press Ctrl+C in the terminal where it's running.

Uninstall from UV: Enter uv tool uninstall open-webui

Available cleanup commands: The uvx command runs the application ephemerally or from cache. To remove cached components:

Remove Data (WARNING: Deletes all data): Delete your data directory (default is ~/.open-webui or the path set in DATA_DIR):

To update your locally installed Open-WebUI package to the latest version using pip, follow these simple steps:

The -U (or --upgrade) flag ensures that pip upgrades the package to the latest available version.

That's it! Your Open-WebUI package is now updated and ready to use.

If you run Open WebUI with UVICORN_WORKERS > 1 (e.g., in a production environment), you MUST ensure the update migration runs on a single worker first to prevent database schema corruption.

Steps for proper update:

Create a Conda Environment:

Activate the Environment:

If your terminal says the command doesn't exist:

Remove the Conda Environment:

Remove Data (WARNING: Deletes all data): Delete your data directory (usually ~/.open-webui unless configured otherwise):

To update your locally installed Open-WebUI package to the latest version using pip, follow these simple steps:

The -U (or --upgrade) flag ensures that pip upgrades the package to the latest available version.

That's it! Your Open-WebUI package is now updated and ready to use.

If you run Open WebUI with UVICORN_WORKERS > 1 (e.g., in a production environment), you MUST ensure the update migration runs on a single worker first to prevent database schema corruption.

Steps for proper update:

Create isolated Python environments using venv.

Create a Virtual Environment:

Activate the Virtual Environment:

If your terminal says the command doesn't exist:

Delete the Virtual Environment: Simply remove the venv folder:

Remove Data (WARNING: Deletes all data): Delete your data directory (usually ~/.open-webui unless configured otherwise):

To update your locally installed Open-WebUI package to the latest version using pip, follow these simple steps:

The -U (or --upgrade) flag ensures that pip upgrades the package to the latest available version.

That's it! Your Open-WebUI package is now updated and ready to use.

If you run Open WebUI with UVICORN_WORKERS > 1 (e.g., in a production environment), you MUST ensure the update migration runs on a single worker first to prevent database schema corruption.

Steps for proper update:

For developers who want to contribute, check the Development Guide in Advanced Topics.

Helm helps you manage Kubernetes applications.

Add Open WebUI Helm Repository:

Install Open WebUI Chart:

If you intend to scale Open WebUI using multiple nodes/pods/workers in a clustered environment, you need to setup a NoSQL key-value database. There are some environment variables that need to be set to the same value for all service-instances, otherwise consistency problems, faulty sessions and other issues will occur!

If you run Open WebUI with multiple replicas/pods (replicaCount > 1) or UVICORN_WORKERS > 1, you MUST scale down to a single replica/pod during updates.

Failure to do this can result in database corruption due to concurrent migrations.

You can access Open WebUI by port-forwarding or configuring an Ingress.

If you are using the NGINX Ingress Controller, you can enable session affinity (sticky sessions) to improve WebSocket stability. Add the following annotation to your Ingress resource:

This ensures that a user's session remains connected to the same pod, reducing issues with WebSocket connections in multi-replica setups (though correct Redis configuration makes this less critical).

Uninstall the Helm Release:

Remove Persistent Volume Claims (WARNING: Deletes all data): Helm does not automatically delete PVCs to prevent accidental data loss. You must delete them manually if you want to wipe everything.

For installation via Pinokio.computer, please visit their website:

https://pinokio.computer/

Support for this installation method is provided through their website.

(Add information about third-party integrations as they become available.)

After installing, visit:

You are now ready to start using Open WebUI!

If you're using Open WebUI with Ollama, be sure to check out our Starting with Ollama Guide to learn how to manage your Ollama instances with Open WebUI.

Need help? Have questions? Join our community:

Stay updated with the latest features, troubleshooting tips, and announcements!

**Examples:**

Example 1 (bash):
```bash
docker pull ghcr.io/open-webui/open-webui:main
```

Example 2 (bash):
```bash
docker pull ghcr.io/open-webui/open-webui:main-slim
```

Example 3 (bash):
```bash
docker pull ghcr.io/open-webui/open-webui:v0.6.42
```

Example 4 (bash):
```bash
docker run -d -p 3000:8080 -v open-webui:/app/backend/data --name open-webui ghcr.io/open-webui/open-webui:main
```

---

## Quick Start

**URL:** https://docs.openwebui.com/getting-started/quick-start

**Contents:**
- Quick Start
- Quick Start with Docker 🐳​
- Step 1: Pull the Open WebUI Image​
  - Slim Image Variant​
  - Specific release version​
- Step 2: Run the Container​
  - Important Flags​
  - Using GPU Support​
    - Single-User Mode (Disabling Login)​
    - Advanced Configuration: Connecting to Ollama on a Different Server​

We are hiring! Shape the way humanity engages with intelligence.

Important Note on User Roles and Privacy:

Choose your preferred installation method below:

Follow these steps to install Open WebUI with Docker.

Start by pulling the latest Open WebUI Docker image from the GitHub Container Registry.

For environments with limited storage or bandwidth, Open WebUI offers slim image variants that exclude pre-bundled models. These images are significantly smaller but download required models (whisper, embedding models) on first use.

You can also pull a specific Open WebUI release version directly by using a versioned image tag. This is recommended for production environments to ensure stable and reproducible deployments.

Run the container with default settings. This command includes a volume mapping to ensure persistent data storage.

To use the slim variant instead:

For Nvidia GPU support, add --gpus all to the docker run command:

To bypass the login page for a single-user setup, set the WEBUI_AUTH environment variable to False:

You cannot switch between single-user mode and multi-account mode after this change.

To connect Open WebUI to an Ollama server located on another host, add the OLLAMA_BASE_URL environment variable:

After the container is running, access Open WebUI at:

http://localhost:3000

For detailed help on each Docker flag, see Docker's documentation.

To uninstall Open WebUI running with Docker, follow these steps:

Stop and Remove the Container:

Remove the Image (Optional):

Remove the Volume (Optional, WARNING: Deletes all data): If you want to completely remove your data (chats, settings, etc.):

To update your local Docker installation to the latest version, you can either use Watchtower or manually update the container.

The original containrrr/watchtower is no longer maintained and may fail with newer Docker versions. We recommend using the nickfedor/watchtower fork.

If you run Open WebUI with UVICORN_WORKERS > 1 (e.g., in a production environment), you MUST ensure the update migration runs on a single worker first to prevent database schema corruption.

Steps for proper update:

With Watchtower, you can automate the update process:

(Replace open-webui with your container's name if it's different.)

Stop and remove the current container:

Pull the latest version:

Start the container again:

Both methods will get your Docker instance updated and running with the latest build.

Using Docker Compose simplifies the management of multi-container Docker applications.

Docker Compose requires an additional package, docker-compose-v2.

Warning: Older Docker Compose tutorials may reference version 1 syntax, which uses commands like docker-compose build. Ensure you use version 2 syntax, which uses commands like docker compose build (note the space instead of a hyphen).

Here is an example configuration file for setting up Open WebUI with Docker Compose:

For environments with limited storage or bandwidth, you can use the slim image variant that excludes pre-bundled models:

Note: Slim images download required models (whisper, embedding models) on first use, which may result in longer initial startup times but significantly smaller image sizes.

To start your services, run the following command:

A useful helper script called run-compose.sh is included with the codebase. This script assists in choosing which Docker Compose files to include in your deployment, streamlining the setup process.

Note: For Nvidia GPU support, you change the image from ghcr.io/open-webui/open-webui:main to ghcr.io/open-webui/open-webui:cuda and add the following to your service definition in the docker-compose.yml file:

This setup ensures that your application can leverage GPU resources when available.

To uninstall Open WebUI running with Docker Compose, follow these steps:

Stop and Remove the Services: Run this command in the directory containing your docker-compose.yml file:

Remove the Volume (Optional, WARNING: Deletes all data): If you want to completely remove your data (chats, settings, etc.):

Remove the Image (Optional):

Docker has released an Open WebUI Docker extension that uses Docker Model Runner for inference. You can read their getting started blog here: Run Local AI with Open WebUI + Docker Model Runner

You can find troubleshooting steps for the extension in their Github repository: Open WebUI Docker Extension - Troubleshooting

While this is an amazing resource to try out Open WebUI with little friction, it is not an officially supported installation method - you may run into unexpected bugs or behaviors while using it. For example, you are not able to log in as different users in the extension since it is designed to be for a single local user. If you run into issues using the extension, please submit an issue on the extension's Github repository.

Podman is a daemonless container engine for developing, managing, and running OCI Containers.

List Running Containers:

If networking issues arise (specifically on rootless Podman), you may need to adjust the network bridge settings.

Older Podman instructions often recommended slirp4netns. However, slirp4netns is being deprecated and will be removed in Podman 6.

The modern successor is pasta, which is the default in Podman 5.0+.

If you are running Ollama or other services directly on your host machine, use the special DNS name host.containers.internal to point to your computer.

No special flags are usually needed to access the host via host.containers.internal.

If you are on an older version of Podman and pasta is not available:

Once inside Open WebUI, navigate to Settings > Admin Settings > Connections and set your Ollama API connection to: http://host.containers.internal:11434

Refer to the Podman documentation for advanced configurations.

To uninstall Open WebUI running with Podman, follow these steps:

Stop and Remove the Container:

Remove the Image (Optional):

Remove the Volume (Optional, WARNING: Deletes all data): If you want to completely remove your data (chats, settings, etc.):

Podman Quadlets allow you to manage containers as native systemd services. This is the recommended way to run production containers on Linux distributions that use systemd (like Fedora, RHEL, Ubuntu, etc.).

Create the configuration directory: For a rootless user deployment:

Create the container file: Create a file named ~/.config/containers/systemd/open-webui.container with the following content:

Reload systemd and start the service:

Enable auto-start on boot:

To update the image, simply pull the new version (podman pull ghcr.io/open-webui/open-webui:main) and restart the service (systemctl --user restart open-webui).

Podman supports Kubernetes like-syntax for deploying resources such as pods, volumes without having the overhead of a full Kubernetes cluster. More about Kube Play.

If you don't have Podman installed, check out Podman's official website.

Here is an example of a Podman Kube Play file to deploy:

To start your pod, run the following command:

For Nvidia GPU support, you need to replace the container image with ghcr.io/open-webui/open-webui:cuda and need to specify the device (GPU) required in the pod resources limits as followed:

To successfully have the open-webui container access the GPU(s), you will need to have the Container Device Interface (CDI) for the GPU you wish to access installed in your Podman Machine. You can check Podman GPU container access.

This installation method requires knowledge on Docker Swarms, as it utilizes a stack file to deploy 3 seperate containers as services in a Docker Swarm.

It includes isolated containers of ChromaDB, Ollama, and OpenWebUI. Additionally, there are pre-filled Environment Variables to further illustrate the setup.

Choose the appropriate command based on your hardware setup:

Directories for your volumes need to be created on the host, or you can specify a custom location or volume.

The current example utilizes an isolated dir data, which is within the same dir as the docker-stack.yaml.

Additional Requirements:

Modify the Ollama Service within docker-stack.yaml and remove the lines for generic_resources:

This guide provides instructions for setting up Docker and running Open WebUI in a Windows Subsystem for Linux (WSL) environment.

If you haven't already, install WSL by following the official Microsoft documentation:

Docker Desktop is the easiest way to get Docker running in a WSL environment. It handles the integration between Windows and WSL automatically.

Download Docker Desktop: https://www.docker.com/products/docker-desktop/

Install Docker Desktop: Follow the installation instructions, making sure to select the "WSL 2" backend during the setup process.

Open Docker Desktop: Start the Docker Desktop application.

Enable WSL Integration:

Now you can run Open WebUI by following the standard Docker instructions from within your WSL terminal.

Run Docker Commands in WSL: Always run docker commands from your WSL terminal, not from PowerShell or Command Prompt.

File System Access: When using volume mounts (-v), make sure the paths are accessible from your WSL distribution.

The uv runtime manager ensures seamless Python environment management for applications like Open WebUI. Follow these steps to get started:

Pick the appropriate installation command for your operating system:

Once uv is installed, running Open WebUI is a breeze. Use the command below, ensuring to set the DATA_DIR environment variable to avoid data loss. Example paths are provided for each platform:

Windows (PowerShell):

Setting DATA_DIR ensures your chats and settings are saved in a predictable location. If you don't set it, uvx might store it in a temporary folder that gets deleted when the process ends.

To remove Open WebUI when running with uvx:

Stop the Server: Press Ctrl+C in the terminal where it's running.

Uninstall from UV: Enter uv tool uninstall open-webui

Available cleanup commands: The uvx command runs the application ephemerally or from cache. To remove cached components:

Remove Data (WARNING: Deletes all data): Delete your data directory (default is ~/.open-webui or the path set in DATA_DIR):

To update your locally installed Open-WebUI package to the latest version using pip, follow these simple steps:

The -U (or --upgrade) flag ensures that pip upgrades the package to the latest available version.

That's it! Your Open-WebUI package is now updated and ready to use.

If you run Open WebUI with UVICORN_WORKERS > 1 (e.g., in a production environment), you MUST ensure the update migration runs on a single worker first to prevent database schema corruption.

Steps for proper update:

Create a Conda Environment:

Activate the Environment:

If your terminal says the command doesn't exist:

Remove the Conda Environment:

Remove Data (WARNING: Deletes all data): Delete your data directory (usually ~/.open-webui unless configured otherwise):

To update your locally installed Open-WebUI package to the latest version using pip, follow these simple steps:

The -U (or --upgrade) flag ensures that pip upgrades the package to the latest available version.

That's it! Your Open-WebUI package is now updated and ready to use.

If you run Open WebUI with UVICORN_WORKERS > 1 (e.g., in a production environment), you MUST ensure the update migration runs on a single worker first to prevent database schema corruption.

Steps for proper update:

Create isolated Python environments using venv.

Create a Virtual Environment:

Activate the Virtual Environment:

If your terminal says the command doesn't exist:

Delete the Virtual Environment: Simply remove the venv folder:

Remove Data (WARNING: Deletes all data): Delete your data directory (usually ~/.open-webui unless configured otherwise):

To update your locally installed Open-WebUI package to the latest version using pip, follow these simple steps:

The -U (or --upgrade) flag ensures that pip upgrades the package to the latest available version.

That's it! Your Open-WebUI package is now updated and ready to use.

If you run Open WebUI with UVICORN_WORKERS > 1 (e.g., in a production environment), you MUST ensure the update migration runs on a single worker first to prevent database schema corruption.

Steps for proper update:

For developers who want to contribute, check the Development Guide in Advanced Topics.

Helm helps you manage Kubernetes applications.

Add Open WebUI Helm Repository:

Install Open WebUI Chart:

If you intend to scale Open WebUI using multiple nodes/pods/workers in a clustered environment, you need to setup a NoSQL key-value database. There are some environment variables that need to be set to the same value for all service-instances, otherwise consistency problems, faulty sessions and other issues will occur!

If you run Open WebUI with multiple replicas/pods (replicaCount > 1) or UVICORN_WORKERS > 1, you MUST scale down to a single replica/pod during updates.

Failure to do this can result in database corruption due to concurrent migrations.

You can access Open WebUI by port-forwarding or configuring an Ingress.

If you are using the NGINX Ingress Controller, you can enable session affinity (sticky sessions) to improve WebSocket stability. Add the following annotation to your Ingress resource:

This ensures that a user's session remains connected to the same pod, reducing issues with WebSocket connections in multi-replica setups (though correct Redis configuration makes this less critical).

Uninstall the Helm Release:

Remove Persistent Volume Claims (WARNING: Deletes all data): Helm does not automatically delete PVCs to prevent accidental data loss. You must delete them manually if you want to wipe everything.

For installation via Pinokio.computer, please visit their website:

https://pinokio.computer/

Support for this installation method is provided through their website.

(Add information about third-party integrations as they become available.)

After installing, visit:

You are now ready to start using Open WebUI!

If you're using Open WebUI with Ollama, be sure to check out our Starting with Ollama Guide to learn how to manage your Ollama instances with Open WebUI.

Need help? Have questions? Join our community:

Stay updated with the latest features, troubleshooting tips, and announcements!

**Examples:**

Example 1 (bash):
```bash
docker pull ghcr.io/open-webui/open-webui:main
```

Example 2 (bash):
```bash
docker pull ghcr.io/open-webui/open-webui:main-slim
```

Example 3 (bash):
```bash
docker pull ghcr.io/open-webui/open-webui:v0.6.42
```

Example 4 (bash):
```bash
docker run -d -p 3000:8080 -v open-webui:/app/backend/data --name open-webui ghcr.io/open-webui/open-webui:main
```

---

## Ready to Contribute to Open WebUI? Let's Get Started! 🚀

**URL:** https://docs.openwebui.com/getting-started/advanced-topics/development

**Contents:**
- Ready to Contribute to Open WebUI? Let's Get Started! 🚀
- Prerequisites​
- Setting Up Your Local Environment​
  - 1. Clone the Repository​
  - 2. Frontend Setup (User Interface)​
  - 2.5: Build the Frontend (Recommended)​
  - 3. Backend Setup (API and Server)​
- Testing From Another Device (Phone, Tablet, etc.)​
- Troubleshooting Common Issues​
  - 💥 "FATAL ERROR: Reached Heap Limit" (Frontend)​

Excited to dive into Open WebUI development? This comprehensive guide will walk you through setting up your local development environment quickly and easily. Whether you're a seasoned developer or just starting out, we'll get you ready to tweak the frontend, enhance the backend, and contribute to the future of Open WebUI! Let's get your development environment up and running in simple, detailed steps!

Before you begin, ensure your system meets these minimum requirements:

We'll set up both the frontend (user interface) and backend (API and server logic) of Open WebUI.

First, use git clone to download the Open WebUI repository to your local machine. This will create a local copy of the project on your computer.

The git clone command downloads the project files from GitHub. The cd open-webui command then navigates you into the newly created project directory.

Let's get the user interface (what you see in your browser) up and running first:

Copy the example environment file to .env:

This command copies the .env.example file to a new file named .env. The .env file is where you'll configure environment variables for the frontend.

Customize .env: Open the .env file in your code editor (like VS Code). This file contains configuration variables for the frontend, such as API endpoints and other settings. For local development, the default settings in .env.example are usually sufficient to start with. However, you can customize them if needed.

Important: Do not commit sensitive information to .env if you are contributing back to the repository.

Install Frontend Dependencies:

Navigate to the frontend directory: If you're not already in the project root (open-webui directory), ensure you are there.

Install the required JavaScript packages:

This will install all frontend dependencies listed in package.json.

Note: Depending on your Open WebUI version, you might see compatibility warnings or errors. If so, just run:

Some setups need this to get around version issues.

Start the Frontend Development Server:

This command launches the frontend development server. If the steps were followed successfully, it will usually indicate the server is running and provide a local URL.

🎉 Access the Frontend: Open your web browser and go to http://localhost:5173. You should see a message indicating that Open WebUI's frontend is running and is waiting for the backend to be available. Don't worry about that message yet! Let's set up the backend next. Keep this terminal running – it's serving your frontend!

Once you’ve verified that the frontend development server (npm run dev) is running correctly and you can see Open WebUI at http://localhost:5173, it's a good practice to also build the frontend assets. This step simulates the production environment and can help catch build-time errors that don't show up during development.

In the same frontend terminal:

We require you to use separate terminal instances for your frontend and backend processes. This keeps your workflows organized and makes it easier to manage each part of the application independently.

Using VS Code Integrated Terminals:

VS Code's integrated terminal feature makes managing multiple terminals incredibly easy. Here's how to leverage it for frontend and backend separation:

Frontend Terminal (You likely already have this): If you followed the Frontend Setup steps, you probably already have a terminal open in VS Code at the project root (open-webui directory). This is where you'll run your frontend commands (npm run dev, etc.). Ensure you are in the open-webui directory for the next steps if you are not already.

Backend Terminal (Open a New One):

Now you have two separate terminal instances within VS Code: one for the frontend (likely in the open-webui directory) and one specifically for the backend (inside the backend directory). You can easily switch between these terminals within VS Code to manage your frontend and backend processes independently. This setup is highly recommended for a cleaner and more efficient development workflow.

Backend Setup Steps (in your backend terminal):

Navigate to the Backend Directory: (You should already be in the backend directory in your new terminal from the previous step). If not, run:

Create and Activate a Conda Environment (Recommended):

We highly recommend using Conda to manage Python dependencies and isolate your project environment. This prevents conflicts with other Python projects on your system and ensures you have the correct Python version and libraries.

Make sure you activate the environment in your backend terminal before proceeding.

(Using Conda is optional but strongly recommended for managing Python dependencies and avoiding conflicts.) If you choose not to use Conda, ensure you are using Python 3.11 or higher and proceed to the next step, but be aware of potential dependency conflicts.

Alternative: Create and Activate a Python venv:

If you prefer using Python's built-in venv module instead of Conda, follow these steps:

Once activated, your terminal prompt should show (venv). You can now proceed to install dependencies.

Install Backend Dependencies:

This command uses pip (Python Package Installer) to read the requirements.txt file in the backend directory. requirements.txt lists all the Python libraries that the backend needs to run. pip install downloads and installs these libraries into your active Python environment (your Conda environment if you are using it, or your system-wide Python environment otherwise). The -U flag ensures you get the latest compatible versions of the libraries.

Start the Backend Development Server:

This command executes the dev.sh script. This script likely contains the command to start the backend development server. (You can open and examine the dev.sh file in your code editor to see the exact command being run if you are curious.) The backend server will usually start and print some output to the terminal.

📄 Explore the API Documentation: Once the backend is running, you can access the automatically generated API documentation in your web browser at http://localhost:8080/docs. This documentation is incredibly valuable for understanding the backend API endpoints, how to interact with the backend, and what data it expects and returns. Keep this documentation handy as you develop!

🎉 Congratulations! If you have followed all the steps, you should now have both the frontend and backend development servers running locally. Go back to your browser tab where you accessed the frontend (usually http://localhost:5173). Refresh the page. You should now see the full Open WebUI application running in your browser, connected to your local backend!

Want to open your dev instance from your phone or another computer on the same Wi-Fi?

In backend/dev.sh add your LAN address to the CORS list, e.g.

Restart the backend (sh dev.sh).

From your phone browse to http://192.168.1.42:5173.

All API calls will now be allowed from that origin.

Security note: The wildcard "*" works too, but do not ship that to production.

Here are solutions to some common problems you might encounter during setup or development:

This error, often seen during frontend development, indicates that Node.js is running out of memory during the build process, especially when working with large frontend applications.

Solution: Increase the Node.js heap size. This gives Node.js more memory to work with. You have a couple of options:

Using NODE_OPTIONS Environment Variable (Recommended for Development):

This is a temporary way to increase the memory limit for the current terminal session. Before running npm run dev or npm run build in your frontend terminal, set the NODE_OPTIONS environment variable:

Choose the command appropriate for your operating system and terminal. 4096 represents 4GB of memory. You can try increasing this value further if needed (e.g., 8192 for 8GB). This setting will only apply to commands run in the current terminal session.

Modifying Dockerfile (For Dockerized Environments):

If you are working with Docker, you can permanently set the NODE_OPTIONS environment variable within your Dockerfile. This is useful for consistent memory allocation in Dockerized environments, as shown in the original guide example:

Allocate Sufficient RAM: Regardless of the method, ensure your system or Docker container has enough RAM available for Node.js to use. At least 4 GB of RAM is recommended, and more might be needed for larger projects or complex builds. Close unnecessary applications to free up RAM.

If you see errors related to ports, such as "Address already in use" or "Port already bound," it means another application on your system is already using port 5173 (default for frontend) or 8080 (default for backend). Only one application can use a specific port at a time.

Identify the Conflicting Process: You need to find out which application is using the port you need.

Terminate the Conflicting Process: Once you identify the process ID (PID), you can stop the application using that port. Be careful when terminating processes, especially if you are unsure what they are.

Alternatively, Change Ports (Advanced):

Hot reload (or hot module replacement - HMR) is a fantastic development feature that automatically refreshes your browser when you make changes to the code. If it's not working, it can significantly slow down your development workflow.

Troubleshooting Steps:

In your frontend terminal, run:

If npm install fails, try npm install --force.

This command deletes the node_modules directory (where dependencies are stored) and then reinstalls them from scratch. This can resolve issues caused by corrupted or outdated packages.

If you find that icons or other static assets are failing to load, it is often due to Cross-Origin Resource Sharing (CORS) restrictions. This happens when the frontend (running on one port, e.g., 5173) tries to request resources from the backend (running on another port, e.g., 8080) without explicit permission.

Solution: You need to configure the CORS_ALLOW_ORIGIN environment variable in your backend.

We warmly welcome your contributions to Open WebUI! Your help is valuable in making this project even better. Here's a quick guide for a smooth and effective contribution workflow:

Understand the Project Structure: Take some time to familiarize yourself with the project's directory structure, especially the frontend and backend folders. Look at the code, configuration files, and documentation to get a sense of how things are organized.

Start with Small Contributions: If you are new to the project, consider starting with smaller contributions like:

Discuss Larger Changes First: If you are planning to implement a significant new feature or make substantial changes, it's highly recommended to discuss your ideas with the project maintainers or community first. You can do this by:

Create a Separate Branch for Your Work: Never commit directly to the dev branch. Always create a new branch for each feature or bug fix you are working on. This keeps your changes isolated and makes it easier to manage and submit pull requests.

To create a new branch (e.g., named my-feature-branch) based on the dev branch:

Commit Changes Frequently and Write Clear Commit Messages: Make small, logical commits as you develop features or fix bugs. Write clear and concise commit messages that explain what changes you made and why. Good commit messages make it easier to understand the history of changes and are essential for collaboration.

Stay Synced with the dev Branch Regularly: While working on your branch, periodically sync your branch with the latest changes from the dev branch to minimize merge conflicts later:

Resolve any merge conflicts that arise during the git merge step.

Run Tests (If Available) Before Pushing: While this guide doesn't detail specific testing procedures for Open WebUI, it's a good practice to run any available tests before pushing your code. Check the project's documentation or package.json (for frontend) and backend files for test-related commands (e.g., npm run test, pytest, etc.). Running tests helps ensure your changes haven't introduced regressions or broken existing functionality.

Submit a Pull Request (PR): Once you have completed your work, tested it (if applicable), and are ready to contribute your changes, submit a pull request (PR) to the dev branch of the Open WebUI repository on GitHub.

Project maintainers will review your pull request, provide feedback, and potentially merge your changes. Be responsive to feedback and be prepared to make revisions if requested.

Thank you for reading this comprehensive guide and for your interest in contributing to Open WebUI! We're excited to see your contributions and help you become a part of the Open WebUI community! 🎉 Happy coding!

**Examples:**

Example 1 (bash):
```bash
git clone https://github.com/open-webui/open-webui.gitcd open-webui
```

Example 2 (bash):
```bash
cp -RPp .env.example .env
```

Example 3 (bash):
```bash
# If you are not in the project root, run:cd open-webui
```

Example 4 (bash):
```bash
npm install
```

---

## Reduce RAM Usage

**URL:** https://docs.openwebui.com/tutorials/tips/reduce-ram-usage

**Contents:**
- Reduce RAM Usage
- Reduce RAM Usage​
- Quick Start​
- Why Does Open WebUI Use So Much RAM?​
- ⚙️ Environment Variables for RAM Reduction​
  - Offload Embedding to External Service​
  - Offload Speech-to-Text​
  - Disable Unused Features​
  - Reduce Background Task Overhead​
  - Database and Cache Optimization​

If you are deploying Open WebUI in a RAM-constrained environment (such as a Raspberry Pi, small VPS, or shared hosting), there are several strategies to significantly reduce memory consumption.

On a Raspberry Pi 4 (arm64) with version v0.3.10, these optimizations reduced idle memory consumption from >1GB to ~200MB (as observed with docker container stats).

Set the following environment variables for immediate RAM savings:

These settings can also be configured in the Admin Panel > Settings interface - set RAG embedding to Ollama or OpenAI, and Speech-to-Text to OpenAI or WebAPI.

Much of the memory consumption comes from locally loaded ML models. Even when using an external LLM (OpenAI or separate Ollama instance), Open WebUI may load additional models for:

The biggest RAM saver is using an external embedding engine:

Local Whisper models consume significant RAM:

Disable features you don't need to prevent model loading:

These settings reduce memory usage from background operations:

If using Milvus or Qdrant, enable multitenancy mode to reduce RAM:

For extremely RAM-constrained environments, use this combined configuration:

**Examples:**

Example 1 (bash):
```bash
# Use external embedding instead of local SentenceTransformersRAG_EMBEDDING_ENGINE=ollama# Use external Speech-to-Text instead of local WhisperAUDIO_STT_ENGINE=openai
```

Example 2 (bash):
```bash
# Option 1: Use Ollama for embeddings (if you have Ollama running separately)RAG_EMBEDDING_ENGINE=ollama# Option 2: Use OpenAI for embeddingsRAG_EMBEDDING_ENGINE=openaiOPENAI_API_KEY=your-api-key
```

Example 3 (bash):
```bash
# Use OpenAI's Whisper APIAUDIO_STT_ENGINE=openai# Or use browser-based WebAPI (no external service needed)AUDIO_STT_ENGINE=webapi
```

Example 4 (bash):
```bash
# Disable image generation (prevents loading image models)ENABLE_IMAGE_GENERATION=False# Disable code execution (reduces overhead)ENABLE_CODE_EXECUTION=False# Disable code interpreterENABLE_CODE_INTERPRETER=False
```

---

## Running Open WebUI in offline mode 🔌

**URL:** https://docs.openwebui.com/tutorials/offline-mode

**Contents:**
- Running Open WebUI in offline mode 🔌
- What means offline mode?​
- How to enable offline mode?​
- Approach I​
  - I: Speech-To-Text​
  - I: Text-To-Speech​
  - I: Embedding Model​
- Approach II​
  - Running Open WebUI with internet connection during setup​
  - II: Embedding Model​

Upgrade to a licensed plan for enhanced capabilities, including custom theming and branding, and dedicated support.

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

If you want to run Open WebUI in offline mode, you have to consider your installation approach and adjust your desired features accordingly. In this guide, we will go over the different ways of achieving a mostly similar setup to the online version.

The offline mode of Open WebUI lets you run the application without the need for an active internet connection. This allows you to create an 'air-gapped' environment for your LLMs and tools (a fully 'air-gapped' environment requires isolating the instance from the internet).

Disabled functionality when offline mode is enabled:

Offline mode requires setting multiple environment variables to fully disconnect Open WebUI from external network dependencies. The primary variables are:

Required Environment Variables:

Optional but Recommended:

Apply these environment variables depending on your deployment method.

When HF_HUB_OFFLINE=1 is set:

This variable provides the strictest offline enforcement but requires careful preparation.

Consider if you need to start the application offline from the beginning of your deployment. If your use case does not require immediate offline capability, follow approach II for an easier setup.

The local whisper installation does not include the model by default. In this regard, you can follow the guide only partially if you want to use an external model/provider. To use the local whisper application, you must first download the model of your choice (e.g. Huggingface - Systran).

The contents of the download directory must be copied to /app/backend/data/cache/whisper/models/ within your Open WebUI deployment. It makes sense to directly declare your whisper model via the environment variable, like this: WHISPER_MODEL=Systran/faster-whisper-large-v3.

The default local transformer can already handle the text-to-speech function. If you prefer a different approach, follow one of the guides.

For various purposes, you will need an embedding model (e.g. RAG). You will first have to download such a model of your choice (e.g. Huggingface - sentence-transformers).

The contents of the download directory must be copied to /app/backend/data/cache/embedding/models/ within your Open WebUI deployment. It makes sense to directly declare your embedding model via the environment variable, like this: RAG_EMBEDDING_MODEL=sentence-transformers/all-MiniLM-L6-v2.

This is the easiest approach to achieving the offline setup with almost all features available in the online version. Apply only the features you want to use for your deployment.

In your Open WebUI installation, navigate to Admin Settings > Settings > Documents and select the embedding model you would like to use (e.g. sentence-transformer/all-MiniLM-L6-v2). After the selection, click the download button next to it.

After you have installed all your desired features, set the environment variable OFFLINE_MODE=True depending on your type of Open WebUI deployment.

As previously mentioned, to achieve a fully offline experience with Open WebUI, you must disconnect your instance from the internet. The offline mode only prevents errors within Open WebUI when there is no internet connection.

How you disconnect your instance is your choice. Here is an example via docker-compose:

**Examples:**

Example 1 (python):
```python
from faster_whisper import WhisperModelfaster_whisper_kwargs = {    "model_size_or_path": "Systran/faster-whisper-large-v3",    "device": "cuda", # set this to download the cuda adjusted model    "compute_type": "int8",    "download_root": "/path/of/your/choice"}WhisperModel(**faster_whisper_kwargs)
```

Example 2 (python):
```python
from huggingface_hub import snapshot_downloadsnapshot_download(repo_id="sentence-transformers/all-MiniLM-L6-v2", cache_dir="/path/of/your/choice")
```

Example 3 (yaml):
```yaml
services:  # requires a reverse-proxy  open-webui:    image: ghcr.io/open-webui/open-webui:main    restart: unless-stopped    environment:      # Core offline mode settings      - OFFLINE_MODE=true      - HF_HUB_OFFLINE=1            # Disable automatic model updates      - RAG_EMBEDDING_MODEL_AUTO_UPDATE=false      - RAG_RERANKING_MODEL_AUTO_UPDATE=false      - WHISPER_MODEL_AUTO_UPDATE=false            # Specify pre-downloaded models      - RAG_EMBEDDING_MODEL=sentence-transformers/all-MiniLM-L6-v2      - WHISPER_MODEL=Systran/faster-whisper-large-v3    volumes:      - ./open-webui-data:/app/backend/data      - ./models/sentence-transformers/all-MiniLM-L6-v2:/app/backend/data/cache/embedding/models/      - ./models/Systran/faster-whisper-large-v3:/app/backend/data/cache/whisper/models/    networks:      - open-webui-internalnetworks:  open-webui-internal:    name: open-webui-internal-network    driver: bridge    internal: true
```

---

## Run DeepSeek R1 Dynamic 1.58-bit with Llama.cpp

**URL:** https://docs.openwebui.com/tutorials/integrations/deepseekr1-dynamic

**Contents:**
- Run DeepSeek R1 Dynamic 1.58-bit with Llama.cpp
- Step 1: Install Llama.cpp​
- Step 2: Download the Model Provided by UnslothAI​
- Step 3: Make Sure Open WebUI is Installed and Running​
- Step 4: Serve the Model Using Llama.cpp​
- Step 5: Connect Llama.cpp to Open WebUI​
- Example: Generating Responses​
- Notes and Considerations​

A huge shoutout to UnslothAI for their incredible efforts! Thanks to their hard work, we can now run the full DeepSeek-R1 671B parameter model in its dynamic 1.58-bit quantized form (compressed to just 131GB) on Llama.cpp! And the best part? You no longer have to despair about needing massive enterprise-class GPUs or servers — it’s possible to run this model on your personal machine (albeit slowly for most consumer hardware).

The only true DeepSeek-R1 model on Ollama is the 671B version available here: https://ollama.com/library/deepseek-r1:671b. Other versions are distilled models.

This guide focuses on running the full DeepSeek-R1 Dynamic 1.58-bit quantized model using Llama.cpp integrated with Open WebUI. For this tutorial, we’ll demonstrate the steps with an M4 Max + 128GB RAM machine. You can adapt the settings to your own configuration.

Head over to Unsloth’s Hugging Face page and download the appropriate dynamic quantized version of DeepSeek-R1. For this tutorial, we’ll use the 1.58-bit (131GB) version, which is highly optimized yet remains surprisingly functional.

Know your "working directory" — where your Python script or terminal session is running. The model files will download to a subfolder of that directory by default, so be sure you know its path! For example, if you're running the command below in /Users/yourname/Documents/projects, your downloaded model will be saved under /Users/yourname/Documents/projects/DeepSeek-R1-GGUF.

To understand more about UnslothAI’s development process and why these dynamic quantized versions are so efficient, check out their blog post: UnslothAI DeepSeek R1 Dynamic Quantization.

Here’s how to download the model programmatically:

Once the download completes, you’ll find the model files in a directory structure like this:

🛠️ Update paths in the later steps to match your specific directory structure. For example, if your script was in /Users/tim/Downloads, the full path to the GGUF file would be: /Users/tim/Downloads/DeepSeek-R1-GGUF/DeepSeek-R1-UD-IQ1_S/DeepSeek-R1-UD-IQ1_S-00001-of-00003.gguf.

If you don’t already have Open WebUI installed, no worries! It’s a simple setup. Just follow the Open WebUI documentation. Once installed, start the application — we’ll connect it in a later step to interact with the DeepSeek-R1 model.

Now that the model is downloaded, the next step is to run it using Llama.cpp’s server mode. Before you begin:

Locate the llama-server binary. If you built from source (as outlined in Step 1), the llama-server executable will be located in llama.cpp/build/bin. Navigate to this directory by using the cd command:

Replace [path-to-llama-cpp] with the location where you cloned or built Llama.cpp. For example:

Point to your model folder. Use the full path to the downloaded GGUF files created in Step 2. When serving the model, specify the first part of the split GGUF files (e.g., DeepSeek-R1-UD-IQ1_S-00001-of-00003.gguf).

Here’s the command to start the server:

🔑 Parameters to Customize Based on Your Machine:

For example, if your model was downloaded to /Users/tim/Documents/workspace, your command would look like this:

Once the server starts, it will host a local OpenAI-compatible API endpoint at:

🖥️ Llama.cpp Server Running

After running the command, you should see a message confirming the server is active and listening on port 10000.

Be sure to keep this terminal session running, as it serves the model for all subsequent steps.

🖥️ Adding Connection in Open WebUI

After running the command, you should see a message confirming the server is active and listening on port 10000.

Once the connection is saved, you can start querying DeepSeek-R1 directly from Open WebUI! 🎉

You can now use Open WebUI’s chat interface to interact with the DeepSeek-R1 Dynamic 1.58-bit model.

Performance: Running a massive 131GB model like DeepSeek-R1 on personal hardware will be slow. Even with our M4 Max (128GB RAM), inference speeds were modest. But the fact that it works at all is a testament to UnslothAI’s optimizations.

VRAM/Memory Requirements: Ensure sufficient VRAM and system RAM for optimal performance. With low-end GPUs or CPU-only setups, expect slower speeds (but it’s still doable!).

Thanks to UnslothAI and Llama.cpp, running one of the largest open-source reasoning models, DeepSeek-R1 (1.58-bit version), is finally accessible to individuals. While it’s challenging to run such models on consumer hardware, the ability to do so without massive computational infrastructure is a significant technological milestone.

⭐ Big thanks to the community for pushing the boundaries of open AI research.

Happy experimenting! 🚀

**Examples:**

Example 1 (python):
```python
# Install Hugging Face dependencies before running this:# pip install huggingface_hub hf_transferfrom huggingface_hub import snapshot_downloadsnapshot_download(    repo_id = "unsloth/DeepSeek-R1-GGUF",  # Specify the Hugging Face repo    local_dir = "DeepSeek-R1-GGUF",         # Model will download into this directory    allow_patterns = ["*UD-IQ1_S*"],        # Only download the 1.58-bit version)
```

Example 2 (txt):
```txt
DeepSeek-R1-GGUF/├── DeepSeek-R1-UD-IQ1_S/│   ├── DeepSeek-R1-UD-IQ1_S-00001-of-00003.gguf│   ├── DeepSeek-R1-UD-IQ1_S-00002-of-00003.gguf│   ├── DeepSeek-R1-UD-IQ1_S-00003-of-00003.gguf
```

Example 3 (bash):
```bash
cd [path-to-llama-cpp]/llama.cpp/build/bin
```

Example 4 (bash):
```bash
cd ~/Documents/workspace/llama.cpp/build/bin
```

---

## Secure Your Open WebUI with HTTPS 🔒

**URL:** https://docs.openwebui.com/getting-started/advanced-topics/https-encryption

**Contents:**
- Secure Your Open WebUI with HTTPS 🔒
- Why HTTPS Matters 🛡️​
- Choosing Your Solution 🛠️​
  - 🏠 For Local/Docker Users​
  - ☁️ For Cloud Deployments​
  - 🧪 For Development​
- 📚 Implementation Guides​
  - Nginx Setup
  - Caddy Setup
  - 📂 View All HTTPS Tutorials

While HTTPS is not strictly required for basic local operation, it is highly recommended for all deployments and mandatory for enabling specific features like Voice Calls.

Modern browsers require a Secure Context (HTTPS) to access the microphone. Voice Calls will NOT work if you access Open WebUI via http:// (unless using localhost).

Enabling HTTPS encryption provides essential benefits:

The best method depends on your infrastructure.

If you are running Open WebUI with Docker, the standard approach is to use a Reverse Proxy. This sits in front of Open WebUI and handles the SSL encryption.

Ready to set it up? Check out our dedicated tutorial category for step-by-step configurations:

Manual control and high performance.

Zero-config automatic HTTPS.

Browse the full category of guides.

---

## Setting up with Custom CA Store

**URL:** https://docs.openwebui.com/tutorials/integrations/custom-ca

**Contents:**
- Setting up with Custom CA Store

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

If you get an [SSL: CERTIFICATE_VERIFY_FAILED] error when trying to run OI, most likely the issue is that you are on a network which intercepts HTTPS traffic (e.g., a corporate network).

To fix this, you will need to add the new cert into OI's truststore.

For pre-built Docker image:

If the environment variable REQUESTS_CA_BUNDLE does not work try to set SSL_CERT_FILE (as per the httpx documentation) instead with the same value.

Example compose.yaml from @KizzyCode:

The ro flag mounts the CA store as read-only and prevents accidental changes to your host CA store For local development:

You can also add the certificates in the build process by modifying the Dockerfile. This is useful if you want to make changes to the UI, for instance. Since the build happens in multiple stages, you have to add the cert into both

**Examples:**

Example 1 (yaml):
```yaml
services:  openwebui:    image: ghcr.io/open-webui/open-webui:main    volumes:      - /var/containers/openwebui:/app/backend/data:rw      - /etc/containers/openwebui/compusrv.crt:/etc/ssl/certs/ca-certificates.crt:ro      - /etc/timezone:/etc/timezone:ro      - /etc/localtime:/etc/localtime:ro    environment:      - WEBUI_NAME=compusrv      - ENABLE_SIGNUP=False      - ENABLE_COMMUNITY_SHARING=False      - WEBUI_SESSION_COOKIE_SAME_SITE=strict      - WEBUI_SESSION_COOKIE_SECURE=True      - ENABLE_OLLAMA_API=False      - REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
```

Example 2 (dockerfile):
```dockerfile
COPY package.json package-lock.json <YourRootCert>.crt ./ENV NODE_EXTRA_CA_CERTS=/app/<YourRootCert>.crtRUN npm ci
```

Example 3 (dockerfile):
```dockerfile
COPY <CorporateSSL.crt> /usr/local/share/ca-certificates/RUN update-ca-certificatesENV PIP_CERT=/etc/ssl/certs/ca-certificates.crt \    REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
```

---

## SQLite Database Overview

**URL:** https://docs.openwebui.com/tutorials/tips/sqlite-database

**Contents:**
- SQLite Database Overview
- Open-WebUI Internal SQLite Database​
- Internal SQLite Location​
- Copy Database Locally​
- Table Overview​
- Auth Table​
- Channel Table​
- Channel Member Table​
- Channel File Table​
- Chat Table​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

[!WARNING] This documentation was created/updated based on version 0.6.42 and updated for recent migrations.

For Open-WebUI, the SQLite database serves as the backbone for user management, chat history, file storage, and various other core functionalities. Understanding this structure is essential for anyone looking to contribute to or maintain the project effectively.

You can find the SQLite database at root -> data -> webui.db

If you want to copy the Open-WebUI SQLite database running in the container to your local machine, you can use:

Alternatively, you can access the database within the container using:

Here is a complete list of tables in Open-WebUI's SQLite database. The tables are listed alphabetically and numbered for convenience.

Note: there are two additional tables in Open-WebUI's SQLite database that are not related to Open-WebUI's core functionality, that have been excluded:

Now that we have all the tables, let's understand the structure of each table.

Things to know about the auth table:

Things to know about the auth table:

Things to know about the channel_file table:

Things to know about the chat_file table:

Why this table was added:

The meta field's expected structure:

Things to know about the folder table:

Things to know about the function table:

Note: The user_ids column has been migrated to the group_member table.

Things to know about the group_member table:

Things to know about the knowledge_file table:

The access_control fields expected structure:

Things to know about the tag table:

To help visualize the relationship between the tables, refer to the below Entity Relationship Diagram (ERD) generated with Mermaid.

For enhanced security, Open WebUI supports at-rest encryption for its primary SQLite database using SQLCipher. This is recommended for deployments handling sensitive data where using a larger database like PostgreSQL is not needed.

SQLCipher encryption requires additional dependencies that are not included by default. Before using this feature, you must install:

For Docker users, this means building a custom image with these dependencies included.

To enable encryption, set the following environment variables:

When these are set and a full DATABASE_URL is not explicitly defined, Open WebUI will automatically create and use an encrypted database file at ./data/webui.db.

For more details, see the Environment Variable Configuration documentation.

**Examples:**

Example 1 (txt):
```txt
📁 Root (/)├── 📁 data│   ├── 📁 cache│   ├── 📁 uploads│   ├── 📁 vector_db│   └── 📄 webui.db├── 📄 dev.sh├── 📁 open_webui├── 📄 requirements.txt├── 📄 start.sh└── 📄 start_windows.bat
```

Example 2 (bash):
```bash
docker cp open-webui:/app/backend/data/webui.db ./webui.db
```

Example 3 (bash):
```bash
docker exec -it open-webui /bin/sh
```

Example 4 (python):
```python
{    "name": string,          # Optional display name    "content_type": string,  # MIME type    "size": integer,         # File size in bytes    # Additional metadata supported via ConfigDict(extra="allow")}
```

---

## Starting With Ollama

**URL:** https://docs.openwebui.com/getting-started/quick-start/starting-with-ollama

**Contents:**
- Starting With Ollama
- Overview​
- Step 1: Setting Up the Ollama Connection​
- Step 2: Managing Your Ollama Instance​
  - Connection Tips​
  - Advanced Configuration​
- A Quick and Efficient Way to Download Models​
- All Set!​

Open WebUI makes it easy to connect and manage your Ollama instance. This guide will walk you through setting up the connection, managing models, and getting started.

Once Open WebUI is installed and running, it will automatically attempt to connect to your Ollama instance. If everything goes smoothly, you’ll be ready to manage and use models right away.

However, if you encounter connection issues, the most common cause is a network misconfiguration. You can refer to our connection troubleshooting guide for help resolving these problems.

To manage your Ollama instance in Open WebUI, follow these steps:

Here’s what the management screen looks like:

If you’re looking for a faster option to get started, you can download models directly from the Model Selector. Simply type the name of the model you want, and if it’s not already available, Open WebUI will prompt you to download it from Ollama.

Here’s an example of how it works:

This method is perfect if you want to skip navigating through the Admin Settings menu and get right to using your models.

That’s it! Once your connection is configured and your models are downloaded, you’re ready to start using Ollama with Open WebUI. Whether you’re exploring new models or running your existing ones, Open WebUI makes everything simple and efficient.

If you run into any issues or need more guidance, check out our help section for detailed solutions. Enjoy using Ollama! 🎉

---

## Understanding Open WebUI Logging 🪵

**URL:** https://docs.openwebui.com/getting-started/advanced-topics/logging

**Contents:**
- Understanding Open WebUI Logging 🪵
- 🖥️ Browser Client Logging (Frontend)​
- ⚙️ Application Server/Backend Logging (Python)​
  - 🚦 Logging Levels Explained​
  - 🌍 Global Logging Level (GLOBAL_LOG_LEVEL)​

Logging is essential for debugging, monitoring, and understanding how Open WebUI is behaving. This guide explains how logging works in both the browser client (frontend) and the application server/backend.

For frontend development and debugging, Open WebUI utilizes standard browser console logging. This means you can see logs directly within your web browser's built-in developer tools.

How to Access Browser Logs:

Open Developer Tools: In most browsers, you can open developer tools by:

Navigate to the "Console" Tab: Within the developer tools panel, find and click on the "Console" tab.

Types of Browser Logs:

Open WebUI primarily uses JavaScript's console.log() for client-side logging. You'll see various types of messages in the console, including:

Browser-Specific Developer Tools:

Different browsers offer slightly different developer tools, but they all provide a console for viewing JavaScript logs. Here are links to documentation for popular browsers:

The backend of Open WebUI uses Python's built-in logging module to record events and information on the server side. These logs are crucial for understanding server behavior, diagnosing errors, and monitoring performance.

Python logging uses a hierarchy of levels to categorize log messages by severity. Here's a breakdown of the levels, from most to least severe:

Default Level: Open WebUI's default logging level is INFO.

You can change the global logging level for the entire Open WebUI backend using the GLOBAL_LOG_LEVEL environment variable. This is the most straightforward way to control overall logging verbosity.

Setting GLOBAL_LOG_LEVEL configures the root logger in Python, affecting all loggers in Open WebUI and potentially some third-party libraries that use basicConfig. It uses logging.basicConfig(force=True), which means it will override any existing root logger configuration.

Example: Setting to DEBUG

Docker Compose (docker-compose.yml):

Impact: Setting GLOBAL_LOG_LEVEL to DEBUG will produce the most verbose logs, including detailed information that is helpful for development and troubleshooting. For production environments, INFO or WARNING might be more appropriate to reduce log volume.

By understanding and utilizing these logging mechanisms, you can effectively monitor, debug, and gain insights into your Open WebUI instance.

**Examples:**

Example 1 (bash):
```bash
--env GLOBAL_LOG_LEVEL="DEBUG"
```

Example 2 (yaml):
```yaml
environment:  - GLOBAL_LOG_LEVEL=DEBUG
```

---

## Updating Open WebUI

**URL:** https://docs.openwebui.com/getting-started/updating

**Contents:**
- Updating Open WebUI
- Overview​
- Manual Update​
  - Step 1: Stop and Remove Current Container​
  - Step 2: Pull Latest Docker Image​
  - (Optional) Using image tags in production​
  - Step 3: Start Container with Updated Image​
  - Verify Update Success​
- Persistent Login Sessions​
  - Generate and Set Secret Key​

Keeping Open WebUI updated ensures you have the latest features, security patches, and bug fixes. You can update manually or automate the process using container update tools.

Manual updates give you complete control and are recommended for production environments or when you need to review changes before applying them.

This stops the running container and removes it without deleting your data stored in the Docker volume.

If your container isn't named open-webui, find it with:

Look in the "NAMES" column for your actual container name.

Download the newest Open WebUI image from the container registry.

Your chat histories, settings, and uploaded files are stored in a Docker volume named open-webui. Pulling a new image does not affect this data. The volume persists independently of the container.

Open WebUI provides multiple Docker image tags depending on how you want to manage updates. If you want to always run the latest version of Open WebUI, you can use the :main, :cuda, or :ollama image tags, depending on your setup.

Examples (latest version tags):

For production environments where stability and reproducibility are important, it is recommended to pin a specific release version instead of using these floating tags.

Versioned images follow this format:

Examples (pinned versions — replace with the release version you want to use):

Recreate the container using the new image while mounting your existing data volume.

If you're not setting WEBUI_SECRET_KEY, it will be auto-generated each time you recreate the container, causing you to be logged out after every update.

See the Persistent Login Sessions section below to fix this.

Check that Open WebUI started successfully:

Successful startup indicators:

Then verify in your browser:

To avoid being logged out after every update, you must set a persistent WEBUI_SECRET_KEY.

Generate a cryptographically secure key with:

For complete environment variable documentation, see Environment Configuration.

Automated updates can save time but require careful consideration of the trade-offs.

Automated updates can break your deployment if:

The original containrrr/watchtower is no longer maintained and does not work with Docker 29+. The community has created maintained forks that resolve these issues.

The original Watchtower project hasn't received updates in over two years and fails with Docker version 29.0.0 or newer due to API version incompatibility. Two maintained forks are now available: nickfedor/watchtower and Marrrrrrrrry/watchtower, both compatible with Docker 29+.

Recommended: nickfedor/watchtower fork

Run Watchtower once to update all containers, then exit:

Run Watchtower as a persistent container that checks for updates every 6 hours:

Watchtower configuration options:

To receive notifications without automatic updates:

Alternative fork: Marrrrrrrrry/watchtower is another actively maintained fork with updated dependencies and simplified functions.

For complete Watchtower documentation, visit https://watchtower.nickfedor.com/

What's Up Docker (WUD) is a notification-focused alternative that doesn't automatically update containers but instead provides a web UI to monitor updates and trigger them manually.

Quick start with WUD:

After starting WUD, access the web interface at http://localhost:3001. You'll see all containers and available updates with click-to-update buttons.

Copy the part after the colon, and replace each $ with $$ in docker-compose.

For complete WUD documentation, visit https://getwud.github.io/wud/

Diun is a lightweight CLI tool that only sends notifications about available updates without performing any updates. It's ideal if you want complete control and just need alerts.

For complete Diun documentation, visit https://crazymax.dev/diun/

Check logs for errors:

Solution: Restore previous version and investigate:

If you suspect data issues:

Configure update schedule with cron expressions:

If the key isn't showing, you didn't pass it correctly when recreating the container.

The open-webui Docker volume contains all your data (chats, users, uploads, etc.).

Common volume locations:

Avoid directly modifying files in the volume location. Always interact through the container or Docker commands to prevent corruption.

After updating, old images remain on disk. Remove them to free space:

Watchtower can do this automatically with:

After updating, verify everything works:

If the interface looks broken or old after updating:

**Examples:**

Example 1 (bash):
```bash
# Replace 'open-webui' with your container name if different# Use 'docker ps' to find your container name if unsuredocker rm -f open-webui
```

Example 2 (bash):
```bash
docker ps -a | grep open-webui
```

Example 3 (bash):
```bash
docker pull ghcr.io/open-webui/open-webui:main
```

Example 4 (text):
```text
main: Pulling from open-webui/open-webuiDigest: sha256:abc123...Status: Downloaded newer image for ghcr.io/open-webui/open-webui:main
```

---

## Use your Open WebUI models with Iterm2

**URL:** https://docs.openwebui.com/tutorials/integrations/iterm2

**Contents:**
- Use your Open WebUI models with Iterm2
- Why use the Iterm2 AI plugin?​
- Why connect to your Open WebUI instance?​
- Prerequisites​
  - 1. Download the iTerm2 AI plugin​
  - 2. Generate your Open WebUI API key​
- Configuration​
  - Verify the installed plugin​
  - Give consent for generative AI features​
  - Set API key​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

You can use your Open WebUI models within the Iterm2 AI plugin. This guide shows you how to set up the necessary configuration.

Whenever you forget a command or need a quick bash script for a repetitive task, you likely already use AI responses. To streamline this workflow, the Iterm2 AI plugin allows you to send requests to your specified AI provider or your Open WebUI.

Open WebUI provides a simple and straightforward way to interact with your LLMs via its API Endpoints. This is particularly beneficial if you are running your own LLMs locally. Furthermore, you can leverage all your implemented features, monitoring, and other capabilities.

If you haven't already installed the iTerm2 AI plugin, you'll need to download it first from their page. Unzip the file and move the application into your Applications folder.

To authenticate with your Open WebUI instance, you'll need to generate an API key. Follow the instructions in this guide to create it.

Open your iTerm2 terminal and navigate to Settings (⌘,) from the iTerm2 menu, then select the AI tab.

Once the iTerm2 AI plugin is installed, verify that the Plugin section shows Plugin installed and working ✅.

Under the Consent section, check the box for Enable generative AI features to agree.

Enter your previously created Open WebUI API token into the API Key field.

If you want a specialized prompt sent to your LLM, feel free to edit the Prompt template.

Original prompt example:

You can read more about the Iterm2 prompt in the Iterm2 documentation.

Since the iTerm2 AI plugin does not automatically list your custom models, you'll need to add your preferred one manually. In your Open WebUI instance, navigate to Admin Panel > Settings > Models, and then click on your preferred LLM. Below the user-given name, you'll find the actual model name that you need to enter into iTerm2 (e.g., name: Gemma3 - model name: /models/gemma3-27b-it-Q4_K_M.gguf).

Set your preferred amount of tokens here. Typically, your inference tool will already have a limitation set.

This is a crucial step: you need to direct the iTerm2 AI plugin requests to your Open WebUI instance. Either use an actual domain name if the instance is hosted somewhere (e.g., https://example.com/api/chat/completions) or your localhost setup (e.g., http://localhost:8080/api/chat/completions). You can find more information about the URLs in the API Endpoints guide.

This setting is not needed for Open WebUI, though more information is available in the original guide.

After setup, the AI section will look like this:

Within your terminal session, open the prompt input field by pressing command + y (⌘y). Write your prompt and send it by clicking the OK button or by using shift + enter (⇧⌤).

This will lead you back to the terminal with an additional window bound to the session frame. The result of your query will be displayed within this overlay. To send the command to your terminal, move your cursor to the target line and use shift + enter (⇧⌤).

There can be more than one line of response. If so, you can navigate with the arrow keys to edit the commands as needed.

**Examples:**

Example 1 (text):
```text
Return commands suitable for copy/pasting into \(shell) on \(uname). DoNOT include commentary NOR Markdown triple-backtick code blocks as yourwhole response will be copied into my terminal automatically.The script should do this: \(ai.prompt)
```

---

## Workload Identity Authentication

**URL:** https://docs.openwebui.com/tutorials/integrations/azure-openai/workload-identity-auth

**Contents:**
- Workload Identity Authentication
- Overview​
- Prerequisites​
  - OpenWebUI​
- Terraform Configuration​
  - 1. Create a Kubernetes Namespace​
  - 2. Create a User Assigned Identity​
  - 3. Create Federated Identity Credential​
  - 4. Assign RBAC Role for Azure OpenAI Access​
  - 5. Deploy Open WebUI via Helm​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This guide explains how to configure Open WebUI on Azure Kubernetes Service (AKS) with Workload Identity authentication for Azure OpenAI.

Workload Identity allows your AKS pods to authenticate to Azure services using Azure Entra ID (formerly Azure AD) without storing credentials in your cluster. This provides a secure, managed identity solution for accessing Azure OpenAI.

Below is a complete Terraform configuration for setting up Workload Identity authentication:

We need to create a Kubernetes namespace first so that we can programmatically assign this to our helm deployment but also to our user-assigned identity and federated identity credential in the next steps.

We first create a Azure Assigned Identity that your Open WebUI pods will use to authenticate to Azure services.

The Federated Identity Credentials establishes a trust relationship between your Kubernetes service account and the Azure User Assigned Identity, allowing pods to exchange Kubernetes tokens for Azure tokens.

With the trust relationship established between Azure and our User Assigned Identity we can now assign this identity a role. In this case we assign it Cognitive Services OpenAI User but if you want to use other Azure features you could ofcourse add more role assignments in the future.

By default our User Assigned Identity has no access to anything and will need to be given Azure RBAC roles to allow it access to various Azure resources.

Make sure to replace YOUR_COGNITIVE_ACCOUNT_ID with the cognitive account id of your Azure OpenAI instance.

This deploys Open WebUI to your AKS cluster with the necessary service account annotations and pod labels to enable Workload Identity authentication.

After deploying Open WebUI you can follow these steps to configure your Azure OpenAI connection:

The service account must have the following annotation to link it with the Azure User Assigned Identity:

Pods must include the following label to enable workload identity:

The federated identity credential creates a trust relationship between:

The subject field follows the format:

Authentication Failures

Check service account annotations:

Check workload identity webhook:

**Examples:**

Example 1 (hcl):
```hcl
resource "kubernetes_namespace" "this" {  metadata {    name = var.kubernetes_namespace  }}
```

Example 2 (hcl):
```hcl
resource "azurerm_user_assigned_identity" "uai" {  location            = var.location  name                = var.workload_identity_name  resource_group_name = var.resource_group_name}
```

Example 3 (hcl):
```hcl
resource "azurerm_federated_identity_credential" "federated_identity" {  name                = "federated-identity"  resource_group_name = var.resource_group_name  audience            = ["api://AzureADTokenExchange"]  issuer              = data.terraform_remote_state.aks.outputs.oidc_issuer_url  parent_id           = azurerm_user_assigned_identity.uai.id  subject             = "system:serviceaccount:${kubernetes_namespace.this.metadata[0].name}:${var.kubernetes_service_account_name}"}
```

Example 4 (hcl):
```hcl
resource "azurerm_role_assignment" "workload_identity_azure_openai" {  scope                = "YOUR_COGNITIVE_ACCOUNT_ID"  role_definition_name = "Cognitive Services OpenAI User"  principal_id         = azurerm_user_assigned_identity.uai.principal_id}
```

---

## 📚 Advanced Topics

**URL:** https://docs.openwebui.com/getting-started/advanced-topics

**Contents:**
- 📚 Advanced Topics
- 🛠️ Development​
- 📝 Logging​
- 🔒 HTTPS Encryption​
- 📊 Monitoring​

Explore deeper concepts and advanced configurations of Open WebUI to enhance your setup.

Understand the development setup and contribute to Open WebUI. Development Guide

Learn how to configure and manage logs for troubleshooting your system. Logging Guide

Ensure secure communication by implementing HTTPS encryption in your deployment. HTTPS Encryption Guide

Learn how to monitor your Open WebUI instance, including health checks, model connectivity, and response testing. Monitoring Guide

Looking for installation instructions? Head over to our Quick Start Guide.

---

## 📚 Advanced Topics

**URL:** https://docs.openwebui.com/getting-started/advanced-topics/

**Contents:**
- 📚 Advanced Topics
- 🛠️ Development​
- 📝 Logging​
- 🔒 HTTPS Encryption​
- 📊 Monitoring​

Explore deeper concepts and advanced configurations of Open WebUI to enhance your setup.

Understand the development setup and contribute to Open WebUI. Development Guide

Learn how to configure and manage logs for troubleshooting your system. Logging Guide

Ensure secure communication by implementing HTTPS encryption in your deployment. HTTPS Encryption Guide

Learn how to monitor your Open WebUI instance, including health checks, model connectivity, and response testing. Monitoring Guide

Looking for installation instructions? Head over to our Quick Start Guide.

---

## 🔐 Dual OAuth Configuration (Microsoft & Google)

**URL:** https://docs.openwebui.com/tutorials/tips/dual-oauth-configuration

**Contents:**
- 🔐 Dual OAuth Configuration (Microsoft & Google)
- Overview​
- Prerequisites​
- Configuration logic​
- Environment Variables​
- Why This Works​
- Troubleshooting​

This configuration is a community-contributed workaround and is not officially supported by the Open WebUI team. While it works in current versions, behavior may change in future updates. This tutorial serves as a demonstration for advanced users.

While Open WebUI officially supports only one OpenID Connect (OIDC) provider at a time via the OPENID_PROVIDER_URL variable, it is possible to support both Microsoft and Google simultaneously.

The trick is to configure one provider (e.g., Microsoft) as the primary OIDC provider and the other (e.g., Google) as a standard OAuth provider by utilizing Open WebUI's built-in support for specific providers.

Open WebUI uses OPENID_PROVIDER_URL as a generic "catch-all" for OIDC. However, it also has native modules for Google and Microsoft. By leaving the OPENID_PROVIDER_URL for Microsoft and providing only the Client IDs for Google, the system can internalize both flows.

Add the following to your docker-compose.yaml or environment config:

**Examples:**

Example 1 (bash):
```bash
# Enable signup and account merging (CRITICAL)ENABLE_OAUTH_SIGNUP=trueOAUTH_MERGE_ACCOUNTS_BY_EMAIL=true# 1. Microsoft as the primary OIDC provider# This uses the generic OIDC flow via the OPENID_PROVIDER_URLMICROSOFT_CLIENT_ID=your_microsoft_client_idMICROSOFT_CLIENT_SECRET=your_microsoft_client_secretMICROSOFT_CLIENT_TENANT_ID=your_tenant_idMICROSOFT_REDIRECT_URI=https://your-webui.com/oauth/microsoft/callbackOPENID_PROVIDER_URL=https://login.microsoftonline.com/your_tenant_id/v2.0/.well-known/openid-configuration# 2. Google as a secondary OAuth provider# Note: Do NOT provide an OPENID_PROVIDER_URL for Google.# The system will use its internal Google OAuth implementation.GOOGLE_CLIENT_ID=your_google_client_idGOOGLE_CLIENT_SECRET=your_google_client_secret
```

---

## 🚀 Getting Started

**URL:** https://docs.openwebui.com/getting-started/

**Contents:**
- 🚀 Getting Started
- ⏱️ Quick Start​
- 🛠️ Advanced Topics​
- 🔄 Updating Open WebUI​

We are hiring! Shape the way humanity engages with intelligence.

Welcome to the Open WebUI Documentation Hub! Below is a list of essential guides and resources to help you get started, manage, and develop with Open WebUI.

Get up and running quickly with our Quick Start Guide.

Take a deeper dive into configurations and development tips in our Advanced Topics Guide.

Stay current with the latest features and security patches with our Updating Open WebUI guide.

Happy exploring! 🎉 If you have questions, join our community or raise an issue on GitHub.

---

## 🚀 Getting Started

**URL:** https://docs.openwebui.com/getting-started

**Contents:**
- 🚀 Getting Started
- ⏱️ Quick Start​
- 🛠️ Advanced Topics​
- 🔄 Updating Open WebUI​

We are hiring! Shape the way humanity engages with intelligence.

Welcome to the Open WebUI Documentation Hub! Below is a list of essential guides and resources to help you get started, manage, and develop with Open WebUI.

Get up and running quickly with our Quick Start Guide.

Take a deeper dive into configurations and development tips in our Advanced Topics Guide.

Stay current with the latest features and security patches with our Updating Open WebUI guide.

Happy exploring! 🎉 If you have questions, join our community or raise an issue on GitHub.

---

## 🔗 Okta OIDC SSO Integration

**URL:** https://docs.openwebui.com/tutorials/integrations/okta-oidc-sso

**Contents:**
- 🔗 Okta OIDC SSO Integration
- Overview​
  - Prerequisites​
- Setting up Okta​
  - 1. Create/Configure OIDC Application in Okta​
  - 2. Add a Groups Claim to the ID Token​
  - 3. Applying MFA (e.g., Google Authenticator)​
- Configuring Open WebUI​
- Verification​
- Troubleshooting​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This documentation page outlines the steps required to integrate Okta OIDC Single Sign-On (SSO) with Open WebUI. It also covers the optional features of managing Open WebUI user groups based on Okta group membership, including Just-in-Time (JIT) group creation. By following these steps, you will enable users to log in to Open WebUI using their Okta credentials. If you choose to enable group syncing (ENABLE_OAUTH_GROUP_MANAGEMENT), users will be automatically assigned to relevant groups within Open WebUI based on their Okta groups upon login. If you also enable JIT group creation (ENABLE_OAUTH_GROUP_CREATION), groups present in Okta claims but missing in Open WebUI will be created automatically during login.

First, you need to configure an OIDC application within your Okta organization and set up a groups claim to pass group information to Open WebUI.

Log in to your Okta Admin Console.

Navigate to Applications > Applications.

Either create a new OIDC - OpenID Connect application (choose Web Application as the type) or select an existing one you wish to use for Open WebUI.

During setup or in the application's General settings tab, configure the Sign-in redirect URIs. Add the URI for your Open WebUI instance, followed by /oauth/oidc/callback. Example: https://your-open-webui.com/oauth/oidc/callback.

Take note of the Client ID and Client secret provided on the application's General tab. You will need these for the Open WebUI configuration.

Ensure the correct users or groups are assigned to this application under the Assignments tab.

(Optional) To enable automatic group management in Open WebUI based on Okta groups, you need to configure Okta to send the user's group memberships in the ID token. If you only need SSO login and prefer to manage groups manually within Open WebUI, you can skip this section.

For more advanced group claim configurations, refer to the Okta documentation on customizing tokens and group functions.

To enhance security, you can enforce Multi-Factor Authentication (MFA) for users logging into Open WebUI via Okta. This example demonstrates how to set up Google Authenticator as an additional factor.

Configure an Authenticator:

Create and Apply a Sign-On Policy:

Now, when users log in to Open WebUI, they will be required to provide their Okta password and an additional verification code from Google Authenticator.

Re-authentication Frequency By default, Okta's Sign-On Policy may not prompt for MFA on every login from the same device or browser to improve user experience. If you require MFA for every session, you can adjust this setting within the policy rule you created. Look for the "Prompt for re-authentication" setting and set it to "Every sign-in attempt".

To enable Okta OIDC SSO in Open WebUI, you need to set the following core environment variables. Additional variables are required if you wish to enable the optional group management feature.

Replace YOUR_OKTA_CLIENT_ID, YOUR_OKTA_CLIENT_SECRET, and YOUR_OKTA_OIDC_DISCOVERY_URL with the actual values from your Okta application configuration.

To enable group synchronization based on Okta claims, set ENABLE_OAUTH_GROUP_MANAGEMENT="true" and ensure OAUTH_GROUP_CLAIM matches the claim name configured in Okta (default is groups).

To also enable automatic Just-in-Time (JIT) creation of groups that exist in Okta but not yet in Open WebUI, set ENABLE_OAUTH_GROUP_CREATION="true". You can leave this as false if you only want to manage memberships for groups that already exist in Open WebUI.

Group Membership Management When ENABLE_OAUTH_GROUP_MANAGEMENT is set to true, a user's group memberships in Open WebUI will be strictly synchronized with the groups received in their Okta claims upon each login. This means:

Ensure that all necessary groups are correctly configured and assigned within Okta and included in the group claim.

Session Persistence in Multi-Node Deployments

When deploying Open WebUI across multiple nodes (e.g., in a Kubernetes cluster or behind a load balancer), it is crucial to ensure session persistence for a seamless user experience, especially with SSO. Set the WEBUI_SECRET_KEY environment variable to the same secure, unique value on all Open WebUI instances.

If this key is not consistent across all nodes, users may be forced to log in again if their session is routed to a different node, as the session token signed by one node will not be valid on another. By default, the Docker image generates a random key on first start, which is unsuitable for multi-node setups.

Disabling the Standard Login Form

If you intend to only allow logins via Okta (and potentially other configured OAuth providers), you can disable the standard email/password login form by setting the following environment variable:

Important Prerequisite Setting ENABLE_LOGIN_FORM="false" requires ENABLE_OAUTH_SIGNUP="true" to be set as well. If you disable the login form without enabling OAuth signup, users (including administrators) will be unable to log in. Ensure at least one OAuth provider is configured and ENABLE_OAUTH_SIGNUP is enabled before disabling the standard login form.

Restart your Open WebUI instance after setting these environment variables.

400 Bad Request/Redirect URI Mismatch: Double-check that the Sign-in redirect URI in your Okta application exactly matches <your-open-webui-url>/oauth/oidc/callback.

Groups Not Syncing: Verify that the OAUTH_GROUP_CLAIM environment variable matches the claim name configured in the Okta ID Token settings. Ensure the user has logged out and back in after group changes - a login flow is required to update OIDC. Remember admin groups are not synced.

Configuration Errors: Review the Open WebUI server logs for detailed error messages related to OIDC configuration.

Refer to the official Open WebUI SSO Documentation.

Consult the Okta Developer Documentation.

**Examples:**

Example 1 (bash):
```bash
# --- OIDC Core Settings ---# Enable OAuth signup if you want users to be able to create accounts via Okta# ENABLE_OAUTH_SIGNUP="true"# Your Okta application's Client IDOAUTH_CLIENT_ID="YOUR_OKTA_CLIENT_ID"# Your Okta application's Client SecretOAUTH_CLIENT_SECRET="YOUR_OKTA_CLIENT_SECRET"# Your Okta organization's OIDC discovery URL# Format: https://<your-okta-domain>/.well-known/openid-configuration# Or for a specific authorization server: https://<your-okta-domain>/oauth2/<auth-server-id>/.well-known/openid-configurationOPENID_PROVIDER_URL="YOUR_OKTA_OIDC_DISCOVERY_URL"# Name displayed on the login button (e.g., "Login with Okta")OAUTH_PROVIDER_NAME="Okta"# Scopes to request (default is usually sufficient)# OAUTH_SCOPES="openid email profile groups" # Ensure 'groups' is included if not default# --- OAuth Group Management (Optional) ---# Set to "true" only if you configured the Groups Claim in Okta (Step 2)# and want Open WebUI groups to be managed based on Okta groups upon login.# This syncs existing groups. Users will be added/removed from Open WebUI groups# to match their Okta group claims.# ENABLE_OAUTH_GROUP_MANAGEMENT="true"# Required only if ENABLE_OAUTH_GROUP_MANAGEMENT is true.# The claim name in the ID token containing group information (must match Okta config)# OAUTH_GROUP_CLAIM="groups"# Optional: Enable Just-in-Time (JIT) creation of groups if they exist in Okta claims but not in Open WebUI.# Requires ENABLE_OAUTH_GROUP_MANAGEMENT="true".# If set to false (default), only existing groups will be synced.# ENABLE_OAUTH_GROUP_CREATION="false"
```

Example 2 (bash):
```bash
# Example: Generate a strong secret key (e.g., using openssl rand -hex 32)WEBUI_SECRET_KEY="YOUR_UNIQUE_AND_SECURE_SECRET_KEY"
```

Example 3 (bash):
```bash
ENABLE_LOGIN_FORM="false"
```

---

## 🔗 Redis Websocket Support

**URL:** https://docs.openwebui.com/tutorials/integrations/redis

**Contents:**
- 🔗 Redis Websocket Support
- Overview​
- When is Redis Required?​
  - Single Instance Deployments​
  - Multi-Worker and Multi-Instance Deployments​
  - Prerequisites​
- Setting up Redis​
- Configuring Open WebUI​
  - Basic Configuration (All Deployments)​
  - Websocket Configuration​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This documentation page outlines the steps required to integrate Redis with Open WebUI for websocket support. By following these steps, you will be able to enable websocket functionality in your Open WebUI instance, allowing for real-time communication and updates between clients and your application.

Redis serves two distinct purposes in Open WebUI, and understanding when it's required is crucial for proper deployment:

If you're running Open WebUI as a single instance with UVICORN_WORKERS=1 (the default), Redis is completely optional and not strictly needed. The application will function normally without it for all operations.

Redis becomes mandatory in the following scenarios:

Multiple Uvicorn Workers (UVICORN_WORKERS > 1)

Multi-Node Deployments

High Availability Setups

Without Redis in multi-worker or multi-instance scenarios, you will experience:

To set up Redis for websocket support, you will need to create a docker-compose.yml file with the following contents:

The ports directive is not included in this configuration, as it is not necessary in most cases. The Redis service will still be accessible from within the Docker network by the Open WebUI service. However, if you need to access the Redis instance from outside the Docker network (e.g., for debugging or monitoring purposes), you can add the ports directive to expose the Redis port (e.g., 6379:6379).

The above configuration sets up a Redis container named redis-valkey and mounts a volume for data persistence. The healthcheck directive ensures that the container is restarted if it fails to respond to the ping command. The --save 30 1 command option saves the Redis database to disk every 30 minutes if at least 1 key has changed.

To create a Docker network for communication between Open WebUI and Redis, run the following command:

To enable Redis support in Open WebUI, you need to configure different environment variables depending on your deployment type.

For all deployments using Redis (single or multi-instance), set the following base environment variable:

This variable configures the primary Redis connection for application state management, session storage, and coordination between instances.

To enable websocket support specifically, add these additional environment variables:

A very common and difficult-to-debug issue with WebSocket connections is a misconfigured Cross-Origin Resource Sharing (CORS) policy. If your Open WebUI instance is accessed from a different domain or port than the backend (e.g., behind a reverse proxy), you must set the CORS_ALLOW_ORIGIN environment variable. This variable tells the server which origins are permitted to access its resources.

Failure to configure this correctly will cause WebSocket connections to fail silently or with cryptic browser errors and forgetting to set this variable is a common cause of WebSocket connection issues.

Example: If you access your UI at https://my-open-webui.com, you must set:

You can also provide a semicolon-separated list of allowed domains. Do not skip this step in a production or reverse-proxied setup.

Redis Database Numbers

Notice the different database numbers (/0 vs /1) in the URLs:

This separation helps isolate different types of data. You can use the same database number for both if preferred, but using separate databases is recommended for better organization and potential performance optimization.

The REDIS_KEY_PREFIX allows multiple Open WebUI instances to share the same Redis instance without key conflicts. In Redis cluster mode, the prefix is formatted as {prefix}: (e.g., {open-webui}:config:*) to enable multi-key operations on configuration keys within the same hash slot.

Redis Sentinel setups require explicit socket connection timeout configuration to ensure proper failover behavior. Without a timeout, the application can hang indefinitely when a Redis master node goes offline—potentially preventing even application restarts.

Symptoms of missing timeout configuration:

Required configuration:

This sets a 5-second timeout for socket connection attempts to Redis/Sentinel nodes, allowing the application to fail over gracefully.

If using WEBSOCKET_REDIS_OPTIONS

When you explicitly set WEBSOCKET_REDIS_OPTIONS, REDIS_SOCKET_CONNECT_TIMEOUT does not automatically apply to websocket connections. You must include the timeout in both places:

Here's a complete example showing all Redis-related environment variables:

For Redis Sentinel deployments specifically, ensure REDIS_SOCKET_CONNECT_TIMEOUT is set to prevent application hangs during master failover.

When running Open WebUI using Docker, connect it to the same Docker network and include all necessary Redis variables:

Important Note on Service Names

In the examples above, we use redis://redis-valkey:6379 because:

Do not use 127.0.0.1 or localhost when connecting from one container to another - these refer to the container's own localhost, not the Redis container.

If you're running multiple Uvicorn workers on a single host, add this variable:

Critical: Redis Required for UVICORN_WORKERS > 1

If you set UVICORN_WORKERS to any value greater than 1, you must configure REDIS_URL. Failing to do so will cause:

First, confirm that your Redis instance is running and accepting connections:

This command should output PONG if the Redis instance is running correctly.

After starting your Open WebUI instance with the proper Redis configuration, check the logs to confirm successful integration:

Look for log messages indicating Redis is being used for application state:

If you have enabled websocket support, you should see this specific log message:

To check this specifically:

You can also verify that Open WebUI is actually writing data to Redis:

If Redis is configured correctly, you should see keys with your configured prefix (e.g., open-webui:session:*, open-webui:config:*).

If you're running with UVICORN_WORKERS > 1, test that sessions persist across workers:

If you're logged out randomly or see authentication errors, Redis is likely not configured correctly.

Cause: REDIS_URL is not configured when using multiple workers

Solution: Add the REDIS_URL environment variable:

Solution: Use different REDIS_KEY_PREFIX values for each installation:

If you continue to experience issues after following this guide:

By following these steps and troubleshooting tips, you should be able to set up Redis with Open WebUI for both application state management and websocket support, enabling reliable multi-instance deployments and real-time communication between clients and your application.

**Examples:**

Example 1 (yml):
```yml
version: '3.9'services:  redis:    image: docker.io/valkey/valkey:8.0.1-alpine    container_name: redis-valkey    volumes:      - redis-data:/data    command: "valkey-server --save 30 1"    healthcheck:      test: "[ $$(valkey-cli ping) = 'PONG' ]"      start_period: 5s      interval: 1s      timeout: 3s      retries: 5    restart: unless-stopped    cap_drop:      - ALL    cap_add:      - SETGID      - SETUID      - DAC_OVERRIDE    logging:      driver: "json-file"      options:        max-size: "1m"        max-file: "1"    networks:      - openwebui-networkvolumes:  redis-data:networks:  openwebui-network:    external: true
```

Example 2 (bash):
```bash
docker network create openwebui-network
```

Example 3 (bash):
```bash
REDIS_URL="redis://redis-valkey:6379/0"
```

Example 4 (bash):
```bash
ENABLE_WEBSOCKET_SUPPORT="true"WEBSOCKET_MANAGER="redis"WEBSOCKET_REDIS_URL="redis://redis-valkey:6379/1"
```

---

## 🪣 Switching to S3 Storage

**URL:** https://docs.openwebui.com/tutorials/maintenance/s3-storage

**Contents:**
- 🪣 Switching to S3 Storage
- Prerequisites​
- What is Amazon S3​
- How to Set-Up
- 1. Required environment variables​
- 2. Run Open-WebUI​
- 3. Test the set-up​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

This guide provides instructions on how to switch the default local storage in Open WebUI config to Amazon S3.

In order to follow this tutorial, you must have the following:

Direct from AWS' website:

"Amazon S3 is an object storage service that offers industry-leading scalability, data availability, security, and performance. Store and protect any amount of data for a range of use cases, such as data lakes, websites, cloud-native applications, backups, archive, machine learning, and analytics. Amazon S3 is designed for 99.999999999% (11 9's) of durability, and stores data for millions of customers all around the world."

To learn more about S3, visit: Amazon S3's Official Page

In order to configure this option, you need to gather the following environment variables:

For a complete list of the available S3 endpoint URLs, see: Amazon S3 Regular Endpoints

See all the Cloud Storage configuration options in the Open-WebUI Cloud Storage Config documentation.

Before we launch our instance of Open-WebUI, there is one final environment variable called STORAGE_PROVIDER we need to set. This variable tells Open-WebUI which provider you want to use. By default, STORAGE_PROVIDER is empty which means Open-WebUI uses local storage.

To use Amazon S3, we need to set STORAGE_PROVIDER to "S3" along with all the environment variables we gathered in Step 1 (S3_ACCESS_KEY_ID, S3_SECRET_ACCESS_KEY, S3_ENDPOINT_URL, S3_REGION_NAME, S3_BUCKET_NAME).

Here, I'm also setting the ENV to "dev", which will allow us to see the Open-WebUI Swagger docs so we can further test and confirm the S3 storage set-up is working as expected.

Now that we have Open-WebUI running, let's upload a simple Hello, World text file and test our set-up.

And confirm that we're getting a response from the selected LLM.

Great! Looks like everything is worked as expected in Open-WebUI. Now let's verify that the text file was indeed uploaded and stored in the specified S3 bucket. Using the AWS Management Console, we can see that there is now a file in the S3 bucket. In addition to the name of the file we uploaded (hello.txt) you can see the object's name was appended with a unique ID. This is how Open-WebUI tracks all the files uploaded.

Using Open-WebUI's swagger docs, we can get all the information related to this file using the /api/v1/files/{id} endpoint and passing in the unique ID (4405fabb-603e-4919-972b-2b39d6ad7f5b).

**Examples:**

Example 1 (sh):
```sh
docker run -d \  -p 3000:8080 \  -v open-webui:/app/backend/data \  -e STORAGE_PROVIDER="s3" \  -e S3_ACCESS_KEY_ID="ABC123" \  -e S3_SECRET_ACCESS_KEY="SuperSecret" \  -e S3_ENDPOINT_URL="https://s3.us-east-1.amazonaws.com" \  -e S3_REGION_NAME="us-east-1" \  -e S3_BUCKET_NAME="my-awesome-bucket-name" \  -e ENV="dev" \  --name open-webui \  ghcr.io/open-webui/open-webui:main
```

---

## 🎓 Tutorials

**URL:** https://docs.openwebui.com/category/-tutorials

**Contents:**
- 🗃️ Tips & Tricks
- 🗃️ Integrations
- 🗃️ Maintenance
- 🗃️ HTTPS
- 📄️ Offline Mode
- 📄️ Deployment & Community Guides

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

The tutorials and videos below are created by the community and are not officially supported by the Open WebUI team. They serve as demonstrations for customizing and deploying Open WebUI for specific use cases.

---
