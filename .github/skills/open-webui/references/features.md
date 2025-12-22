# Open-Webui - Features

**Pages:** 58

---

## Bing

**URL:** https://docs.openwebui.com/features/web-search/bing

**Contents:**
- Bing
- Bing API​
  - Setup​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

Bing Search APIs will be retired on 11th August 2025. New deployments are not supported.

---

## Brave

**URL:** https://docs.openwebui.com/features/web-search/brave

**Contents:**
- Brave
- Brave API​
  - Docker Compose Setup​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

Add the following environment variables to your Open WebUI docker-compose.yaml file:

**Examples:**

Example 1 (yaml):
```yaml
services:  open-webui:    environment:      ENABLE_RAG_WEB_SEARCH: True      RAG_WEB_SEARCH_ENGINE: "brave"      BRAVE_SEARCH_API_KEY: "YOUR_API_KEY"      RAG_WEB_SEARCH_RESULT_COUNT: 3      RAG_WEB_SEARCH_CONCURRENT_REQUESTS: 1
```

---

## Chatterbox TTS — Voice Cloning

**URL:** https://docs.openwebui.com/features/audio/text-to-speech/chatterbox-tts-api-integration

**Contents:**
- Chatterbox TTS — Voice Cloning
- What is Chatterbox TTS API?​
- Key Features​
  - Hardware Recommendations​
- ⚡️ Quick start​
  - 🐍 Using Python​
    - Option A: Using uv (Recommended - Faster & Better Dependencies)​
    - Option B: Using pip (Traditional)​
  - 🐳 Docker (Recommended)​
  - With Docker Compose Profiles​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

Chatterbox TTS API is an API wrapper that allows for voice cloning and text-to-speech, serving as a direct substitute for the OpenAI Speech API endpoint.

Chatterbox can use a good deal of memory and has hardware requirements that might be higher than you're used to with other local TTS solutions. If you have trouble meeting the requirements, you might find OpenAI Edge TTS or Kokoro-FastAPI to be suitable replacements.

💡 Why uv? Users report better compatibility with chatterbox-tts, 25-40% faster installs, and superior dependency resolution. See migration guide →

Ran into issues? Check the troubleshooting section

This project includes an optional React-based web UI. Use Docker Compose profiles to easily opt in or out of the frontend:

For local development, you can run the API and frontend separately:

Note: If you encounter dependency issues, try running npm install --force instead of just npm install.

Click the link provided from Vite to access the web UI.

Build the frontend for production deployment:

Note: If the build fails due to dependency conflicts, try using npm install --force.

You can then access it directly from your local file system at /dist/index.html.

The frontend uses a reverse proxy to route requests, so when running with --profile frontend, the web interface will be available at http://localhost:4321 while the API runs behind the proxy.

We recommend running with the frontend interface so you can upload the audio files for the voices you'd like to use before configuring Open WebUI's settings. If started correctly (see guide above), you can visit http://localhost:4321 to access the frontend.

To use Chatterbox TTS API with Open WebUI, follow these steps:

The default API key is the string none (no API key required)

Chatterbox can be challenging to get running the first time, and you may want to try different install options if you run into issues with a particular one.

For more information on chatterbox-tts-api, you can visit the GitHub repo

**Examples:**

Example 1 (bash):
```bash
# Clone the repositorygit clone https://github.com/travisvn/chatterbox-tts-apicd chatterbox-tts-api# Install uv if you haven't alreadycurl -LsSf https://astral.sh/uv/install.sh | sh# Install dependencies with uv (automatically creates venv)uv sync# Copy and customize environment variablescp .env.example .env# Start the API with FastAPIuv run uvicorn app.main:app --host 0.0.0.0 --port 4123# Or use the main scriptuv run main.py
```

Example 2 (bash):
```bash
# Clone the repositorygit clone https://github.com/travisvn/chatterbox-tts-apicd chatterbox-tts-api# Setup environment — using Python 3.11python -m venv .venvsource .venv/bin/activate# Install dependenciespip install -r requirements.txt# Copy and customize environment variablescp .env.example .env# Add your voice sample (or use the provided one)# cp your-voice.mp3 voice-sample.mp3# Start the API with FastAPIuvicorn app.main:app --host 0.0.0.0 --port 4123# Or use the main scriptpython main.py
```

Example 3 (bash):
```bash
# Clone and start with Docker Composegit clone https://github.com/travisvn/chatterbox-tts-apicd chatterbox-tts-api# Use Docker-optimized environment variablescp .env.example.docker .env  # Docker-specific paths, ready to use# Or: cp .env.example .env    # Local development paths, needs customization# Choose your deployment method:# API Only (default)docker compose -f docker/docker-compose.yml up -d             # Standard (pip-based)docker compose -f docker/docker-compose.uv.yml up -d          # uv-optimized (faster builds)docker compose -f docker/docker-compose.gpu.yml up -d         # Standard + GPUdocker compose -f docker/docker-compose.uv.gpu.yml up -d      # uv + GPU (recommended for GPU users)docker compose -f docker/docker-compose.cpu.yml up -d         # CPU-only# API + Frontend (add --profile frontend to any of the above)docker compose -f docker/docker-compose.yml --profile frontend up -d             # Standard + Frontenddocker compose -f docker/docker-compose.gpu.yml --profile frontend up -d         # GPU + Frontenddocker compose -f docker/docker-compose.uv.gpu.yml --profile frontend up -d      # uv + GPU + Frontend# Watch the logs as it initializes (the first use of TTS takes the longest)docker logs chatterbox-tts-api -f# Test the APIcurl -X POST http://localhost:4123/v1/audio/speech \  -H "Content-Type: application/json" \  -d '{"input": "Hello from Chatterbox TTS!"}' \  --output test.wav
```

Example 4 (bash):
```bash
# API only (default behavior)docker compose -f docker/docker-compose.yml up -d# API + Frontend + Web UI (with --profile frontend)docker compose -f docker/docker-compose.yml --profile frontend up -d# Or use the convenient helper script for fullstack:python start.py fullstack# Same pattern works with all deployment variants:docker compose -f docker/docker-compose.gpu.yml --profile frontend up -d    # GPU + Frontenddocker compose -f docker/docker-compose.uv.yml --profile frontend up -d     # uv + Frontenddocker compose -f docker/docker-compose.cpu.yml --profile frontend up -d    # CPU + Frontend
```

---

## Chat Features Overview

**URL:** https://docs.openwebui.com/features/chat-features/

**Contents:**
- Chat Features Overview
- Core Chat Features​

Open WebUI provides a comprehensive set of chat features designed to enhance your interactions with AI models. This page provides an overview of the key chat capabilities, with links to dedicated pages for more detailed information.

🗂️ Conversation Organization: Organize chats with folders and tags to keep your workspace tidy and structured.

🔗 URL Parameters: Configure chat sessions through URL parameters, enabling quick setup of models, tools, and other features.

⚙️ Chat Parameters: Control system prompts and advanced parameters at different levels (per-chat, per-account, or per-model).

✨ Autocomplete: AI-powered text prediction that helps you write prompts faster using a task model.

🗨️ Chat Sharing: Share conversations locally or via the Open WebUI Community platform with controllable privacy settings.

---

## Chat Parameters

**URL:** https://docs.openwebui.com/features/chat-features/chat-params

**Contents:**
- Chat Parameters
- System Prompt and Advanced Parameters Hierarchy Chart​
  - 1. Per-chat basis:​
  - 2. Per-account basis:​
  - 3. Per-model basis:​
- Optimize System Prompt Settings for Maximum Flexibility​

Within Open WebUI, there are three levels to setting a System Prompt and Advanced Parameters: per-chat basis, per-model basis, and per-account basis. This hierarchical system allows for flexibility while maintaining structured administration and control.

Per-chat basis: Suppose a user wants to set a custom system prompt for a specific conversation. They can do so by accessing the Chat Controls section and modifying the System Prompt field. These changes will only apply to the current chat session.

Per-account basis: Suppose a user wants to set their own system prompt for their account. They can do so by accessing the Settings menu and modifying the System Prompt field.

Per-model basis: Suppose an administrator wants to set a default system prompt for a specific model. They can do so by accessing the Models section and modifying the System Prompt field for the corresponding model. Any chat instances using this model will automatically use the model's system prompt and advanced parameters.

Bonus Tips This tip applies for both administrators and user accounts. To achieve maximum flexibility with your system prompts, we recommend considering the following setup:

Assign your primary System Prompt (i.e., to give an LLM a defining character) you want to use in your General settings System Prompt field. This sets it on a per-account level and allows it to work as the system prompt across all your LLMs without requiring adjustments within a model from the Workspace section.

For your secondary System Prompt (i.e, to give an LLM a task to perform), choose whether to place it in the System Prompt field within the Chat Controls sidebar (on a per-chat basis) or the Models section of the Workspace section (on a per-model basis) for Admins, allowing you to set them directly. This allows your account-level system prompt to work in conjunction with either the per-chat level system prompt provided by Chat Controls, or the per-model level system prompt provided by Models.

As an administrator, you should assign your LLM parameters on a per-model basis using Models section for optimal flexibility. For both of these secondary System Prompts, ensure to set them in a manner that maximizes flexibility and minimizes required adjustments across different per-account or per-chat instances. It is essential for both your Admin account as well as all User accounts to understand the priority order by which system prompts within Chat Controls and the Models section will be applied to the LLM.

---

## Chat Sharing

**URL:** https://docs.openwebui.com/features/chat-features/chatshare

**Contents:**
- Chat Sharing
  - Enabling Community Sharing​
  - Sharing Chats​
    - Sharing to Open WebUI Community​
    - Copying a Share Link​
  - Viewing Shared Chats​
  - Updating Shared Chats​
  - Deleting Shared Chats​

To enable community sharing, follow these steps:

Note: Only Admins can toggle the Enable Community Sharing option. If this option is toggled off, users and Admins will not see the Share to Open WebUI Community option for sharing their chats. Community sharing must be enabled by an Admin for users to share chats to the Open WebUI community.

This will enable community sharing for all users on your Open WebUI instance.

When you select Share to Open WebUI Community:

Note: You can change the permission level of your shared chats on the community platform at any time from your openwebui.com account.

Currently, shared chats on the community website cannot be found through search. However, future updates are planned to allow public chats to be discoverable by the public if their permission is set to Public or Public, Full History.

Example of a shared chat to the community platform website: https://openwebui.com/c/iamg30/5e3c569f-905e-4d68-a96d-8a99cc65c90f

When you select Copy Link, a unique share link is generated that can be shared with others.

Important Considerations:

To view a shared chat:

To update a shared chat:

The Share Chat Modal includes the following options:

To delete a shared chat link:

Once deleted, the shared link will no longer be valid, and users will not be able to view the shared chat.

Note: Chats shared to the community platform cannot be deleted. To change the access level of a chat shared to the community platform:

---

## Configuration

**URL:** https://docs.openwebui.com/features/audio/speech-to-text/stt-config

**Contents:**
- Configuration
- Cloud / Remote Speech To Text Proivders​
- Configuring Your STT Provider​
- User-Level Settings​
- Using STT​
- STT Mode Operation​

Open Web UI supports both local, browser, and remote speech to text.

The following cloud speech to text providers are currently supported. API keys can be configured as environment variables (OpenAI) or in the admin settings page (both keys).

WebAPI provides STT via the built-in browser STT provider.

To configure a speech to text provider:

In addition the instance settings provisioned in the admin panel, there are also a couple of user-level settings that can provide additional functionality.

Speech to text provides a highly efficient way of "writing" prompts using your voice and it performs robustly from both desktop and mobile devices.

To use STT, simply click on the microphone icon:

A live audio waveform will indicate successful voice capture:

Once your recording has begun you can:

---

## DDGS

**URL:** https://docs.openwebui.com/features/web-search/ddgs

**Contents:**
- DDGS
- DDGS (Dux Distributed Global Search - previously DuckDuckGo)​
  - Setup​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

DDGS (Dux Distributed Global Search) was previously DuckDuckGo. It is now a metasearch engine. This part of the docs needs an update.

Know how to set it up? Submit a PR on GitHub to edit this page!

---

## Development

**URL:** https://docs.openwebui.com/features/plugin/tools/development

**Contents:**
- Development
- Writing A Custom Toolkit​
  - Example Top-Level Docstring​
  - Tools Class​
  - Type Hints​
  - Valves and UserValves - (optional, but HIGHLY encouraged)​
  - Optional Arguments​
    - Using the OAuth Token in a Tool​
  - Event Emitters​
    - Function Calling Mode Configuration​

Toolkits are defined in a single Python file, with a top level docstring with metadata and a Tools class.

Tools have to be defined as methods within a class called Tools, with optional subclasses called Valves and UserValves, for example:

Each tool must have type hints for arguments. The types may also be nested, such as queries_and_docs: list[tuple[str, int]]. Those type hints are used to generate the JSON schema that is sent to the model. Tools without type hints will work with a lot less consistency.

Valves and UserValves are used for specifying customizable settings of the Tool, you can read more on the dedicated Valves & UserValves page.

Below is a list of optional arguments your tools can depend on:

For more information about __oauth_token__ and how to configure this token to be sent to tools, check out the OAuth section in the environment variable docs page and the SSO documentation.

Just add them as argument to any method of your Tool class just like __user__ in the example above.

When building tools that need to interact with external APIs on the user's behalf, you can now directly access their OAuth token. This removes the need for fragile cookie scraping and ensures the token is always valid.

Example: A tool that calls an external API using the user's access token.

Event Emitters are used to add additional information to the chat interface. Similarly to Filter Outlets, Event Emitters are capable of appending content to the chat. Unlike Filter Outlets, they are not capable of stripping information. Additionally, emitters can be activated at any stage during the Tool.

⚠️ CRITICAL: Function Calling Mode Compatibility

Event Emitter behavior is significantly different depending on your function calling mode. The function calling mode is controlled by the function_calling parameter:

Before using event emitters, you must understand these critical limitations:

When to Use Each Mode:

You can configure the function calling mode in two places:

If the model seems to be unable to call the tool, make sure it is enabled (either via the Model page or via the + sign next to the chat input field).

Here's the comprehensive breakdown of how each event type behaves across function calling modes:

In Native Mode, the server constructs content blocks from streaming model output and repeatedly emits "chat:completion" events with full serialized content snapshots. The client treats these snapshots as authoritative and completely replaces message content, effectively overwriting any prior tool-emitted updates like message, chat:message, or replace events.

For Tools Requiring Real-time UI Updates:

For Tools That Must Work in Both Modes:

Symptoms of Native Mode Conflicts:

Debugging Your Event Emitters:

There are several specific event types with different behaviors:

Status events work identically in both Default and Native function calling modes. This is the most reliable event type for providing real-time feedback during tool execution.

Status events add live status updates to a message while it's performing steps. These can be emitted at any stage during tool execution. Status messages appear right above the message content and are essential for tools that delay the LLM response or process large amounts of information.

Basic Status Event Structure:

Status Event Parameters:

🚨 CRITICAL WARNING: Message events are INCOMPATIBLE with Native function calling mode!

Message events (message, chat:message, chat:message:delta, replace) allow you to append or modify message content at any stage during tool execution. This enables embedding images, rendering web pages, streaming content updates, and creating rich interactive experiences.

However, these event types have major compatibility issues:

Why Message Events Break in Native Mode: Native function calling emits repeated chat:completion events with full content snapshots that completely replace message content, causing any tool-emitted message updates to flicker and disappear.

Safe Message Event Structure (Default Mode Only):

Citation events work identically in both Default and Native function calling modes. This event type provides source references and citations in the chat interface, allowing users to click and view source materials.

Citations are essential for tools that retrieve information from external sources, databases, or documents. They provide transparency and allow users to verify information sources.

Citation Event Structure:

Important Citation Setup: When implementing custom citations, you must disable automatic citations in your Tools class:

⚠️ Critical Citation Warning: If you set self.citation = True (or don't set it to False), automatic citations will replace any custom citations you send. Always disable automatic citations when using custom citation events.

The following event types work identically in both Default and Native function calling modes:

Code Execution Events

Choosing the right function calling mode is crucial for your tool's functionality. This guide helps you make an informed decision based on your specific requirements.

Mode Comparison Overview:

Do you need real-time content streaming, live updates, or dynamic message modification?

Is your tool primarily for simple data retrieval or computation?

Do you need maximum performance and minimal latency?

Are you building interactive experiences, dashboards, or multi-step workflows?

Recommended Usage Patterns:

Choose Default Mode For:

Choose Native Mode For:

Universal Compatibility Pattern:

Common Issues and Solutions:

Issue: Content appears then disappears

Issue: Tool seems unresponsive

Issue: Events not firing at all

Issue: Citations being overwritten

Always Compatible (Both Modes):

Default Mode Only (Broken in Native):

Mode Detection Pattern:

Both External and Built-In Tools now support rich UI element embedding, allowing tools to return HTML content and interactive iframes that display directly within chat conversations. This feature enables tools to provide sophisticated visual interfaces, interactive widgets, charts, dashboards, and other rich web content.

When a tool returns an HTMLResponse with the appropriate headers, the content will be embedded as an interactive iframe in the chat interface rather than displayed as plain text.

To embed HTML content, your tool should return an HTMLResponse with the Content-Disposition: inline header:

The embedded iframes support auto-resizing and include configurable security settings. The system automatically handles:

When embedding external content, several security options can be configured through the UI settings:

Rich UI embedding is perfect for:

For external tools served via HTTP endpoints:

The embedded content automatically inherits responsive design and integrates seamlessly with the chat interface, providing a native-feeling experience for users interacting with your tools.

Direct external tools are tools that run directly from the browser. In this case, the tool is called by JavaScript in the user's browser. Because we depend on the Content-Disposition header, when using CORS on a remote tool server, the Open WebUI cannot read that header due to Access-Control-Expose-Headers, which prevents certain headers from being read from the fetch result. To prevent this, you must set Access-Control-Expose-Headers to Content-Disposition. Check the example below of a tool using Node.js:

More info about the header: https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Expose-Headers

In the Tools definition metadata you can specify custom packages. When you click Save the line will be parsed and pip install will be run on all requirements at once.

🚨 CRITICAL WARNING: Potential for Package Version Conflicts

When multiple tools define different versions of the same package (e.g., Tool A requires pandas==1.5.0 and Tool B requires pandas==2.0.0), Open WebUI installs them in a non-deterministic order. This can lead to unpredictable behavior and break one or more of your tools.

The only robust solution to this problem is to use an OpenAPI tool server.

We strongly recommend using an OpenAPI tool server to avoid these dependency conflicts.

Keep in mind that as pip is used in the same process as Open WebUI, the UI will be completely unresponsive during the installation.

No measures are taken to handle package conflicts with Open WebUI's requirements. That means that specifying requirements can break Open WebUI if you're not careful. You might be able to work around this by specifying open-webui itself as a requirement.

**Examples:**

Example 1 (python):
```python
"""title: String Inverseauthor: Your Nameauthor_url: https://website.comgit_url: https://github.com/username/string-reverse.gitdescription: This tool calculates the inverse of a stringrequired_open_webui_version: 0.4.0requirements: langchain-openai, langgraph, ollama, langchain_ollamaversion: 0.4.0licence: MIT"""
```

Example 2 (python):
```python
class Tools:    def __init__(self):        """Initialize the Tool."""        self.valves = self.Valves()    class Valves(BaseModel):        api_key: str = Field("", description="Your API key here")    def reverse_string(self, string: str) -> str:        """        Reverses the input string.        :param string: The string to reverse        """        # example usage of valves        if self.valves.api_key != "42":            return "Wrong API key"        return string[::-1]
```

Example 3 (python):
```python
import httpxfrom typing import Optionalclass Tools:    # ... other class setup ...    async def get_user_profile_from_external_api(self, __oauth_token__: Optional[dict] = None) -> str:        """        Fetches user profile data from a secure external API using their OAuth access token.        :param __oauth_token__: Injected by Open WebUI, contains the user's token data.        """        if not __oauth_token__ or "access_token" not in __oauth_token__:            return "Error: User is not authenticated via OAuth or token is unavailable."        access_token = __oauth_token__["access_token"]        headers = {            "Authorization": f"Bearer {access_token}",            "Content-Type": "application/json"        }        try:            async with httpx.AsyncClient() as client:                response = await client.get("https://api.my-service.com/v1/profile", headers=headers)                response.raise_for_status() # Raise an exception for bad status codes                return f"API Response: {response.json()}"        except httpx.HTTPStatusError as e:            return f"Error: Failed to fetch data from API. Status: {e.response.status_code}"        except Exception as e:            return f"An unexpected error occurred: {e}"
```

Example 4 (python):
```python
class Tools:    def __init__(self):        # Add a note about function calling mode requirements        self.description = "This tool requires Default function calling mode for full functionality"    async def interactive_tool(self, prompt: str, __event_emitter__=None) -> str:        """        ⚠️ This tool requires function_calling = "default" for proper event emission        """        if not __event_emitter__:            return "Event emitter not available - ensure Default function calling mode is enabled"        # Safe to use message events in Default mode        await __event_emitter__({            "type": "message",            "data": {"content": "Processing step 1..."}        })        # ... rest of tool logic
```

---

## Environment Variables

**URL:** https://docs.openwebui.com/features/audio/speech-to-text/env-variables

**Contents:**
- Environment Variables
- Environment Variables List​
- Environment Variables For Speech To Text (STT)

For a complete list of all Open WebUI environment variables, see the Environment Variable Configuration page.

The following is a summary of the environment variables for speech to text (STT).

---

## Exa AI Web Search Integration

**URL:** https://docs.openwebui.com/features/web-search/exa

**Contents:**
- Exa AI Web Search Integration
- Overview​
- Pricing Model​
- Configuration Steps​
  - 1. Obtain an Exa AI API Key​
  - 2. Configure Open WebUI​
  - 3. (Optional) Environment Variable Configuration​
- Verify the Integration​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

This guide provides instructions on how to integrate Exa AI, a modern AI-powered search engine, with Open WebUI for web search capabilities.

Exa AI is a search engine designed for AI applications, providing a suite of tools through its API, including web search, website crawling, and deep research functionalities. By integrating Exa AI with Open WebUI, you can leverage its powerful search capabilities directly within your chat interface.

Exa AI operates on a credit-based, pay-as-you-go pricing model. It is not a permanently free service, but it offers a trial for new users to evaluate the API.

For detailed and up-to-date pricing information, please visit the Exa AI pricing page.

First, you need to sign up for an Exa AI account and get an API key.

Next, you need to configure the Exa AI integration in the Open WebUI admin settings.

Alternatively, you can configure the Exa AI integration using an environment variable. This is particularly useful for Docker-based deployments.

Set the following environment variable for your Open WebUI instance:

When this environment variable is set, the "Exa API Key" field in the admin settings will be automatically populated.

Example Docker run command:

Once you have configured the API key, you can test the integration by enabling the web search feature in a chat and asking a question that requires up-to-date information from the web. If the integration is successful, Open WebUI will use Exa AI to fetch search results and provide an informed response.

**Examples:**

Example 1 (bash):
```bash
docker run -d \\  -p 3000:8080 \\  -e EXA_API_KEY="your-exa-api-key-here" \\  --name open-webui \\  ghcr.io/open-webui/open-webui:main
```

---

## External

**URL:** https://docs.openwebui.com/features/web-search/external

**Contents:**
- External
- External Web Search API​
  - Open WebUI Setup​
  - API Specification​
  - Example Implementation (Python/FastAPI)​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

This option allows you to connect Open WebUI to your own self-hosted web search API endpoint. This is useful if you want to:

Open WebUI will interact with your External Search URL as follows:

Expected Response Body (JSON): Your API endpoint must return a JSON array of search result objects. Each object should have the following structure:

link (string): The direct URL to the search result.

title (string): The title of the web page.

snippet (string): A descriptive text snippet from the page content relevant to the query.

If an error occurs or no results are found, your endpoint should ideally return an empty JSON array [].

Here is a simple example of a self-hosted search API using Python with FastAPI and the duckduckgo-search library.

**Examples:**

Example 1 (json):
```json
{  "query": "The user's search query string",  "count": 5 // The maximum number of search results requested}
```

Example 2 (json):
```json
[  {    "link": "URL of the search result",    "title": "Title of the search result page",    "snippet": "A brief description or snippet from the search result page"  },  {    "link": "...",    "title": "...",    "snippet": "..."  }  // ... potentially more results up to the requested count]
```

Example 3 (python):
```python
import uvicornfrom fastapi import FastAPI, Header, Body, HTTPExceptionfrom pydantic import BaseModelfrom duckduckgo_search import DDGSEXPECTED_BEARER_TOKEN = "your_secret_token_here"app = FastAPI()class SearchRequest(BaseModel):    query: str    count: intclass SearchResult(BaseModel):    link: str    title: str | None    snippet: str | None@app.post("/search")async def external_search(    search_request: SearchRequest = Body(...),    authorization: str | None = Header(None),):    expected_auth_header = f"Bearer {EXPECTED_BEARER_TOKEN}"    if authorization != expected_auth_header:        raise HTTPException(status_code=401, detail="Unauthorized")    query, count = search_request.query, search_request.count    results = []    try:        with DDGS() as ddgs:            search_results = ddgs.text(                query, safesearch="moderate", max_results=count, backend="lite"            )        results = [            SearchResult(                link=result["href"],                title=result.get("title"),                snippet=result.get("body"),            )            for result in search_results        ]    except Exception as e:        print(f"Error during DuckDuckGo search: {e}")    return resultsif __name__ == "__main__":    uvicorn.run("main:app", host="0.0.0.0", port=8888)
```

---

## Google PSE

**URL:** https://docs.openwebui.com/features/web-search/google-pse

**Contents:**
- Google PSE
- Google PSE API​
  - Setup​
    - Note​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

You have to enable Web search in the prompt field, using plus (+) button. Search the web ;-)

---

## Groups

**URL:** https://docs.openwebui.com/features/rbac/groups

**Contents:**
- Groups
- Group Management​
  - Group Configuration​
  - Creation Methods​
  - Group Structure​
- Assigning Permissions to Groups​
- Resource Access (RBAC)​
  - Access Control Object​

Groups in Open WebUI are a powerful mechanism for organizing users and managing access control at scale. They serve two primary purposes:

Open WebUI permissions are additive (Union-based).

Groups can be managed in the Admin Panel > Groups section.

When creating or editing a group, you can configure its visibility in the system:

To maintain a clean and manageable system, consider separating your groups into two distinct categories using a naming scheme:

Permission Groups (e.g., prefix [Perms], Role-, or P-)

Sharing Groups (e.g., prefix Team-, Project-, or normal names)

A group definition typically includes:

When editing a group, you can toggle specific permissions.

You can restrict access to specific objects (like a proprietary Model or sensitive Knowledge Base) using Groups.

At a deeper level, resources store an access control list (ACL) looking like this:

**Examples:**

Example 1 (json):
```json
{  "read": {    "group_ids": ["marketing-team-id", "admins-id"],    "user_ids": []  },  "write": {    "group_ids": ["admins-id"],    "user_ids": ["editor-user-id"]  }}
```

---

## Integrating openai-edge-tts 🗣️ with Open WebUI

**URL:** https://docs.openwebui.com/features/audio/text-to-speech/openai-edge-tts-integration

**Contents:**
- Integrating openai-edge-tts 🗣️ with Open WebUI
- What is openai-edge-tts?​
- Requirements​
- ⚡️ Quick start​
- Setting up Open WebUI to use openai-edge-tts​
- Please ⭐️ star the repo on GitHub if you find OpenAI Edge TTS useful​
  - 🐍 Running with Python​
    - 1. Clone the Repository​
    - 2. Set Up a Virtual Environment​
    - 3. Install Dependencies​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

OpenAI Edge TTS is a text-to-speech API that mimics the OpenAI API endpoint, allowing for a direct substitute in scenarios where you can define the endpoint URL, like with Open WebUI.

It uses the edge-tts package, which leverages the Edge browser's free "Read Aloud" feature to emulate a request to Microsoft / Azure in order to receive very high quality text-to-speech for free.

Similar to openedai-speech, openai-edge-tts is a text-to-speech API endpoint that mimics the OpenAI API endpoint, allowing for a direct substitute in scenarios where the OpenAI Speech endpoint is callable and the server endpoint URL can be configured.

openedai-speech is a more comprehensive option that allows for entirely offline generation of speech with many modalities to choose from.

openai-edge-tts is a simpler option that uses a Python package called edge-tts to generate the audio.

The simplest way to get started without having to configure anything is to run the command below

This will run the service at port 5050 with all the default configs

The default API key is the string your_api_key_here. You do not have to change that value if you do not need the added security.

And that's it! You can end here

If you prefer to run this project directly with Python, follow these steps to set up a virtual environment, install dependencies, and start the server.

Create and activate a virtual environment to isolate dependencies:

Use pip to install the required packages listed in requirements.txt:

Create a .env file in the root directory and set the following variables:

Once configured, start the server with:

The server will start running at http://localhost:5050.

You can now interact with the API at http://localhost:5050/v1/audio/speech and other available endpoints. See the Usage section for request examples.

Generates audio from the input text. Available parameters:

You can browse available voices and listen to sample previews at tts.travisvn.com

Example request with curl and saving the output to an mp3 file:

Or, to be in line with the OpenAI API endpoint parameters:

And an example of a language other than English:

The /v1 is now optional.

Additionally, there are endpoints for Azure AI Speech and ElevenLabs for potential future support if custom API endpoints are allowed for these options in Open WebUI.

These can be disabled by setting the environment variable EXPAND_API=False.

You can configure the environment variables in the command used to run the project

The markdown text is now put through a filter for enhanced readability and support.

You can disable this by setting the environment variable REMOVE_FILTER=True.

For more information on openai-edge-tts, you can visit the GitHub repo

For direct support, you can visit the Voice AI & TTS Discord

Play voice samples and see all available Edge TTS voices

**Examples:**

Example 1 (bash):
```bash
docker run -d -p 5050:5050 travisvn/openai-edge-tts:latest
```

Example 2 (bash):
```bash
git clone https://github.com/travisvn/openai-edge-tts.gitcd openai-edge-tts
```

Example 3 (bash):
```bash
# For macOS/Linuxpython3 -m venv venvsource venv/bin/activate# For Windowspython -m venv venvvenv\Scripts\activate
```

Example 4 (bash):
```bash
pip install -r requirements.txt
```

---

## Jina Web Search Integration

**URL:** https://docs.openwebui.com/features/web-search/jina

**Contents:**
- Jina Web Search Integration
- Overview​
- Pricing and API Key​
- Configuration Steps​
  - 1. Obtain a Jina API Key​
  - 2. Configure Open WebUI​
  - 3. Environment Variable Configuration​
- Advanced Configuration (Jina API)​
  - Quality Control​
  - Source Control​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

This guide provides instructions on how to integrate Jina AI, a powerful AI-driven search foundation, with Open WebUI. The integration uses Jina's DeepSearch API to provide web search capabilities.

Jina AI's DeepSearch is more than a simple search API; it's an autonomous agent that combines web searching, reading, and reasoning to conduct comprehensive investigations. Unlike standard LLMs that rely on pre-trained knowledge or RAG systems that perform a single-pass search, DeepSearch iteratively searches, reads, and reasons, dynamically deciding its next steps based on its findings. It can perform deep dives into topics through multiple search and reasoning cycles and self-evaluates the quality of its answers before returning a result.

The Jina DeepSearch API is fully compatible with the OpenAI Chat API schema. This means you can use it with any OpenAI-compatible client by simply swapping the API endpoint to https://deepsearch.jina.ai/v1/chat/completions and using jina-deepsearch-v1 as the model name.

Jina's DeepSearch API requires an API key for use with Open WebUI. Jina offers a free tier for new users, which includes 10 million tokens to use with any of their models. You can obtain your free API key by creating an account on the Jina AI platform.

Follow these steps to get an API key:

To enable the Jina web search integration, follow these steps in the Open WebUI admin settings:

For Docker-based deployments, you can configure the Jina integration using an environment variable.

Set the following environment variable for your Open WebUI instance:

Example Docker run command:

While Open WebUI provides a straightforward integration, the Jina DeepSearch API itself offers a rich set of parameters for fine-tuning its behavior. These parameters are part of the Jina API and are not directly exposed in the Open WebUI settings, but they are useful to understand for advanced use cases.

You can control the trade-off between the quality of the results and token consumption using the following parameters:

You can control where DeepSearch gets its information from:

For more details on these parameters, refer to the official Jina DeepSearch documentation.

After configuring the settings, you can test the integration. Enable the web search feature in a chat and ask a question. Open WebUI will now use Jina's DeepSearch to retrieve and process web content to answer your query.

**Examples:**

Example 1 (bash):
```bash
docker run -d \\  -p 3000:8080 \\  -e JINA_API_KEY="your-jina-api-key-here" \\  --name open-webui \\  ghcr.io/open-webui/open-webui:main
```

---

## Kagi

**URL:** https://docs.openwebui.com/features/web-search/kagi

**Contents:**
- Kagi

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

---

## Knowledge

**URL:** https://docs.openwebui.com/features/workspace/knowledge

**Contents:**
- Knowledge
- TL;DR​
- What is the "Knowledge" Section?​
  - Why is Knowledge Useful?​
  - How to Use Knowledge in Chats​
  - Setting Up Your Knowledge Base​
- Summary​

Knowledge part of Open WebUI is like a memory bank that makes your interactions even more powerful and context-aware. Let's break down what "Knowledge" really means in Open WebUI, how it works, and why it’s incredibly helpful for enhancing your experience.

Setting up Knowledge is straightforward! Simply head to the Knowledge section inside work space and start adding details or data. You don’t need coding expertise or technical setup; it’s built into the core system!

The Knowledge section is a storage area within Open WebUI where you can save specific pieces of information or data points. Think of it as a reference library that Open WebUI can use to make its responses more accurate and relevant to your needs.

Imagine you're working on a long-term project and want the system to remember certain parameters, settings, or even key notes about the project without having to remind it every time. Or perhaps, you want it to remember specific personal preferences for chats and responses. The Knowledge section is where you can store this kind of persistent information so that Open WebUI can reference it in future conversations, creating a more coherent, personalized experience.

Some examples of what you might store in Knowledge:

Accessing stored Knowledge in your chats is easy! By simply referencing what’s saved (using '#' before the name), Open WebUI can pull in data or follow specific guidelines that you’ve set up in the Knowledge section.

To reference Knowledge in your chats, just ensure it’s saved in the Knowledge section, and Open WebUI will know when and where to bring in the relevant information!

Admins can add knowledge to the workspace, which users can access and use; however, users do not have direct access to the workspace itself.

🌟 Remember, there’s always more to discover, so dive in and make Open WebUI truly your own!

---

## Kokoro-FastAPI Using Docker

**URL:** https://docs.openwebui.com/features/audio/text-to-speech/Kokoro-FastAPI-integration

**Contents:**
- Kokoro-FastAPI Using Docker
- What is Kokoro-FastAPI?​
- Key Features​
- Voices​
- Languages​
- Requirements​
- ⚡️ Quick start​
  - You can choose between GPU or CPU versions​
  - GPU Version (Requires NVIDIA GPU with CUDA 12.8)​
  - CPU Version (ONNX optimized inference)​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

Kokoro-FastAPI is a dockerized FastAPI wrapper for the Kokoro-82M text-to-speech model that implements the OpenAI API endpoint specification. It offers high-performance text-to-speech with impressive generation speeds.

Or docker compose, by creating a docker-compose.yml file and running docker compose up. For example:

You may need to install and configure the NVIDIA Container Toolkit

To use Kokoro-FastAPI with Open WebUI, follow these steps:

The default API key is the string not-needed. You do not have to change that value if you do not need the added security.

For more information on building the Docker container, including changing ports, please refer to the Kokoro-FastAPI repository

**Examples:**

Example 1 (bash):
```bash
docker run --gpus all -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-gpu
```

Example 2 (yaml):
```yaml
name: kokoroservices:    kokoro-fastapi-gpu:        ports:            - 8880:8880        image: ghcr.io/remsky/kokoro-fastapi-gpu:v0.2.1        restart: always        deploy:            resources:                reservations:                    devices:                        - driver: nvidia                          count: all                          capabilities:                              - gpu
```

Example 3 (bash):
```bash
docker run -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-cpu
```

Example 4 (yaml):
```yaml
name: kokoroservices:    kokoro-fastapi-cpu:        ports:            - 8880:8880        image: ghcr.io/remsky/kokoro-fastapi-cpu        restart: always
```

---

## Kokoro Web - Effortless TTS for Open WebUI

**URL:** https://docs.openwebui.com/features/audio/text-to-speech/kokoro-web-integration

**Contents:**
- Kokoro Web - Effortless TTS for Open WebUI
- What is Kokoro Web?​
- 🚀 Two-Step Integration​
  - 1. Deploy Kokoro Web API (One Command)​
  - 2. Connect OpenWebUI (30 Seconds)​
- 🌍 Supported Languages​
- 💾 Optimized Models for Any Hardware​
- ✨ Try Before You Install​
- Need More Help?​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

Kokoro Web provides a lightweight, OpenAI-compatible API for the powerful Kokoro-82M text-to-speech model, seamlessly integrating with Open WebUI to enhance your AI conversations with natural-sounding voices.

Run with: docker compose up -d

That's it! Your OpenWebUI now has AI voice capabilities.

Kokoro Web supports 8 languages with specific voices optimized for each:

Each language has dedicated voices for optimal pronunciation and natural flow. See the GitHub repository for the complete list of language-specific voices or use the Kokoro Web Demo to preview and create your own custom voices instantly.

Choose the model that fits your hardware needs:

Visit the Kokoro Web Demo to preview all voices instantly. This demo:

For additional options, voice customization guides, and advanced settings, visit the GitHub repository.

Enjoy natural AI voices in your OpenWebUI conversations!

**Examples:**

Example 1 (yaml):
```yaml
services:  kokoro-web:    image: ghcr.io/eduardolat/kokoro-web:latest    ports:      - "3000:3000"    environment:      # Change this to any secret key to use as your OpenAI compatible API key      - KW_SECRET_API_KEY=your-api-key    volumes:      - ./kokoro-cache:/kokoro/cache    restart: unless-stopped
```

---

## MCP Support

**URL:** https://docs.openwebui.com/features/plugin/tools/openapi-servers/mcp

**Contents:**
- MCP Support
  - 📌 What is the MCP Proxy Server?​
  - 💡 Why Use mcpo?​
  - ✅ Quickstart: Running the Proxy Locally​
  - 🚀 Accessing the Generated APIs​
  - 📖 Example Workflow for End-Users​
- 🚀 Deploying in Production (Example)​
  - 🐳 Dockerize your Proxy Server using mcpo​
- 🧑‍💻 Technical Details and Background​
  - 🍃 How It Works (Technical Summary)​

This documentation explains how to easily set up and deploy the MCP (Model Context Protocol)-to-OpenAPI proxy server (mcpo) provided by Open WebUI. Learn how you can effortlessly expose MCP-based tool servers using standard, familiar OpenAPI endpoints suitable for end-users and developers.

If you connect Open WebUI to this proxy using an API Key or Auth Token, you MUST set WEBUI_SECRET_KEY in your Open WebUI Docker config. If this key changes (e.g., on container restart), Open WebUI will fail to decrypt the stored credentials for your tool.

The MCP-to-OpenAPI proxy server lets you use tool servers implemented with MCP (Model Context Protocol) directly via standard REST/OpenAPI APIs—no need to manage unfamiliar or complicated custom protocols. If you're an end-user or application developer, this means you can interact easily with powerful MCP-based tooling directly through familiar REST-like endpoints.

While MCP tool servers are powerful and flexible, they commonly communicate via standard input/output (stdio)—often running on your local machine where they can easily access your filesystem, environment, and other native system capabilities.

That’s a strength—but also a limitation.

If you want to deploy your main interface (like Open WebUI) on the cloud, you quickly run into a problem: your cloud instance can’t speak directly to an MCP server running locally on your machine via stdio.

That’s where mcpo comes in with a game-changing solution.

MCP servers typically rely on raw stdio communication, which is:

The mcpo proxy eliminates those issues—automatically:

So even though adding mcpo might at first seem like "just one more layer"—in reality, it simplifies everything while giving you:

✨ With mcpo, your local-only AI tools become cloud-ready, UI-friendly, and instantly interoperable—without changing a single line of tool server code.

Here's how simple it is to launch the MCP-to-OpenAPI proxy server using the lightweight, easy-to-use tool mcpo (GitHub Repository):

Using uv (recommended):

To start your MCP-to-OpenAPI proxy server, you need an MCP-compatible tool server. If you don't have one yet, the MCP community provides various ready-to-use MCP server implementations.

✨ Where to find MCP Servers?

You can discover officially supported MCP servers at the following repository example:

For instance, the popular Time MCP Server is documented here, and is typically referenced clearly in the README, inside the provided MCP configuration. Specifically, the README states:

Add to your Claude settings:

🔑 Translating this MCP setup to a quick local proxy command:

You can easily run the recommended MCP server (mcp-server-time) directly through the MCP-to-OpenAPI proxy (mcpo) like this:

That's it! You're now running the MCP-to-OpenAPI Proxy locally and exposing the powerful MCP Time Server through standard OpenAPI endpoints accessible at:

Feel free to replace uvx mcp-server-time --local-timezone=America/New_York with your preferred MCP Server command from other available MCP implementations found in the official repository.

🤝 To integrate with Open WebUI after launching the server, check our docs.

As soon as it starts, the MCP Proxy (mcpo) automatically:

Simply call the auto-generated API endpoints directly via HTTP clients, AI agents, or other OpenAPI tools of your preference.

Assuming you started the above server command (uvx mcp-server-time):

No setup complexity—just instant REST APIs.

Deploying your MCP-to-OpenAPI proxy (powered by mcpo) is straightforward. Here's how to easily Dockerize and deploy it to cloud or VPS solutions:

Create the following Dockerfile inside your deployment directory:

Push to DockerHub or another registry:

Deploy using Docker Compose, Kubernetes YAML manifests, or your favorite cloud container services (AWS ECS, Azure Container Instances, Render.com, or Heroku).

✔️ Your production MCP servers are now effortlessly available via REST APIs!

Dynamic Schema Discovery & Endpoints: At server startup, the proxy connects to the MCP server to query available tools. It automatically builds FastAPI endpoints based on the MCP tool schemas, creating concise and clear REST endpoints.

OpenAPI Auto-documentation: Endpoints generated are seamlessly documented and available via FastAPI's built-in Swagger UI (/docs). No extra doc writing required.

Asynchronous & Performant: Built on robust asynchronous libraries, ensuring speed and reliability for concurrent users.

Here's why leveraging MCP servers through OpenAPI via the proxy approach is significantly better and why Open WebUI enthusiastically supports it:

🌟 Bottom line: MCP-to-OpenAPI makes your powerful MCP-based AI tools broadly accessible through intuitive, reliable, and scalable REST endpoints. Open WebUI proudly supports and recommends this best-in-class approach.

Happy integrations! 🌟🚀

**Examples:**

Example 1 (bash):
```bash
uvx mcpo --port 8000 -- your_mcp_server_command
```

Example 2 (bash):
```bash
pip install mcpomcpo --port 8000 -- your_mcp_server_command
```

Example 3 (json):
```json
"mcpServers": {  "time": {    "command": "uvx",    "args": ["mcp-server-time", "--local-timezone=America/New_York"]  }}
```

Example 4 (bash):
```bash
uvx mcpo --port 8000 -- uvx mcp-server-time --local-timezone=America/New_York
```

---

## Models

**URL:** https://docs.openwebui.com/features/workspace/models

**Contents:**
- Models
- Creating and Editing Models​
  - Core Configuration​
  - System Prompt & Dynamic Variables​
  - Advanced Parameters​
  - Prompt Suggestions​
  - Capabilities, Binding & Defaults​
- Model Management​
  - Import and Export​
- Model Switching in Chat​

The Models section of the Workspace within Open WebUI is a powerful tool that allows you to create and manage custom models tailored to specific purposes.

While backends like Ollama have their own Modelfile format, Open WebUI employs a robust internal Preset System. This allows you to "wrap" any model (including GPT-4, Claude, or local Llama 3) to bind specific System Prompts, Knowledge Collections, Tools, and Dynamic Variables to it.

This section serves as a central hub for all your models, providing a range of features to edit, clone, share, export, and hide your custom agents.

When you create a new model or edit an existing one, you are building a configuration wrapper around a "Base Model". To access the model configuration interface, you have two primary entry points from the main Models list:

Both actions lead to the same Model Builder interface, where you can configure the settings below.

The System Prompt defines the behavior and persona of the model. Unlike standard prompts, Open WebUI supports Dynamic Variable Injection using Jinja2-style placeholders. This allows the model to be aware of time, date, and user details.

Example System Prompt:

Clicking Show on Advanced Params allows you to fine-tune the inference generation.

Prompt Suggestions are clickable "starter chips" that appear above the input bar when a user opens a fresh chat with this model. These are vital for onboarding users to specialized agents.

You can transform a generic model into a specialized agent by toggling specific capabilities and binding resources.

From the main list view in the Models section, click the ellipsis (...) next to any model to perform actions:

A raw Base Model can be cloned as a custom Workspace model, but it will not clone the raw Base Model itself.

To download new raw Base Models (like Llama-3.2-3B-Instruct-GGUF:Q8_0 or Mistral-7B-Instruct-v0.2-GGUF:Q4_K_M), navigate to Settings > Connections > Ollama. Alternatively, type ollama run hf.co/{username}/{repository}:{quantization} in the model selector to pull directly from Hugging Face. This action will create a button within the model selector labeled "Pull [Model Name]" that will begin downloading the model from its source once clicked.

Open WebUI allows for dynamic model switching and parallel inference within a chat session.

Example: Switching between Mistral, LLaVA, and GPT-4 in a Multi-Stage Task.

**Examples:**

Example 1 (text):
```text
You are a helpful assistant for {{ USER_NAME }}.The current date is {{ CURRENT_DATE }}.
```

---

## Mojeek

**URL:** https://docs.openwebui.com/features/web-search/mojeek

**Contents:**
- Mojeek
- Mojeek Search API​
  - Setup​
  - Docker Compose Setup​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

Add the following environment variables to your Open WebUI docker-compose.yaml file:

**Examples:**

Example 1 (yaml):
```yaml
services:  open-webui:    environment:      ENABLE_RAG_WEB_SEARCH: True      RAG_WEB_SEARCH_ENGINE: "mojeek"      MOJEEK_SEARCH_API_KEY: "YOUR_MOJEEK_API_KEY"      RAG_WEB_SEARCH_RESULT_COUNT: 3      RAG_WEB_SEARCH_CONCURRENT_REQUESTS: 1
```

---

## Ollama Cloud Web Search

**URL:** https://docs.openwebui.com/features/web-search/ollama-cloud

**Contents:**
- Ollama Cloud Web Search

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

---

## Openedai-speech Using Docker

**URL:** https://docs.openwebui.com/features/audio/text-to-speech/openedai-speech-integration

**Contents:**
- Openedai-speech Using Docker
- Integrating openedai-speech into Open WebUI using Docker​
- What is openedai-speech?​
- Requirements​
- Option 1: Using Docker Compose​
- Step 1: Create a new folder for the openedai-speech service​
- Step 2: Clone the openedai-speech repository from GitHub​
- Step 3: Rename the sample.env file to speech.env (Customize if needed)​
- Step 4: Choose a Docker Compose file​
- Step 4: Build the Chosen Docker Image​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

openedai-speech is an OpenAI audio/speech API compatible text-to-speech server.

It serves the /v1/audio/speech endpoint and provides a free, private text-to-speech experience with custom voice cloning capabilities. This service is in no way affiliated with OpenAI and does not require an OpenAI API key.

Create a new folder, for example, openedai-speech-service, to store the docker-compose.yml and speech.env files.

This will download the openedai-speech repository to your local machine, which includes the Docker Compose files (docker-compose.yml, docker-compose.min.yml, and docker-compose.rocm.yml) and other necessary files.

In the openedai-speech repository folder, create a new file named speech.env with the following contents:

You can use any of the following Docker Compose files:

Before running the Docker Compose file, you need to build the Docker image:

This will start the openedai-speech service in detached mode.

You can also use the following Docker run commands to start the openedai-speech service in detached mode:

To enable ROCm support, uncomment the #USE_ROCM=1 line in the speech.env file.

Open the Open WebUI settings and navigate to the TTS Settings under Admin Panel > Settings > Audio. Add the following configuration:

Under TTS Voice within the same audio settings menu in the admin panel, you can set the TTS Model to use from the following choices below that openedai-speech supports. The voices of these models are optimized for the English language.

Press the Save button to apply the changes to your Open WebUI settings. Refresh the page for the change to fully take effect and enjoy using openedai-speech integration within Open WebUI to read aloud text responses with text-to-speech in a natural sounding voice.

openedai-speech supports multiple text-to-speech models, each with its own strengths and requirements. The following models are available:

If you encounter any problems integrating openedai-speech with Open WebUI, follow these troubleshooting steps:

How can I control the emotional range of the generated audio?

There is no direct mechanism to control the emotional output of the generated audio. Certain factors such as capitalization or grammar may affect the output audio, but internal testing has yielded mixed results.

Where are the voice files stored? What about the configuration file?.

The configuration files, which define the available voices and their properties, are stored in the config volume. Specifically, the default voices are defined in voice_to_speaker.default.yaml.

For more information on configuring Open WebUI to use openedai-speech, including setting environment variables, see the Open WebUI documentation.

For more information about openedai-speech, please visit the GitHub repository.

How to add more voices to openedai-speech: Custom-Voices-HowTo

You can change the port number in the docker-compose.yml file to any open and usable port, but be sure to update the API Base URL in Open WebUI Admin Audio settings accordingly.

**Examples:**

Example 1 (bash):
```bash
git clone https://github.com/matatonic/openedai-speech.git
```

Example 2 (yaml):
```yaml
TTS_HOME=voicesHF_HOME=voices#PRELOAD_MODEL=xtts#PRELOAD_MODEL=xtts_v2.0.2#PRELOAD_MODEL=parler-tts/parler_tts_mini_v0.1#EXTRA_ARGS=--log-level DEBUG --unload-timer 300#USE_ROCM=1
```

Example 3 (bash):
```bash
docker build -t ghcr.io/matatonic/openedai-speech .
```

Example 4 (bash):
```bash
docker build -f Dockerfile --build-arg USE_ROCM=1 -t ghcr.io/matatonic/openedai-speech-rocm .
```

---

## OpenLDAP Integration

**URL:** https://docs.openwebui.com/features/auth/ldap

**Contents:**
- OpenLDAP Integration
- 1. Setting Up OpenLDAP with Docker​
- 2. Seeding a Sample User (LDIF)​
- 3. Verifying the LDAP Connection​
- 4. Configuring Open WebUI​
  - Environment Variables​
  - UI Configuration​
- 5. Logging In​
- 6. Troubleshooting Common Errors​
  - port must be an integer​

This guide provides a comprehensive walkthrough for setting up OpenLDAP authentication with Open WebUI. It covers creating a test OpenLDAP server using Docker, seeding it with sample users, configuring Open WebUI to connect to it, and troubleshooting common issues.

The easiest way to get a test OpenLDAP server running is by using Docker. This docker-compose.yml file will create an OpenLDAP container and an optional phpLDAPadmin container for a web-based GUI.

Run docker-compose up -d to start the containers. Confirm that the LDAP server has started by checking the logs: docker logs openldap. You should see a "started slapd" message.

To test the login, you need to add a sample user to the LDAP directory. Create a file named seed.ldif with the following content:

Note on Passwords: The userPassword field is set to a plain text value for simplicity in this test environment. In production, you should always use a hashed password. You can generate a hashed password using slappasswd or openssl passwd. For example:

Copy the LDIF file into the container and use ldapadd to add the entry:

A successful operation will show an "adding new entry" message.

Before configuring Open WebUI, verify that the LDAP server is accessible and the user exists.

If the command returns the jdoe user entry, your LDAP server is ready.

Now, configure your Open WebUI instance to use the LDAP server for authentication.

Set the following environment variables for your Open WebUI instance.

Open WebUI reads these environment variables only on the first startup. Subsequent changes must be made in the Admin settings panel of the UI unless you have ENABLE_PERSISTENT_CONFIG=false.

Alternatively, you can configure these settings directly in the UI:

Open a new incognito browser window and navigate to your Open WebUI instance.

Upon successful login, a new user account with "User" role will be created automatically in Open WebUI. An administrator can later elevate the user's role if needed.

Here are solutions to common errors encountered during LDAP integration.

Cause: The LDAP_SERVER_PORT environment variable is being passed as a string with quotes (e.g., "389").

Cause: This is a TLS handshake failure. The client (Open WebUI) is trying to initiate a TLS connection, but the server (OpenLDAP) is not configured for it or is expecting a different protocol.

Cause: The LDAP server rejected the bind attempt because the distinguished name (DN) or the password was incorrect. This happens during the second bind attempt, where Open WebUI tries to authenticate with the user's provided credentials.

Verify the Password: Ensure you are using the correct plaintext password. The userPassword value in the LDIF file is what the server expects. If it's a hash, you must provide the original plaintext password.

Check the User DN: The DN used for the bind (uid=jdoe,ou=users,dc=example,dc=org) must be correct.

Test with ldapwhoami: Verify the credentials directly against the LDAP server to isolate the issue from Open WebUI.

If this command fails with ldap_bind: Invalid credentials (49), the problem is with the credentials or the LDAP server's password configuration, not Open WebUI.

Reset the Password: If you don't know the password, reset it using ldapmodify or ldappasswd. It's often easiest to use a {PLAIN} password for initial testing and then switch to a secure hash like {SSHA}.

Example LDIF to change password:

**Examples:**

Example 1 (yaml):
```yaml
version: "3.9"services:  ldap:    image: osixia/openldap:1.5.0    container_name: openldap    environment:      LDAP_ORGANISATION: "Example Inc"      LDAP_DOMAIN: "example.org"      LDAP_ADMIN_PASSWORD: admin      LDAP_TLS: "false"    volumes:      - ./ldap/var:/var/lib/ldap      - ./ldap/etc:/etc/ldap/slapd.d    ports:      - "389:389"    networks: [ldapnet]  phpldapadmin:    image: osixia/phpldapadmin:0.9.0    environment:      PHPLDAPADMIN_LDAP_HOSTS: "ldap"    ports:      - "6443:443"    networks: [ldapnet]networks:  ldapnet:    driver: bridge
```

Example 2 (ldif):
```ldif
dn: ou=users,dc=example,dc=orgobjectClass: organizationalUnitou: usersdn: uid=jdoe,ou=users,dc=example,dc=orgobjectClass: inetOrgPersoncn: John Doesn: Doeuid: jdoemail: jdoe@example.orguserPassword: {PLAIN}password123
```

Example 3 (bash):
```bash
# Using slappasswd (inside the container)docker exec openldap slappasswd -s your_password# Using opensslopenssl passwd -6 your_password
```

Example 4 (bash):
```bash
docker cp seed.ldif openldap:/seed.ldifdocker exec openldap ldapadd -x -D "cn=admin,dc=example,dc=org" -w admin -f /seed.ldif
```

---

## Organizing Conversations

**URL:** https://docs.openwebui.com/features/chat-features/conversation-organization

**Contents:**
- Organizing Conversations
- Folders: From Simple Organization to Powerful Projects​
  - Basic Folder Operations​
  - Starting a Chat within a Folder​
  - Editing Folder Settings: System Prompts & Knowledge​
  - Example Use Case​
- Tagging Conversations​
  - Example Use Case​

Open WebUI provides powerful organization features that help users manage their conversations. You can easily categorize and tag conversations, making it easier to find and retrieve them later. The two primary ways to organize conversations are through Folders and Tags.

Folders in Open WebUI have evolved from simple containers into powerful, project-like workspaces. They allow you to not only group related conversations but also to define specific contexts, instructions, and knowledge bases for those conversations.

At their core, folders still allow you to keep your chat list tidy:

By simply clicking on a folder in the sidebar, you select the folder as your space to start a chat in. The main chat interface will then update to show that you selected that folder and any new chat you start will now automatically be created inside this folder, inheriting its unique settings.

You can give each folder a unique personality and context. By hovering over a folder, clicking the three-dot menu, and selecting "Edit", you will open the folder's settings modal popup. Here, you can configure:

Creating a 'Python Expert' Project Imagine you are working on a Python project. You can create a folder called "Python Expert".

Tags provide an additional layer of organization by allowing you to label conversations with keywords or phrases.

Tagging by Topic If you frequently discuss certain topics, such as "marketing" or "development," you can tag conversations with these terms. Later, when you search for a specific tag, all relevant conversations will be quickly accessible.

---

## Permissions

**URL:** https://docs.openwebui.com/features/rbac/permissions

**Contents:**
- Permissions
- Permission Categories​
  - 1. Workspace Permissions​
  - 2. Sharing Permissions​
  - 3. Chat Permissions​
  - 4. Features Permissions​
- Managing Permissions​
  - Environment Variables​

The Permissions section of the Workspace within Open WebUI allows administrators to configure access controls and feature availability for users. This powerful system enables fine-grained control over what users can access and modify within the application.

Administrators can manage permissions in three primary ways:

Permissions in Open WebUI are additive.

Since permissions are additive, the recommended security strategy is to start with Restriction:

This approach ensures that new users don't accidentally get access to sensitive features, while allowing you to easily promote users by simply adding them to the relevant group.

Permissions are organized into four main categories: Workspace, Sharing, Chat, and Features.

Controls access to the "Workspace" section where users create and manage resources. Some permissions are dependent on others (e.g., you cannot import models if you cannot access the Models workspace).

Controls what users can share with the community or make public.

Controls the features available to the user inside the chat interface.

Controls access to broad platform capabilities.

The API Keys permission (features.api_keys) is treated with higher security and works differently than other features:

Global Toggle Required: The feature must be enabled globally in Admin Settings > General > Enable API Keys. If this is off, no one (not even groups with permission) can generate keys.

Permission Check Required: In addition to the global toggle, the user must look for the permission features.api_keys.

Admins Are Not Exempt: Unlike most other permissions which Admins bypass, Administrators require this permission to generate API keys. They are subject to the same checks as regular users for this critical security feature.

Recommended "Least Privilege" Configuration:

Administrators can adjust these permissions through the Admin Panel > Settings > Users > Permissions.

While the UI is the recommended way to manage permissions, initial defaults can be set via environment variables. These are typically prefixed with USER_PERMISSIONS_.

See the Environment Configuration guide for a complete list of valid variables.

---

## Perplexity

**URL:** https://docs.openwebui.com/features/web-search/perplexity

**Contents:**
- Perplexity
- Perplexity API​
  - Setup​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

Perplexity API in this tutorial is using Perplexity's own models, as opposed to just the websearch API. Conduct the other tutorial for the web search API.

---

## Perplexity Search

**URL:** https://docs.openwebui.com/features/web-search/perplexity_search

**Contents:**
- Perplexity Search
- Perplexity Search API​
  - Setup​
  - Using LiteLLM for Search​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

Perplexity Search API is just a search engine, as opposed to the Perplexity integration, which is using Perplexity's models (in combination with their websearch).

You can use a LiteLLM proxy instance as your search provider instead of connecting directly to Perplexity. LiteLLM's /search endpoint is compatible with the Perplexity Search API style used by Open WebUI.

If your LiteLLM instance is running on localhost and you want to use the perplexity-search provider defined in your LiteLLM config:

**Examples:**

Example 1 (text):
```text
http://localhost:4000/search/perplexity-search
```

---

## Prompts

**URL:** https://docs.openwebui.com/features/workspace/prompts

**Contents:**
- Prompts
  - Prompt Management​
  - Creating and Editing Prompts​
  - Prompt Variables​
  - Variable Usage Guidelines​
    - Using Custom Input Variables​
    - Example Use Cases​
  - Access Control and Permissions​
  - Best Practices​
  - Migration Notes​

The Prompts section of the Workspace within Open WebUI enables users to create, manage, and share custom prompts. This feature streamlines interactions with AI models by allowing users to save frequently used prompts and easily access them through slash commands.

The Prompts interface provides several key features for managing your custom prompts:

When creating or editing a prompt, you can configure the following settings:

Open WebUI supports two kinds of variables to make your prompts more dynamic and powerful: System Variables and Custom Input Variables.

System Variables are automatically replaced with their corresponding value when the prompt is used. They are useful for inserting dynamic information like the current date or user details.

Custom Input Variables transform your prompts into interactive templates. When you use a prompt containing these variables, a modal window will automatically appear, allowing you to fill in your values. This is extremely powerful for creating complex, reusable prompts that function like forms. See the guidelines below for a full explanation.

By leveraging custom input variables, you can move beyond static text and build interactive tools directly within the chat interface. This feature is designed to be foolproof, enabling even non-technical users to execute complex, multi-step prompts with ease. Instead of manually editing a large block of text, users are presented with a clean, structured form. This not only streamlines the workflow but also reduces errors by guiding the user to provide exactly the right information in the right format. It unlocks a new level of interactive prompt design, making sophisticated AI usage accessible to everyone.

There are two ways to define a custom variable:

Simple Input: {{variable_name}}

Typed Input: {{variable_name | [type][:property="value"]}}

Required vs Optional Variables

By default, all custom input variables are optional, meaning users can leave them blank when filling out the form. This flexible approach allows for versatile prompt templates where some information might not always be needed.

To make a variable required (mandatory), add the :required flag:

When a field is marked as required:

You can specify different input types to build rich, user-friendly forms. Here is a table of available types and their properties.

1. Flexible Article Summarizer

Create a reusable prompt where the article content is required but additional parameters are optional.

Command: /summarize_article

When you type /summarize_article, a modal will appear with a required text area for the article, and optional fields for customizing the summary style.

2. Advanced Bug Report Generator

This prompt ensures critical information is captured while allowing optional details.

This creates a form where title, priority, and steps are mandatory, but additional context and workarounds are optional.

3. Social Media Post Generator with Smart Defaults

This prompt generates tailored content with required core information and optional customizations.

Command: /social_post

4. Meeting Minutes Assistant with Flexible Structure

Generate structured meeting minutes with required basics and optional details.

Command: /meeting_minutes

5. Content Review Template

A flexible template for reviewing various types of content.

Command: /content_review

Prompt management is controlled by the following permission settings:

If you have existing prompts created before this update, they will continue to work as before. However, note that:

**Examples:**

Example 1 (txt):
```txt
{{mandatory_field | text:required}}{{optional_field | text}}
```

Example 2 (txt):
```txt
Please summarize the following article. {{article_text | textarea:placeholder="Paste the full text of the article here...":required}}{{summary_length | select:options=["Brief (3 bullets)","Detailed (5 bullets)","Executive Summary"]:default="Brief (3 bullets)"}}{{focus_area | text:placeholder="Any specific aspect to focus on? (optional)"}}{{include_quotes | checkbox}} Include key quotes from the article
```

Example 3 (txt):
```txt
Generate a bug report with the following details:**Summary:** {{summary | text:placeholder="A brief summary of the issue":required}}**Priority:** {{priority | select:options=["Critical","High","Medium","Low"]:default="Medium":required}}**Steps to Reproduce:**{{steps | textarea:placeholder="1. Go to...\n2. Click on...\n3. See error...":required}}**Additional Context:** {{additional_context | textarea:placeholder="Browser version, OS, screenshots, etc. (optional)"}}**Workaround:** {{workaround | textarea:placeholder="Any temporary solutions found (optional)"}}Please format this into a clear and complete bug report document.
```

Example 4 (txt):
```txt
Generate a social media post for {{platform | select:options=["LinkedIn","Twitter","Facebook","Instagram"]:required}}.**Topic:** {{topic | text:placeholder="e.g., New feature launch":required}}**Key Message:** {{key_message | textarea:placeholder="What are the essential points to communicate?":required}}**Tone of Voice:** {{tone | select:options=["Professional","Casual","Humorous","Inspirational"]:default="Professional"}}**Call to Action:** {{cta | text:placeholder="e.g., 'Learn more', 'Sign up today'"}}**Character Limit:** {{char_limit | number:placeholder="Leave blank for platform default"}}**Include Hashtags:** {{include_hashtags | checkbox:default=true}}Please create an engaging post optimized for the selected platform.
```

---

## Retrieval Augmented Generation (RAG)

**URL:** https://docs.openwebui.com/features/rag

**Contents:**
- Retrieval Augmented Generation (RAG)
- Local and Remote RAG Integration​
- Web Search for RAG​
- RAG Template Customization​
- RAG Embedding Support​
- Citations in RAG Feature​
- Enhanced RAG Pipeline​
- YouTube RAG Pipeline​
- Document Parsing​
- Google Drive Integration​

If you're using Ollama, note that it defaults to a 2048-token context length. This severely limits Retrieval-Augmented Generation (RAG) performance, especially for web search, because retrieved data may not be used at all or only partially processed.

Retrieval Augmented Generation (RAG) is a cutting-edge technology that enhances the conversational capabilities of chatbots by incorporating context from diverse sources. It works by retrieving relevant information from a wide range of sources such as local and remote documents, web content, and even multimedia sources like YouTube videos. The retrieved text is then combined with a predefined RAG template and prefixed to the user's prompt, providing a more informed and contextually relevant response.

One of the key advantages of RAG is its ability to access and integrate information from a variety of sources, making it an ideal solution for complex conversational scenarios. For instance, when a user asks a question related to a specific document or web page, RAG can retrieve and incorporate the relevant information from that source into the chat response. RAG can also retrieve and incorporate information from multimedia sources like YouTube videos. By analyzing the transcripts or captions of these videos, RAG can extract relevant information and incorporate it into the chat response.

Local documents must first be uploaded via the Documents section of the Workspace area to access them using the # symbol before a query. Click on the formatted URL in the that appears above the chat box. Once selected, a document icon appears above Send a message, indicating successful retrieval.

You can also load documents into the workspace area with their access by starting a prompt with #, followed by a URL. This can help incorporate web content directly into your conversations.

Context Length Warning for Ollama Users: Web pages typically contain 4,000-8,000+ tokens even after content extraction, including main content, navigation elements, headers, footers, and metadata. With only 2048 tokens available, you're getting less than half the page content, often missing the most relevant information. Even 4096 tokens is frequently insufficient for comprehensive web content analysis.

To Fix This: Navigate to Admin Panel > Models > Settings (of your Ollama model) > Advanced Parameters and increase the context length to 8192+ (or rather, more than 16000) tokens. This setting specifically applies to Ollama models. For OpenAI and other integrated models, ensure you're using a model with sufficient built-in context length (e.g., GPT-4 Turbo with 128k tokens).

For web content integration, start a query in a chat with #, followed by the target URL. Click on the formatted URL in the box that appears above the chat box. Once selected, a document icon appears above Send a message, indicating successful retrieval. Open WebUI fetches and parses information from the URL if it can.

Web pages often contain extraneous information such as navigation and footer. For better results, link to a raw or reader-friendly version of the page.

Customize the RAG template from the Admin Panel > Settings > Documents menu.

Change the RAG embedding model directly in the Admin Panel > Settings > Documents menu. This feature supports Ollama and OpenAI models, enabling you to enhance document processing according to your requirements.

The RAG feature allows users to easily track the context of documents fed to LLMs with added citations for reference points. This ensures transparency and accountability in the use of external sources within your chats.

The togglable hybrid search sub-feature for our RAG embedding feature enhances RAG functionality via BM25, with re-ranking powered by CrossEncoder, and configurable relevance score thresholds. This provides a more precise and tailored RAG experience for your specific use case.

The dedicated RAG pipeline for summarizing YouTube videos via video URLs enables smooth interaction with video transcriptions directly. This innovative feature allows you to incorporate video content into your chats, further enriching your conversation experience.

A variety of parsers extract content from local and remote documents. For more, see the get_loader function.

When using Temporary Chat, document processing is restricted to frontend-only operations to ensure your data stays private and is not stored on the server. Consequently, advanced backend parsing (used for formats like complex DOCX files) is disabled, which may result in raw data being seen instead of parsed text. For full document support, use a standard chat session.

When paired with a Google Cloud project that has the Google Picker API and Google Drive API enabled, this feature allows users to directly access their Drive files from the chat interface and upload documents, slides, sheets and more and uploads them as context to your chat. Can be enabled Admin Panel > Settings > Documents menu. Must set GOOGLE_DRIVE_API_KEY and GOOGLE_DRIVE_CLIENT_ID environment variables to use.

---

## Roles

**URL:** https://docs.openwebui.com/features/rbac/roles

**Contents:**
- Roles
- Role Details​
  - Administrator (admin)​
  - Standard User (user)​
  - Pending User (pending)​
- Role Assignment​
  - Initial Setup​
  - Configuration​
- Changing Roles​

Open WebUI defines three primary System Roles that determine the fundamental access level of a user account. These roles are distinct from Groups and Permissions.

The Admin role is designed for system maintainers.

While Administrators generally have unrestricted access, certain system configurations can limit their capabilities for security and privacy:

For a robust security posture, we recommend including Admins in your permission schema (via Groups) rather than relying solely on the role's implicit bypasses. This ensures consistent access if bypass limitations are ever enabled.

This is the default functional role for team members.

The default state for new sign-ups (if configured) or deactivated users.

The admin role effectively has check_permission() == True for everything. Granular permissions (like disabling "Web Search") generally do not apply to admins.

You can control the default role for new users via the DEFAULT_USER_ROLE environment variable:

Administrators can change a user's role at any time via Admin Panel > Users.

**Examples:**

Example 1 (bash):
```bash
DEFAULT_USER_ROLE=pending# Options: 'pending', 'user', 'admin'
```

---

## Role-Based Access Control (RBAC)

**URL:** https://docs.openwebui.com/features/rbac/

**Contents:**
- Role-Based Access Control (RBAC)
- Documentation Guide​

Open WebUI implements a flexible and secure Role-Based Access Control (RBAC) system. This system allows administrators to precisely manage user capabilities and access to resources through three interconnected layers:

The security model is Additive. Users start with their default rights, and Group memberships add capabilities. A user effectively has the union of all rights granted by their Roles and Groups.

---

## SCIM 2.0 Support

**URL:** https://docs.openwebui.com/features/auth/scim

**Contents:**
- SCIM 2.0 Support
- Overview​
- Configuration​
  - Environment Variables​
  - Example Configuration​
- SCIM API Configuration​
  - Example for Popular Identity Providers​
    - Okta​
- Supported SCIM Operations​
  - User Operations​

Open WebUI supports SCIM 2.0 (System for Cross-domain Identity Management) for automated user and group provisioning from identity providers like Okta, Azure AD, and Google Workspace.

SCIM is an open standard that allows for the automation of user provisioning. When enabled, your identity provider can automatically:

SCIM is configured entirely through environment variables. There is no UI configuration for SCIM settings.

Configure SCIM by setting these environment variables:

Security Note The SCIM token should be a secure, randomly generated string. You can generate one using:

Keep this token secure as it provides access to user management operations.

When configuring your identity provider, use the following settings:

Open WebUI's SCIM implementation supports the following operations:

The SCIM API supports filtering for both users and groups:

Supported filter operators:

401 Unauthorized Errors

User Creation Failures

You can test SCIM endpoints using curl:

SCIM works best when combined with SSO (Single Sign-On). A typical setup includes:

This ensures users are automatically created and can immediately authenticate using their corporate credentials.

For SSO configuration, see the SSO documentation.

**Examples:**

Example 1 (bash):
```bash
openssl rand -base64 32
```

Example 2 (bash):
```bash
# Enable SCIMexport SCIM_ENABLED=true# Set a secure token (replace with your own generated token)export SCIM_TOKEN="your-secure-token-here"
```

Example 3 (text):
```text
GET /api/v1/scim/v2/Users?filter=userName eq "user@example.com"GET /api/v1/scim/v2/Groups?filter=displayName eq "Engineering"
```

Example 4 (bash):
```bash
# Test authentication and list userscurl -H "Authorization: Bearer your-scim-token" \  https://your-domain.com/api/v1/scim/v2/Users# Get a specific usercurl -H "Authorization: Bearer your-scim-token" \  https://your-domain.com/api/v1/scim/v2/Users/user-id# Create a test usercurl -X POST \  -H "Authorization: Bearer your-scim-token" \  -H "Content-Type: application/scim+json" \  -d '{    "schemas": ["urn:ietf:params:scim:schemas:core:2.0:User"],    "userName": "test@example.com",    "displayName": "Test User",    "name": {      "givenName": "Test",      "familyName": "User"    },    "emails": [{      "value": "test@example.com",      "primary": true    }],    "active": true  }' \  https://your-domain.com/api/v1/scim/v2/Users
```

---

## SearchApi

**URL:** https://docs.openwebui.com/features/web-search/searchapi

**Contents:**
- SearchApi
- SearchApi API​
  - Setup​
    - Note​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

SearchApi is a collection of real-time SERP APIs. Any existing or upcoming SERP engine that returns organic_results is supported. The default web search engine is google, but it can be changed to bing, baidu, google_news, bing_news, google_scholar, google_patents, and others.

You have to enable Web search in the prompt field, using plus (+) button to search the web using SearchApi engines.

---

## SearXNG

**URL:** https://docs.openwebui.com/features/web-search/searxng

**Contents:**
- SearXNG
- SearXNG (Docker)​
- 1. SearXNG Configuration​
- 2. Alternative Setup​
  - Docker Compose Setup​
- 3. Confirm Connectivity​
- 4. GUI Configuration​
- 5. Using Web Search in a Chat​
    - Note​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

This guide provides instructions on how to set up web search capabilities in Open WebUI using SearXNG in Docker.

"SearXNG is a free internet metasearch engine which aggregates results from various search services and databases. Users are neither tracked nor profiled."

To configure SearXNG optimally for use with Open WebUI, follow these steps:

Step 1: git clone SearXNG Docker and navigate to the folder:

Clone the searxng-docker repository. This will create a new directory called searxng-docker, which will contain your SearXNG configuration files. Refer to the SearXNG documentation for configuration instructions.

Navigate to the searxng-docker repository, and run all commands from there:

Step 2: Locate and and modify the .env file:

Step 3: Modify the docker-compose.yaml file

If port 8080 is already in use, change 0.0.0.0:8080 to 0.0.0.0:[available port] in the command before running it.

Run the appropriate command for your operating system:

Step 4: Grant Necessary Permissions

Step 5: Create a Non-Restrictive limiter.toml File

If the file already exists, append the missing lines to it.

Step 6: Remove the Default settings.yml File

Step 7: Create a Fresh settings.yml File

If you have multiple containers running with the same name, such as caddy, redis, or searxng, you need to rename them in the docker-compose.yaml file to avoid conflicts.

After the initial run, add cap_drop: - ALL to the docker-compose.yaml file for security reasons.

If Open WebUI is running in the same Docker network as Searxng, you may remove the 0.0.0.0 and only specify the port mapping. In this case, Open WebUI can access Searxng directly using the container name.

Step 9: Run the Server

The searXNG will be available at http://localhost:8080 (or the port number you set earlier).

Alternatively, if you don't want to modify the default configuration, you can simply create an empty searxng-docker folder and follow the rest of the setup instructions.

Add the following environment variables to your Open WebUI docker-compose.yaml file:

Create a .env file for SearXNG:

Next, add the following to SearXNG's docker-compose.yaml file:

Your stack is ready to be launched with:

On the first run, you must remove cap_drop: - ALL from the docker-compose.yaml file for the searxng service to successfully create /etc/searxng/uwsgi.ini. This is necessary because the cap_drop: - ALL directive removes all capabilities, including those required for the creation of the uwsgi.ini file. After the first run, you should re-add cap_drop: - ALL to the docker-compose.yaml file for security reasons.

Configure SearXNG for Open WebUI Integration

After starting the container, you need to configure SearXNG to support JSON format queries from Open WebUI:

Alternatively, you can use the following command to automatically add JSON support:

Without adding JSON format support, SearXNG will block queries from Open WebUI and you'll encounter 403 Client Error: Forbidden errors in your Open WebUI logs.

Alternatively, you can run SearXNG directly using docker run:

Confirm connectivity to SearXNG from your Open WebUI container instance in your command line interface:

Do note the /search?q=<query> part is mandatory.

To access Web Search, Click the Integrations button next to the + icon.

Here you can toggle Web Search On/Off.

By following these steps, you will have successfully set up SearXNG with Open WebUI, enabling you to perform web searches using the SearXNG engine.

You will have to explicitly toggle this On/Off in a chat.

This is enabled on a per session basis eg. reloading the page, changing to another chat will toggle off.

**Examples:**

Example 1 (bash):
```bash
git clone https://github.com/searxng/searxng-docker.git
```

Example 2 (bash):
```bash
cd searxng-docker
```

Example 3 (bash):
```bash
# By default listen on https://localhost# To change this:# * uncomment SEARXNG_HOSTNAME, and replace <host> by the SearXNG hostname# * uncomment LETSENCRYPT_EMAIL, and replace <email> by your email (require to create a Let's Encrypt certificate)SEARXNG_HOSTNAME=localhost# LETSENCRYPT_EMAIL=<email># Optional:# If you run a very small or a very large instance, you might want to change the amount of used uwsgi workers and threads per worker# More workers (= processes) means that more search requests can be handled at the same time, but it also causes more resource usage# SEARXNG_UWSGI_WORKERS=4# SEARXNG_UWSGI_THREADS=4
```

Example 4 (bash):
```bash
sed -i 's/127.0.0.1:8080/0.0.0.0:8080/' docker-compose.yaml
```

---

## SerpApi

**URL:** https://docs.openwebui.com/features/web-search/serpapi

**Contents:**
- SerpApi
- SerpApi API​
  - Setup​
    - Note​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

SerpApi Scrape Google and other search engines from our fast, easy, and complete API. Any existing or upcoming SERP engine that returns organic_results is supported. The default web search engine is google, but it can be changed to bing, baidu, google_news, google_scholar, google_patents, and others.

You have to enable Web search in the prompt field to search the web using SerpApi engines.

---

## Serper

**URL:** https://docs.openwebui.com/features/web-search/serper

**Contents:**
- Serper

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

---

## Serply

**URL:** https://docs.openwebui.com/features/web-search/serply

**Contents:**
- Serply

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

---

## Serpstack

**URL:** https://docs.openwebui.com/features/web-search/serpstack

**Contents:**
- Serpstack

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

---

## SSO (OAuth, OIDC, Trusted Header)

**URL:** https://docs.openwebui.com/features/auth/sso

**Contents:**
- SSO (OAuth, OIDC, Trusted Header)
- OAuth Configuration Overview​
  - Server-Side OAuth Session Management​
  - Google​
  - Microsoft​
  - Github​
  - OIDC​
  - OAuth Role Management​
  - OAuth Group Management​
- Trusted Header​

For more information about all environment variables, check out the environment variable docs page. It is highly recommended to check the environment variable page, to get more details about how to set the variable and what values are expected.

Need help with troubleshooting your SSO setup? Check out our troubleshooting guide

Right now, you can only configure one OpenID Connect (OIDC) provider at a time via OPENID_PROVIDER_URL. You cannot have Microsoft and Google as OIDC providers simultaneously.

However, there is a community workaround for using both! See our Dual OAuth Tutorial for more details.

Critical Configuration Notes:

WEBUI_URL Must Be Set First: Configure WEBUI_URL in the Admin Panel before enabling OAuth, as it's used for redirect URIs.

Persistent Config Behavior: When ENABLE_OAUTH_PERSISTENT_CONFIG=true (default), OAuth settings are stored in the database after first launch. To change environment variables after initial setup, either:

Required Variables: Always verify you're using the exact variable names from the environment configuration documentation. Common mistakes include using non-existent variables like OIDC_CONFIG.

To solve issues related to large tokens (e.g., with AD FS group claims exceeding cookie size limits) and to enable automatic token refreshing, Open WebUI now supports a robust server-side session management system.

This system is enabled by default but can be fine-tuned with the environment variables detailed above.

For more information, check out the environment variable docs page.

To configure a Google OAuth client, please refer to Google's documentation on how to create a Google OAuth client for a web application. The allowed redirect URI should include <open-webui>/oauth/google/callback.

The following environment variables are required:

To configure a Microsoft OAuth client, please refer to Microsoft's documentation on how to create a Microsoft OAuth client for a web application. The allowed redirect URI should include <open-webui>/oauth/microsoft/callback. This value should be used for the MICROSOFT_REDIRECT_URI environment variable.

Support for Microsoft OAuth is currently limited to a single tenant, that is a single Entra organization or personal Microsoft accounts.

The following environment variables are required:

To configure a Github OAuth Client, please refer to Github's documentation on how to create a OAuth App or Github App for a web application. The allowed redirect URI should include <open-webui>/oauth/github/callback.

The following environment variables are required:

Any authentication provider that supports OIDC can be configured. The email claim is required. name and picture claims are used if available. The allowed redirect URI should include <open-webui>/oauth/oidc/callback.

The following environment variables are used:

Common OIDC Mistakes:

If you need to support both Microsoft and Google simultaneously, check out our Dual OAuth Configuration Tutorial.

Any OAuth provider that can be configured to return roles in the access token can be used to manage roles in Open WebUI. To use this feature set ENABLE_OAUTH_ROLE_MANAGEMENT to true. You can configure the following environment variables to match the roles returned by the OAuth provider:

If changing the role of a logged in user, they will need to log out and log back in to receive the new role.

Any OAuth provider that can be configured to return groups in the access token can be used to manage user groups in Open WebUI upon user login. To enable this synchronization, set ENABLE_OAUTH_GROUP_MANAGEMENT to true.

You can configure the following environment variables:

Strict Group Synchronization When ENABLE_OAUTH_GROUP_MANAGEMENT is set to true, a user's group memberships in Open WebUI are strictly synchronized with the groups received in their OAuth claims upon each login.

Ensure all necessary groups are correctly configured in your OAuth provider and included in the group claim (OAUTH_GROUP_CLAIM).

Admin Users Admin users' group memberships are not automatically updated via OAuth group management.

Login Required for Updates

If a user's groups change in the OAuth provider, they will need to log out of Open WebUI and log back in for the changes to be reflected.

Open WebUI is able to delegate authentication to an authenticating reverse proxy that passes in the user's details in HTTP headers. There are several example configurations that are provided in this page.

Incorrect configuration can allow users to authenticate as any user on your Open WebUI instance. Make sure to allow only the authenticating proxy access to Open WebUI, such as by not opening any ports directly to the container, or by setting HOST=127.0.0.1 so that it only listens on the loopback interface.

When the WEBUI_AUTH_TRUSTED_EMAIL_HEADER environment variable is set, Open WebUI will use the value of the header specified as the email address of the user, handling automatic registration and login.

For example, setting WEBUI_AUTH_TRUSTED_EMAIL_HEADER=X-User-Email and passing a HTTP header of X-User-Email: example@example.com would authenticate the request with the email example@example.com.

Optionally, you can also define the WEBUI_AUTH_TRUSTED_NAME_HEADER to determine the name of any user being created using trusted headers. This has no effect if the user already exists. If WEBUI_AUTH_TRUSTED_NAME_HEADER is not set, the email address is used as user name.

You can use the WEBUI_AUTH_TRUSTED_GROUPS_HEADER environment variable to synchronize user groups in Open WebUI. Set this variable to the name of the HTTP header that will contain a comma-separated list of group names for the authenticated user.

When a request is authenticated via WEBUI_AUTH_TRUSTED_EMAIL_HEADER, and the trusted groups header is set and present, Open WebUI will update the user's group memberships to match the groups listed in the header.

Tailscale Serve allows you to share a service within your tailnet, and Tailscale will set the header Tailscale-User-Login with the email address of the requester.

Below is an example serve config with a corresponding Docker Compose file that starts a Tailscale sidecar, exposing Open WebUI to the tailnet with the tag open-webui and hostname open-webui, and can be reachable at https://open-webui.TAILNET_NAME.ts.net. You will need to create an OAuth client with device write permission to pass into the Tailscale container as TS_AUTHKEY.

If you run Tailscale in the same network context as Open WebUI, then by default users will be able to directly reach out to Open WebUI without going through the Serve proxy. You will need use Tailscale's ACLs to restrict access to only port 443.

Cloudflare Tunnel can be used with Cloudflare Access to protect Open WebUI with SSO. This is barely documented by Cloudflare, but Cf-Access-Authenticated-User-Email is set with the email address of the authenticated user.

Below is an example Docker Compose file that sets up a Cloudflare sidecar. Configuration is done via the dashboard. From the dashboard, get a tunnel token, set the tunnel backend to http://open-webui:8080, and ensure that "Protect with Access" is checked and configured.

oauth2-proxy is an authenticating reverse proxy that implements social OAuth providers and OIDC support.

Given the large number of potential configurations, below is an example of a potential setup with Google OAuth. Please refer to oauth2-proxy's documentation for detailed setup and any potential security gotchas.

To configure a Authentik OAuth client, please refer to documentation on how to create an application and OAuth2/OpenID Provider. The allowed redirect URI should include <open-webui>/oauth/oidc/callback.

While creating provider, please note App-name, Client-ID and Client-Secret and use it for open-webui environment variables:

Authelia can be configured to return a header for use with trusted header authentication. Documentation is available here.

No example configs are provided due to the complexity of deploying Authelia.

**Examples:**

Example 1 (json):
```json
{    "TCP": {        "443": {            "HTTPS": true        }    },    "Web": {        "${TS_CERT_DOMAIN}:443": {            "Handlers": {                "/": {                    "Proxy": "http://open-webui:8080"                }            }        }    }}
```

Example 2 (yaml):
```yaml
---services:  open-webui:    image: ghcr.io/open-webui/open-webui:main    volumes:      - open-webui:/app/backend/data    environment:      - WEBUI_AUTH_TRUSTED_EMAIL_HEADER=Tailscale-User-Login      - WEBUI_AUTH_TRUSTED_NAME_HEADER=Tailscale-User-Name    restart: unless-stopped  tailscale:    image: tailscale/tailscale:latest    environment:      - TS_AUTH_ONCE=true      - TS_AUTHKEY=${TS_AUTHKEY}      - TS_EXTRA_ARGS=--advertise-tags=tag:open-webui      - TS_SERVE_CONFIG=/config/serve.json      - TS_STATE_DIR=/var/lib/tailscale      - TS_HOSTNAME=open-webui    volumes:      - tailscale:/var/lib/tailscale      - ./tailscale:/config      - /dev/net/tun:/dev/net/tun    cap_add:      - net_admin      - sys_module    restart: unless-stoppedvolumes:  open-webui: {}  tailscale: {}
```

Example 3 (yaml):
```yaml
---services:  open-webui:    image: ghcr.io/open-webui/open-webui:main    volumes:      - open-webui:/app/backend/data    environment:      - WEBUI_AUTH_TRUSTED_EMAIL_HEADER=Cf-Access-Authenticated-User-Email    restart: unless-stopped  cloudflared:    image: cloudflare/cloudflared:latest    environment:      - TUNNEL_TOKEN=${TUNNEL_TOKEN}    command: tunnel run    restart: unless-stoppedvolumes:  open-webui: {}
```

Example 4 (yaml):
```yaml
services:  open-webui:    image: ghcr.io/open-webui/open-webui:main    volumes:      - open-webui:/app/backend/data    environment:      - 'WEBUI_AUTH_TRUSTED_EMAIL_HEADER=X-Forwarded-Email'      - 'WEBUI_AUTH_TRUSTED_NAME_HEADER=X-Forwarded-User'    restart: unless-stopped  oauth2-proxy:    image: quay.io/oauth2-proxy/oauth2-proxy:v7.6.0    environment:      OAUTH2_PROXY_HTTP_ADDRESS: 0.0.0.0:4180      OAUTH2_PROXY_UPSTREAMS: http://open-webui:8080/      OAUTH2_PROXY_PROVIDER: google      OAUTH2_PROXY_CLIENT_ID: REPLACEME_OAUTH_CLIENT_ID      OAUTH2_PROXY_CLIENT_SECRET: REPLACEME_OAUTH_CLIENT_ID      OAUTH2_PROXY_EMAIL_DOMAINS: REPLACEME_ALLOWED_EMAIL_DOMAINS      OAUTH2_PROXY_REDIRECT_URL: REPLACEME_OAUTH_CALLBACK_URL      OAUTH2_PROXY_COOKIE_SECRET: REPLACEME_COOKIE_SECRET      OAUTH2_PROXY_COOKIE_SECURE: "false"    restart: unless-stopped    ports:      - 4180:4180/tcp
```

---

## SSO (OAuth, OIDC, Trusted Header)

**URL:** https://docs.openwebui.com/features/auth/sso/

**Contents:**
- SSO (OAuth, OIDC, Trusted Header)
- OAuth Configuration Overview​
  - Server-Side OAuth Session Management​
  - Google​
  - Microsoft​
  - Github​
  - OIDC​
  - OAuth Role Management​
  - OAuth Group Management​
- Trusted Header​

For more information about all environment variables, check out the environment variable docs page. It is highly recommended to check the environment variable page, to get more details about how to set the variable and what values are expected.

Need help with troubleshooting your SSO setup? Check out our troubleshooting guide

Right now, you can only configure one OpenID Connect (OIDC) provider at a time via OPENID_PROVIDER_URL. You cannot have Microsoft and Google as OIDC providers simultaneously.

However, there is a community workaround for using both! See our Dual OAuth Tutorial for more details.

Critical Configuration Notes:

WEBUI_URL Must Be Set First: Configure WEBUI_URL in the Admin Panel before enabling OAuth, as it's used for redirect URIs.

Persistent Config Behavior: When ENABLE_OAUTH_PERSISTENT_CONFIG=true (default), OAuth settings are stored in the database after first launch. To change environment variables after initial setup, either:

Required Variables: Always verify you're using the exact variable names from the environment configuration documentation. Common mistakes include using non-existent variables like OIDC_CONFIG.

To solve issues related to large tokens (e.g., with AD FS group claims exceeding cookie size limits) and to enable automatic token refreshing, Open WebUI now supports a robust server-side session management system.

This system is enabled by default but can be fine-tuned with the environment variables detailed above.

For more information, check out the environment variable docs page.

To configure a Google OAuth client, please refer to Google's documentation on how to create a Google OAuth client for a web application. The allowed redirect URI should include <open-webui>/oauth/google/callback.

The following environment variables are required:

To configure a Microsoft OAuth client, please refer to Microsoft's documentation on how to create a Microsoft OAuth client for a web application. The allowed redirect URI should include <open-webui>/oauth/microsoft/callback. This value should be used for the MICROSOFT_REDIRECT_URI environment variable.

Support for Microsoft OAuth is currently limited to a single tenant, that is a single Entra organization or personal Microsoft accounts.

The following environment variables are required:

To configure a Github OAuth Client, please refer to Github's documentation on how to create a OAuth App or Github App for a web application. The allowed redirect URI should include <open-webui>/oauth/github/callback.

The following environment variables are required:

Any authentication provider that supports OIDC can be configured. The email claim is required. name and picture claims are used if available. The allowed redirect URI should include <open-webui>/oauth/oidc/callback.

The following environment variables are used:

Common OIDC Mistakes:

If you need to support both Microsoft and Google simultaneously, check out our Dual OAuth Configuration Tutorial.

Any OAuth provider that can be configured to return roles in the access token can be used to manage roles in Open WebUI. To use this feature set ENABLE_OAUTH_ROLE_MANAGEMENT to true. You can configure the following environment variables to match the roles returned by the OAuth provider:

If changing the role of a logged in user, they will need to log out and log back in to receive the new role.

Any OAuth provider that can be configured to return groups in the access token can be used to manage user groups in Open WebUI upon user login. To enable this synchronization, set ENABLE_OAUTH_GROUP_MANAGEMENT to true.

You can configure the following environment variables:

Strict Group Synchronization When ENABLE_OAUTH_GROUP_MANAGEMENT is set to true, a user's group memberships in Open WebUI are strictly synchronized with the groups received in their OAuth claims upon each login.

Ensure all necessary groups are correctly configured in your OAuth provider and included in the group claim (OAUTH_GROUP_CLAIM).

Admin Users Admin users' group memberships are not automatically updated via OAuth group management.

Login Required for Updates

If a user's groups change in the OAuth provider, they will need to log out of Open WebUI and log back in for the changes to be reflected.

Open WebUI is able to delegate authentication to an authenticating reverse proxy that passes in the user's details in HTTP headers. There are several example configurations that are provided in this page.

Incorrect configuration can allow users to authenticate as any user on your Open WebUI instance. Make sure to allow only the authenticating proxy access to Open WebUI, such as by not opening any ports directly to the container, or by setting HOST=127.0.0.1 so that it only listens on the loopback interface.

When the WEBUI_AUTH_TRUSTED_EMAIL_HEADER environment variable is set, Open WebUI will use the value of the header specified as the email address of the user, handling automatic registration and login.

For example, setting WEBUI_AUTH_TRUSTED_EMAIL_HEADER=X-User-Email and passing a HTTP header of X-User-Email: example@example.com would authenticate the request with the email example@example.com.

Optionally, you can also define the WEBUI_AUTH_TRUSTED_NAME_HEADER to determine the name of any user being created using trusted headers. This has no effect if the user already exists. If WEBUI_AUTH_TRUSTED_NAME_HEADER is not set, the email address is used as user name.

You can use the WEBUI_AUTH_TRUSTED_GROUPS_HEADER environment variable to synchronize user groups in Open WebUI. Set this variable to the name of the HTTP header that will contain a comma-separated list of group names for the authenticated user.

When a request is authenticated via WEBUI_AUTH_TRUSTED_EMAIL_HEADER, and the trusted groups header is set and present, Open WebUI will update the user's group memberships to match the groups listed in the header.

Tailscale Serve allows you to share a service within your tailnet, and Tailscale will set the header Tailscale-User-Login with the email address of the requester.

Below is an example serve config with a corresponding Docker Compose file that starts a Tailscale sidecar, exposing Open WebUI to the tailnet with the tag open-webui and hostname open-webui, and can be reachable at https://open-webui.TAILNET_NAME.ts.net. You will need to create an OAuth client with device write permission to pass into the Tailscale container as TS_AUTHKEY.

If you run Tailscale in the same network context as Open WebUI, then by default users will be able to directly reach out to Open WebUI without going through the Serve proxy. You will need use Tailscale's ACLs to restrict access to only port 443.

Cloudflare Tunnel can be used with Cloudflare Access to protect Open WebUI with SSO. This is barely documented by Cloudflare, but Cf-Access-Authenticated-User-Email is set with the email address of the authenticated user.

Below is an example Docker Compose file that sets up a Cloudflare sidecar. Configuration is done via the dashboard. From the dashboard, get a tunnel token, set the tunnel backend to http://open-webui:8080, and ensure that "Protect with Access" is checked and configured.

oauth2-proxy is an authenticating reverse proxy that implements social OAuth providers and OIDC support.

Given the large number of potential configurations, below is an example of a potential setup with Google OAuth. Please refer to oauth2-proxy's documentation for detailed setup and any potential security gotchas.

To configure a Authentik OAuth client, please refer to documentation on how to create an application and OAuth2/OpenID Provider. The allowed redirect URI should include <open-webui>/oauth/oidc/callback.

While creating provider, please note App-name, Client-ID and Client-Secret and use it for open-webui environment variables:

Authelia can be configured to return a header for use with trusted header authentication. Documentation is available here.

No example configs are provided due to the complexity of deploying Authelia.

**Examples:**

Example 1 (json):
```json
{    "TCP": {        "443": {            "HTTPS": true        }    },    "Web": {        "${TS_CERT_DOMAIN}:443": {            "Handlers": {                "/": {                    "Proxy": "http://open-webui:8080"                }            }        }    }}
```

Example 2 (yaml):
```yaml
---services:  open-webui:    image: ghcr.io/open-webui/open-webui:main    volumes:      - open-webui:/app/backend/data    environment:      - WEBUI_AUTH_TRUSTED_EMAIL_HEADER=Tailscale-User-Login      - WEBUI_AUTH_TRUSTED_NAME_HEADER=Tailscale-User-Name    restart: unless-stopped  tailscale:    image: tailscale/tailscale:latest    environment:      - TS_AUTH_ONCE=true      - TS_AUTHKEY=${TS_AUTHKEY}      - TS_EXTRA_ARGS=--advertise-tags=tag:open-webui      - TS_SERVE_CONFIG=/config/serve.json      - TS_STATE_DIR=/var/lib/tailscale      - TS_HOSTNAME=open-webui    volumes:      - tailscale:/var/lib/tailscale      - ./tailscale:/config      - /dev/net/tun:/dev/net/tun    cap_add:      - net_admin      - sys_module    restart: unless-stoppedvolumes:  open-webui: {}  tailscale: {}
```

Example 3 (yaml):
```yaml
---services:  open-webui:    image: ghcr.io/open-webui/open-webui:main    volumes:      - open-webui:/app/backend/data    environment:      - WEBUI_AUTH_TRUSTED_EMAIL_HEADER=Cf-Access-Authenticated-User-Email    restart: unless-stopped  cloudflared:    image: cloudflare/cloudflared:latest    environment:      - TUNNEL_TOKEN=${TUNNEL_TOKEN}    command: tunnel run    restart: unless-stoppedvolumes:  open-webui: {}
```

Example 4 (yaml):
```yaml
services:  open-webui:    image: ghcr.io/open-webui/open-webui:main    volumes:      - open-webui:/app/backend/data    environment:      - 'WEBUI_AUTH_TRUSTED_EMAIL_HEADER=X-Forwarded-Email'      - 'WEBUI_AUTH_TRUSTED_NAME_HEADER=X-Forwarded-User'    restart: unless-stopped  oauth2-proxy:    image: quay.io/oauth2-proxy/oauth2-proxy:v7.6.0    environment:      OAUTH2_PROXY_HTTP_ADDRESS: 0.0.0.0:4180      OAUTH2_PROXY_UPSTREAMS: http://open-webui:8080/      OAUTH2_PROXY_PROVIDER: google      OAUTH2_PROXY_CLIENT_ID: REPLACEME_OAUTH_CLIENT_ID      OAUTH2_PROXY_CLIENT_SECRET: REPLACEME_OAUTH_CLIENT_ID      OAUTH2_PROXY_EMAIL_DOMAINS: REPLACEME_ALLOWED_EMAIL_DOMAINS      OAUTH2_PROXY_REDIRECT_URL: REPLACEME_OAUTH_CALLBACK_URL      OAUTH2_PROXY_COOKIE_SECRET: REPLACEME_COOKIE_SECRET      OAUTH2_PROXY_COOKIE_SECURE: "false"    restart: unless-stopped    ports:      - 4180:4180/tcp
```

---

## Tavily

**URL:** https://docs.openwebui.com/features/web-search/tavily

**Contents:**
- Tavily
- Overview​
- Prerequisites​
- Step-by-Step Configuration​
  - 1. Obtain a Tavily API Key​
  - 2. Configure Open WebUI​
  - 3. Test the Integration​
- Optional Configurations​
- Troubleshooting​
- Additional Resources​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

Integrating Tavily with Open WebUI allows your language model to perform real-time web searches, providing up-to-date and relevant information. This tutorial guides you through configuring Tavily as a web search provider in Open WebUI.

Tavily is a search API optimized for AI applications, delivering curated and structured results. By following these steps, you can enable Open WebUI to leverage Tavily for web searches within the chat interface.

Note: Check your Tavily plan’s query limits at Tavily Pricing.

Tip: Verify your API key is correct to avoid configuration errors.

Example: +latest AI news triggers a Tavily search, embedding results in the response.

Search Parameters: Explore advanced options (e.g., domain filtering) in the Tavily API Documentation.

Environment Variables: Set the TAVILY_API_KEY in your .env file or Docker command:

See Environment Variable Configuration.

RAG Integration: Combine Tavily results with local data using Retrieval Augmented Generation. Refer to RAG Documentation.

For further help, visit the Open WebUI Community or Tavily Support.

By completing this tutorial, you’ve enabled Tavily web search in Open WebUI, enhancing your AI with real-time data. Happy searching!

**Examples:**

Example 1 (bash):
```bash
-e TAVILY_API_KEY="your_tavily_api_key"
```

---

## URL Parameters

**URL:** https://docs.openwebui.com/features/chat-features/url-params

**Contents:**
- URL Parameters
- URL Parameter Overview​
  - 1. Models and Model Selection​
  - 2. YouTube Transcription​
  - 3. Website Insertion​
  - 4. Web Search​
  - 5. Tool Selection​
  - 6. Call Overlay​
  - 7. Initial Query Prompt​
  - 8. Temporary Chat Sessions​

In Open WebUI, chat sessions can be customized through various URL parameters. These parameters allow you to set specific configurations, enable features, and define model settings on a per-chat basis. This approach provides flexibility and control over individual chat sessions directly from the URL.

The following table lists the available URL parameters, their function, and example usage.

Temporary Chat Session Suppose a user wants to initiate a quick chat session without saving the history. They can do so by setting temporary-chat=true in the URL. This provides a disposable chat environment ideal for one-time interactions.

These URL parameters can be combined to create highly customized chat sessions. For example:

**Examples:**

Example 1 (bash):
```bash
/?models=model1,model2&youtube=VIDEO_ID&web-search=true&tools=tool1,tool2&call=true&q=Hello%20there&temporary-chat=true
```

---

## Valves

**URL:** https://docs.openwebui.com/features/plugin/development/valves

**Contents:**
- Valves
- Valves​

Valves and UserValves are used to allow users to provide dynamic details such as an API key or a configuration option. These will create a fillable field or a bool switch in the GUI menu for the given function. They are always optional, but HIGHLY encouraged.

Hence, Valves and UserValves class can be defined in either a Pipe, Pipeline, Filter or Tools class.

Valves are configurable by admins alone via the Tools or Functions menus. On the other hand UserValves are configurable by any users directly from a chat session.

**Examples:**

Example 1 (python):
```python
from pydantic import BaseModel, Fieldfrom typing import Literal# Define and Valvesclass Filter:   # Notice the current indentation: Valves and UserValves must be declared as   # attributes of a Tools, Filter or Pipe class. Here we take the   # example of a Filter.    class Valves(BaseModel):       # Valves and UserValves inherit from pydantic's BaseModel. This       # enables complex use cases like model validators etc.       test_valve: int = Field(  # Notice the type hint: it is used to           # choose the kind of UI element to show the user (buttons,           # texts, etc).           default=4,           description="A valve controlling a numberical value"           # required=False,  # you can enforce fields using True       )       # To give the user the choice between multiple strings, you can use Literal from typing:       choice_option: Literal["choiceA", "choiceB"] = Field(           default="choiceA",           description="An example of a multi choice valve",       )       priority: int = Field(           default=0,           description="Priority level for the filter operations. Lower values are passed through first"       )       # The priority field is optional but if present will be used to       # order the Filters.       pass       # Note that this 'pass' helps for parsing and is recommended.   # UserValves are defined the same way.    class UserValves(BaseModel):        test_user_valve: bool = Field(            default=False, description="A user valve controlling a True/False (on/off) switch"       )       pass   def __init__(self):       self.valves = self.Valves()       # Because they are set by the admin, they are accessible directly       # upon code execution.       pass   # The inlet method is only used for Filter but the __user__ handling is the same   def inlet(self, body: dict, __user__: dict):       # Because UserValves are defined per user they are only available       # on use.       # Note that although __user__ is a dict, __user__["valves"] is a       # UserValves object. Hence you can access values like that:       test_user_valve = __user__["valves"].test_user_valve       # Or:       test_user_valve = dict(__user__["valves"])["test_user_valve"]       # But this will return the default value instead of the actual value:       # test_user_valve = __user__["valves"]["test_user_valve"]  # Do not do that!
```

---

## Workspace

**URL:** https://docs.openwebui.com/features/workspace/

**Contents:**
- Workspace
- Resources​

The Workspace in Open WebUI provides a comprehensive environment for managing your AI interactions and configurations. It consists of several key components:

Each section of the Workspace is designed to give you fine-grained control over your Open WebUI experience, allowing for customization and optimization of your AI interactions.

---

## Yacy

**URL:** https://docs.openwebui.com/features/web-search/yacy

**Contents:**
- Yacy
- Yacy API​
  - Setup​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

For a comprehensive list of all environment variables related to Web Search (including concurrency settings, result counts, and more), please refer to the Environment Configuration documentation.

Navigate to: Admin Panel -> Settings -> Web Search

Toggle Enable Web Search

Set Web Search Engine from dropdown menu to yacy

Set Yacy Instance URL to one of the following examples:

Optionally, enter your Yacy username and password if authentication is required for your Yacy instance. If both are left blank, digest authentication will be skipped

---

## ✨ Autocomplete

**URL:** https://docs.openwebui.com/features/chat-features/autocomplete

**Contents:**
- ✨ Autocomplete
- How It Works​
- Configuration​
  - 1. Global Configuration (Admin)​
  - 1. Configuring Autocomplete (Global)​
  - 2. User Configuration (Personal)​
- Performance & Troubleshooting​
  - Why aren't suggestions appearing?​
  - Performance Impact​

Open WebUI offers an AI-powered Autocomplete feature that suggests text completions in real-time as you type your prompt. It acts like a "Copilot" for your chat input, helping you craft prompts faster using your configured task model.

When enabled, Open WebUI monitors your input in the chat box. When you pause typing, it sends your current text to a lightweight Task Model. This model predicts the likely next words or sentences, which appear as "ghost text" overlaying your input.

Performance Recommendation

Autocomplete functionality relies heavily on the response speed of your Task Model. We recommend using a small, fast, non-reasoning model to ensure suggestions appear instantly.

Avoid using "Reasoning" models (e.g., o1, o3) or heavy Chain-of-Thought models for this feature, as the latency will make the autocomplete experience sluggish.

The Autocomplete feature is controlled by a two-layer system: Global availability and User preference.

Admins control whether the autocomplete feature is available on the server.

Admin Panel Settings: Go to Admin Settings > Interface > Task Model and toggle Autocomplete Generation.

Even if enabled globally, individual users can turn it off for themselves if they find it distracting.

If the Admin has disabled Autocomplete globally, users will not be able to enable it in their personal settings.

Autocomplete sends a request to your LLM essentially every time you pause typing (debounced).

For multi-user instances running on limited local hardware, we recommend disabling Autocomplete to prioritize resources for actual chat generation.

---

## 🔔 Events: Using __event_emitter__ and __event_call__ in Open WebUI

**URL:** https://docs.openwebui.com/features/plugin/development/events

**Contents:**
- 🔔 Events: Using __event_emitter__ and __event_call__ in Open WebUI
- 🌊 What Are Events?​
- 🧰 Basic Usage​
  - Sending an Event​
  - Interactive Events​
- 📜 Event Payload Structure​
- 🗂 Full List of Event Types​
  - ❗ Details on Specific Event Types​
  - status​
  - chat:message:delta or message​

Open WebUI's plugin architecture is not just about processing input and producing output—it's about real-time, interactive communication with the UI and users. To make your Tools, Functions, and Pipes more dynamic, Open WebUI provides a built-in event system via the __event_emitter__ and __event_call__ helpers.

This guide explains what events are, how you can trigger them from your code, and the full catalog of event types you can use (including much more than just "input").

Events are real-time notifications or interactive requests sent from your backend code (Tool, or Function) to the web UI. They allow you to update the chat, display notifications, request confirmation, run UI flows, and more.

Metaphor: Think of Events like push notifications and modal dialogs that your plugin can trigger, making the chat experience richer and more interactive.

You can trigger an event anywhere inside your Tool, or Function by calling:

You do not need to manually add fields like chat_id or message_id—these are handled automatically by Open WebUI.

When you need to pause execution until the user responds (e.g., confirm/cancel dialogs, code execution, or input), use __event_call__:

When you emit or call an event, the basic structure is:

Most of the time, you only set "type" and "data". Open WebUI fills in the routing automatically.

Below is a comprehensive table of all supported type values for events, along with their intended effect and data structure. (This is based on up-to-date analysis of Open WebUI event handling logic.)

Other/Advanced types:

Show a status/progress update in the UI:

Streaming output (append text):

Set (or replace) the entire message content:

Attach or update files:

Update the chat's title:

Update the chat's tags:

Add a reference/citation:

For code execution (track execution state):

Show a toast notification:

Show a confirm dialog and get user response:

Prompt user for text input:

Run code dynamically on the user's side:

Use notification type:

Yes—use the "files" or "chat:message:files" event type with a {files: [...]} payload.

Absolutely: use "chat:title" or "chat:tags" accordingly.

Yes—emit "chat:message:delta" events in a loop, then finish with "chat:message".

Events give you real-time, interactive superpowers inside Open WebUI. They let your code update content, trigger notifications, request user input, stream results, handle code, and much more—seamlessly plugging your backend intelligence into the chat UI.

Refer to this document for common event types and structures, and explore Open WebUI source code or docs for breaking updates or custom events!

Happy event-driven coding in Open WebUI! 🚀

**Examples:**

Example 1 (python):
```python
await __event_emitter__(    {        "type": "status",  # See the event types list below        "data": {            "description": "Processing started!",            "done": False,            "hidden": False,        },    })
```

Example 2 (python):
```python
result = await __event_call__(    {        "type": "input",  # Or "confirmation", "execute"        "data": {            "title": "Please enter your password",            "message": "Password is required for this action",            "placeholder": "Your password here",        },    })# result will contain the user's input value
```

Example 3 (json):
```json
{  "type": "event_type",   // See full list below  "data": { ... }         // Event-specific payload}
```

Example 4 (python):
```python
await __event_emitter__(    {        "type": "status",        "data": {            "description": "Step 1/3: Fetching data...",            "done": False,            "hidden": False,        },    })
```

---

## ⭐ Features

**URL:** https://docs.openwebui.com/features/

**Contents:**
- ⭐ Features
- Key Features of Open WebUI ⭐​
- And many more remarkable features including... ⚡️​
  - 🔧 Pipelines Support​
    - The possibilities with our Pipelines framework knows no bounds and are practically limitless. Start with a few pre-built pipelines to help you get started!​
    - In addition to the extensive features and customization options, we also provide a library of example pipelines ready to use along with a practical example scaffold pipeline to help you get started. These resources will streamline your development process and enable you to quickly create powerful LLM interactions using Pipelines and Python. Happy coding! 💡​
  - 🖥️ User Experience​
  - 💬 Conversations​
  - 💻 Model Management​
  - 👥 Collaboration​

We are hiring! Shape the way humanity engages with intelligence.

🚀 Effortless Setup: Install seamlessly using Docker, Kubernetes, Podman, Helm Charts (kubectl, kustomize, podman, or helm) for a hassle-free experience with support for both :ollama image with bundled Ollama and :cuda with CUDA support.

🛠️ Guided Initial Setup: Complete the setup process with clarity, including an explicit indication of creating an admin account during the first-time setup.

🤝 OpenAI API Integration: Effortlessly integrate OpenAI-compatible APIs for versatile conversations alongside Ollama models. The OpenAI API URL can be customized to integrate Open WebUI seamlessly with various third-party applications.

🛡️ Granular Permissions and User Groups: By allowing administrators to create detailed user roles, user groups, and permissions across the workspace, we ensure a secure user environment for all users involved. This granularity not only enhances security, but also allows for customized user experiences, fostering a sense of ownership and responsibility amongst users.

🔐 SCIM 2.0 Provisioning: Enterprise-grade user and group provisioning through SCIM 2.0 protocol, enabling seamless integration with identity providers like Okta, Azure AD, and Google Workspace for automated user lifecycle management.

📱 Responsive Design: Enjoy a seamless experience across desktop PCs, laptops, and mobile devices.

📱 Progressive Web App for Mobile: Enjoy a native progressive web application experience on your mobile device with offline access on localhost or a personal domain, and a smooth user interface. In order for our PWA to be installable on your device, it must be delivered in a secure context. This usually means that it must be served over HTTPS.

✒️🔢 Full Markdown and LaTeX Support: Elevate your LLM experience with comprehensive Markdown, LaTex, and Rich Text capabilities for enriched interaction.

🧩 Model Builder: Easily create custom models from base Ollama models directly from Open WebUI. Create and add custom characters and agents, customize model elements, and import models effortlessly through Open WebUI Community integration.

📚 Advanced RAG Integration with Multiple Vector Databases: Dive into the future of chat interactions with cutting-edge Retrieval Augmented Generation (RAG) technology. Choose from 9 vector database options: ChromaDB (default), PostgreSQL with PGVector, Qdrant, Milvus, Elasticsearch, OpenSearch, Pinecone, S3Vector, and Oracle 23ai. Documents can be loaded into the Documents tab of the Workspace and accessed using the pound key [#] before a query, or by starting the prompt with [#] followed by a URL for webpage content integration.

📄 Advanced Document Extraction with Multiple Engines: Extract text and data from various document formats including PDFs, Word documents, Excel spreadsheets, PowerPoint presentations, and more using your choice of extraction engines: Apache Tika, Docling, Azure Document Intelligence, Mistral OCR, or external custom (self-built) content extraction engines/document loaders. Advanced document processing capabilities enable seamless integration with your knowledge base, preserving structure and formatting while supporting OCR for scanned documents and images.

🔍 Web Search for RAG with 15+ Providers: Perform web searches using 15+ providers including SearXNG, Google PSE, Brave Search, Kagi, Mojeek, Bocha, Tavily, Perplexity (AI models and Search API), serpstack, serper, Serply, DuckDuckGo, SearchAPI, SerpApi, Bing, Jina, Exa, Sougou, Azure AI Search, and Ollama Cloud, injecting results directly into your local Retrieval Augmented Generation (RAG) experience.

🌐 Web Browsing Capabilities: Integrate websites seamlessly into your chat experience by using the # command followed by a URL. This feature enables the incorporation of web content directly into your conversations, thereby enhancing the richness and depth of your interactions.

🎨 Image Generation & Editing Integration: Seamlessly create and edit images using multiple engines including OpenAI's DALL-E (generation and editing), Gemini (generation and editing), ComfyUI (local, generation and editing), and AUTOMATIC1111 (local, generation). Support for both text-to-image generation and prompt-based image editing workflows with dynamic visual content.

⚙️ Concurrent Model Utilization: Effortlessly engage with multiple models simultaneously, harnessing their unique strengths for optimal responses. Leverage a diverse set of model modalities in parallel to enhance your experience.

🔐 Role-Based Access Control (RBAC): Ensure secure access with restricted permissions. Only authorized individuals can access your Ollama, while model creation and pulling rights are exclusively reserved for administrators.

🌐🌍 Multilingual Support: Experience Open WebUI in your preferred language with our internationalization (i18n) support. We invite you to join us in expanding our supported languages! We're actively seeking contributors!

💾 Persistent Artifact Storage: Built-in key-value storage API for artifacts, enabling features like journals, trackers, leaderboards, and collaborative tools with both personal and shared data scopes that persist across sessions.

☁️ Cloud Storage Integration: Native support for cloud storage backends including Amazon S3 (with S3-compatible providers), Google Cloud Storage, and Microsoft Azure Blob Storage for scalable file storage and data management.

☁️ Enterprise Cloud Integration: Seamlessly import documents from Google Drive and OneDrive/SharePoint directly through the file picker interface, enabling smooth workflows with enterprise cloud storage solutions.

📊 Production Observability with OpenTelemetry: Built-in OpenTelemetry support for comprehensive monitoring with traces, metrics, and logs export to your existing observability stack (Prometheus, Grafana, Jaeger, etc.), enabling production-grade monitoring and debugging.

🔒 Encrypted Database Support: Optional at-rest encryption for SQLite databases using SQLCipher, providing enhanced security for sensitive data in smaller deployments without requiring PostgreSQL infrastructure.

⚖️ Horizontal Scalability for Production: Redis-backed session management and WebSocket support enabling multi-worker and multi-node deployments behind load balancers for high-availability production environments.

🌟 Continuous Updates: We are committed to improving Open WebUI with regular updates, fixes, and new features.

🔧 Pipelines Framework: Seamlessly integrate and customize your Open WebUI experience with our modular plugin framework for enhanced customization and functionality (https://github.com/open-webui/pipelines). Our framework allows for the easy addition of custom logic and integration of Python libraries, from AI agents to home automation APIs.

📥 Upload Pipeline: Pipelines can be uploaded directly from the Admin Panel > Settings > Pipelines menu, streamlining the pipeline management process.

🔗 Function Calling: Integrate Function Calling seamlessly through Pipelines to enhance your LLM interactions with advanced function calling capabilities.

📚 Custom RAG: Integrate a custom Retrieval Augmented Generation (RAG) pipeline seamlessly to enhance your LLM interactions with custom RAG logic.

📊 Message Monitoring with Langfuse: Monitor and analyze message interactions in real-time usage statistics via Langfuse pipeline.

⚖️ User Rate Limiting: Manage API usage efficiently by controlling the flow of requests sent to LLMs to prevent exceeding rate limits with Rate Limit pipeline.

🌍 Real-Time LibreTranslate Translation: Integrate real-time translations into your LLM interactions using LibreTranslate pipeline, enabling cross-lingual communication.

🛡️ Toxic Message Filtering: Our Detoxify pipeline automatically filters out toxic messages to maintain a clean and safe chat environment.

🔒 LLM-Guard: Ensure secure LLM interactions with LLM-Guard pipeline, featuring a Prompt Injection Scanner that detects and mitigates crafty input manipulations targeting large language models. This protects your LLMs from data leakage and adds a layer of resistance against prompt injection attacks.

🕒 Conversation Turn Limits: Improve interaction management by setting limits on conversation turns with Conversation Turn Limit pipeline.

📈 OpenAI Generation Stats: Our OpenAI pipeline provides detailed generation statistics for OpenAI models.

🚀 Multi-Model Support: Our seamless integration with various AI models from various providers expands your possibilities with a wide range of language models to select from and interact with.

🖥️ Intuitive Interface: The chat interface has been designed with the user in mind, drawing inspiration from the user interface of ChatGPT.

⚡ Swift Responsiveness: Enjoy reliably fast and responsive performance.

🎨 Splash Screen: A simple loading splash screen for a smoother user experience.

🌐 Personalized Interface: Choose between a freshly designed search landing page and the classic chat UI from Settings > Interface, allowing for a tailored experience.

📦 Pip Install Method: Installation of Open WebUI can be accomplished via the command pip install open-webui, which streamlines the process and makes it more accessible to new users. For further information, please visit: https://pypi.org/project/open-webui/.

🌈 Theme Customization: Personalize your Open WebUI experience with a range of options, including a variety of solid, yet sleek themes, customizable chat background images, and three mode options: Light, Dark, or OLED Dark mode - or let Her choose for you! ;)

🖼️ Custom Background Support: Set a custom background from Settings > Interface to personalize your experience.

📝 Rich Banners with Markdown: Create visually engaging announcements with markdown support in banners, enabling richer and more dynamic content.

💻 Code Syntax Highlighting: Our syntax highlighting feature enhances code readability, providing a clear and concise view of your code.

🗨️ Markdown Rendering in User Messages: User messages are now rendered in Markdown, enhancing readability and interaction.

🎨 Flexible Text Input Options: Switch between rich text input and legacy text area input for chat, catering to user preferences and providing a choice between advanced formatting and simpler text input.

👆 Effortless Code Sharing : Streamline the sharing and collaboration process with convenient code copying options, including a floating copy button in code blocks and click-to-copy functionality from code spans, saving time and reducing frustration.

🎨 Interactive Artifacts: Render web content and SVGs directly in the interface, supporting quick iterations and live changes for enhanced creativity and productivity.

🖊️ Live Code Editing: Supercharged code blocks allow live editing directly in the LLM response, with live reloads supported by artifacts, streamlining coding and testing.

🔍 Enhanced SVG Interaction: Pan and zoom capabilities for SVG images, including Mermaid diagrams, enable deeper exploration and understanding of complex concepts.

🔍 Text Select Quick Actions: Floating buttons appear when text is highlighted in LLM responses, offering deeper interactions like "Ask a Question" or "Explain", and enhancing overall user experience.

↕️ Bi-Directional Chat Support: You can easily switch between left-to-right and right-to-left chat directions to accommodate various language preferences.

📱 Mobile Accessibility: The sidebar can be opened and closed on mobile devices with a simple swipe gesture.

🤳 Haptic Feedback on Supported Devices: Android devices support haptic feedback for an immersive tactile experience during certain interactions.

🔍 User Settings Search: Quickly search for settings fields, improving ease of use and navigation.

📜 Offline Swagger Documentation: Access developer-friendly Swagger API documentation offline, ensuring full accessibility wherever you are.

💾 Performance Optimizations: Lazy loading of large dependencies minimizes initial memory usage, boosting performance and reducing loading times.

🚀 Persistent and Scalable Configuration: Open WebUI configurations are stored in a database (webui.db), allowing for seamless load balancing, high-availability setups, and persistent settings across multiple instances, making it easy to access and reuse your configurations.

🔄 Portable Import/Export: Easily import and export Open WebUI configurations, simplifying the process of replicating settings across multiple systems.

❓ Quick Access to Documentation & Shortcuts: The question mark button located at the bottom right-hand corner of the main UI screen (available on larger screens like desktop PCs and laptops) provides users with easy access to the Open WebUI documentation page and available keyboard shortcuts.

📜 Changelog & Check for Updates: Users can access a comprehensive changelog and check for updates in the Settings > About > See What's New menu, which provides a quick overview of the latest features, improvements, and bug fixes, as well as the ability to check for updates.

💬 True Asynchronous Chat: Enjoy uninterrupted multitasking with true asynchronous chat support, allowing you to create chats, navigate away, and return anytime with responses ready.

🔔 Chat Completion Notifications: Stay updated with instant in-UI notifications when a chat finishes in a non-active tab, ensuring you never miss a completed response.

🌐 Notification Webhook Integration: Receive timely updates for long-running chats or external integration needs with configurable webhook notifications, even when your tab is closed.

📚 Channels (Beta): Explore real-time collaboration between users and AIs with Discord/Slack-style chat rooms, build bots for channels, and unlock asynchronous communication for proactive multi-agent workflows.

🖊️ Typing Indicators in Channels: Enhance collaboration with real-time typing indicators in channels, keeping everyone engaged and informed.

👤 User Status Indicators: Quickly view a user's status by clicking their profile image in channels, providing better coordination and availability insights.

💬 Chat Controls: Easily adjust parameters for each chat session, offering more precise control over your interactions.

💖 Favorite Response Management: Easily mark and organize favorite responses directly from the chat overview, enhancing ease of retrieval and access to preferred responses.

📌 Pinned Chats: Support for pinned chats, allowing you to keep important conversations easily accessible.

🔍 RAG Embedding Support: Change the Retrieval Augmented Generation (RAG) embedding model directly in the Admin Panel > Settings > Documents menu, enhancing document processing. This feature supports Ollama and OpenAI models.

📜 Citations in RAG Feature: The Retrieval Augmented Generation (RAG) feature allows users to easily track the context of documents fed to LLMs with added citations for reference points.

🌟 Enhanced RAG Pipeline: A togglable hybrid search sub-feature for our RAG embedding feature that enhances the RAG functionality via BM25, with re-ranking powered by CrossEncoder, and configurable relevance score thresholds.

📹 YouTube RAG Pipeline: The dedicated Retrieval Augmented Generation (RAG) pipeline for summarizing YouTube videos via video URLs enables smooth interaction with video transcriptions directly.

📁 Comprehensive Document Retrieval: Toggle between full document retrieval and traditional snippets, enabling comprehensive tasks like summarization and supporting enhanced document capabilities.

🌟 RAG Citation Relevance: Easily assess citation accuracy with the addition of relevance percentages in RAG results.

🗂️ Advanced RAG: Improve RAG accuracy with smart pre-processing of chat history to determine the best queries before retrieval.

📚 Inline Citations for RAG: Benefit from seamless inline citations for Retrieval-Augmented Generation (RAG) responses, improving traceability and providing source clarity for newly uploaded files.

📁 Large Text Handling: Optionally convert large pasted text into a file upload to be used directly with RAG, keeping the chat interface cleaner.

🔄 Multi-Modal Support: Effortlessly engage with models that support multi-modal interactions, including images (e.g., LLaVA).

🤖 Multiple Model Support: Quickly switch between different models for diverse chat interactions.

🔀 Merge Responses in Many Model Chat: Enhances the dialogue by merging responses from multiple models into a single, coherent reply.

✅ Multiple Instances of Same Model in Chats: Enhanced many model chat to support adding multiple instances of the same model.

💬 Temporary Chat Feature: Introduced a temporary chat feature, deprecating the old chat history setting to enhance user interaction flexibility. Please note that document processing in temporary chats is performed entirely in the browser to ensure privacy and data minimization. This means specific file types requiring backend processing (like complex DOCX parsing) may have limited functionality in temporary mode.

🖋️ User Message Editing: Enhanced the user chat editing feature to allow saving changes without sending.

💬 Efficient Conversation Editing: Create new message pairs quickly and intuitively using the Cmd/Ctrl+Shift+Enter shortcut, streamlining conversation length tests.

🖼️ Client-Side Image Compression: Save bandwidth and improve performance with client-side image compression, allowing you to compress images before upload from Settings > Interface.

👥 '@' Model Integration: By seamlessly switching to any accessible local or external model during conversations, users can harness the collective intelligence of multiple models in a single chat. This can done by using the @ command to specify the model by name within a chat.

🏷️ Conversation Tagging : Effortlessly categorize and locate tagged chats for quick reference and streamlined data collection using our efficient 'tag:' query system, allowing you to manage, search, and organize your conversations without cluttering the interface.

🧠 Auto-Tagging: Conversations can optionally be automatically tagged for improved organization, mirroring the efficiency of auto-generated titles.

👶 Chat Cloning: Easily clone and save a snapshot of any chat for future reference or continuation. This feature makes it easy to pick up where you left off or share your session with others. To create a copy of your chat, simply click on the Clone button in the chat's dropdown options. Can you keep up with your clones?

⭐ Visualized Conversation Flows: Interactive messages diagram for improved visualization of conversation flows, enhancing understanding and navigation of complex discussions.

📁 Chat Folders: Organize your chats into folders, drag and drop them for easy management, and export them seamlessly for sharing or analysis.

📤 Easy Chat Import: Import chats into your workspace by simply dragging and dropping chat exports (JSON) onto the sidebar.

📜 Prompt Preset Support: Instantly access custom preset prompts using the / command in the chat input. Load predefined conversation starters effortlessly and expedite your interactions. Import prompts with ease through Open WebUI Community integration or create your own!

📅 Prompt Variables Support: Prompt variables such as {{CLIPBOARD}}, {{CURRENT_DATE}}, {{CURRENT_DATETIME}}, {{CURRENT_TIME}}, {{CURRENT_TIMEZONE}}, {{CURRENT_WEEKDAY}}, {{USER_NAME}}, {{USER_LANGUAGE}}, and {{USER_LOCATION}} can be utilized in the system prompt or by using a slash command to select a prompt directly within a chat.

🧠 Memory Feature: Manually add information you want your LLMs to remember via the Settings > Personalization > Memory menu. Memories can be added, edited, and deleted.

🛠️ Model Builder: All models can be built and edited with a persistent model builder mode within the models edit page.

📚 Knowledge Support for Models: The ability to attach tools, functions, and knowledge collections directly to models from a model's edit page, enhancing the information available to each model.

🗂️ Model Presets: Create and manage model presets for both the Ollama and OpenAI API.

🏷️ Model Tagging: The models workspace enables users to organize their models using tagging.

📋 Model Selector Dropdown Ordering: Models can be effortlessly organized by dragging and dropping them into desired positions within the model workspace, which will then reflect the changes in the model dropdown menu.

🔍 Model Selector Dropdown: Easily find and select your models with fuzzy search and detailed model information with model tags and model descriptions.

⌨️ Arrow Keys Model Selection: Use arrow keys for quicker model selection, enhancing accessibility.

🔧 Quick Actions in Model Workspace: Enhanced Shift key quick actions for hiding/displaying and deleting models in the model workspace.

😄 Transparent Model Usage: Stay informed about the system's state during queries with knowledge-augmented models, thanks to visible status displays.

⚙️ Fine-Tuned Control with Advanced Parameters: Gain a deeper level of control by adjusting model parameters such as seed, temperature, frequency penalty, context length, seed, and more.

🔄 Seamless Integration: Copy any ollama run {model:tag} CLI command directly from a model's page on Ollama library and paste it into the model dropdown to easily select and pull models.

🗂️ Create Ollama Modelfile: To create a model file for Ollama, navigate to the Admin Panel > Settings > Models > Create a model menu.

⬆️ GGUF File Model Creation: Effortlessly create Ollama models by uploading GGUF files directly from Open WebUI from the Admin Settings > Settings > Model > Experimental menu. The process has been streamlined with the option to upload from your machine or download GGUF files from Hugging Face.

⚙️ Default Model Setting: The default model preference for new chats can be set in the Settings > Interface menu on mobile devices, or can more easily be set in a new chat under the model selector dropdown on desktop PCs and laptops.

💡 LLM Response Insights: Details of every generated response can be viewed, including external model API insights and comprehensive local model info.

🕒 Model Details at a Glance: View critical model details, including model hash and last modified timestamp, directly in the Models workspace for enhanced tracking and management.

📥🗑️ Download/Delete Models: Models can be downloaded or deleted directly from Open WebUI with ease.

🔄 Update All Ollama Models: A convenient button allows users to update all their locally installed models in one operation, streamlining model management.

🍻 TavernAI Character Card Integration: Experience enhanced visual storytelling with TavernAI Character Card Integration in our model builder. Users can seamlessly incorporate TavernAI character card PNGs directly into their model files, creating a more immersive and engaging user experience.

🎲 Model Playground (Beta): Try out models with the model playground area (beta), which enables users to test and explore model capabilities and parameters with ease in a sandbox environment before deployment in a live chat environment.

🗨️ Local Chat Sharing: Generate and share chat links between users in an efficient and seamless manner, thereby enhancing collaboration and communication.

👍👎 RLHF Annotation: Enhance the impact of your messages by rating them with either a thumbs up or thumbs down AMD provide a rating for the response on a scale of 1-10, followed by the option to provide textual feedback, facilitating the creation of datasets for Reinforcement Learning from Human Feedback (RLHF). Utilize your messages to train or fine-tune models, all while ensuring the confidentiality of locally saved data.

🔧 Comprehensive Feedback Export: Export feedback history data to JSON for seamless integration with RLHF processing and further analysis, providing valuable insights for improvement.

🤝 Community Sharing: Share your chat sessions with the Open WebUI Community by clicking the Share to Open WebUI Community button. This feature allows you to engage with other users and collaborate on the platform.

🏆 Community Leaderboard: Compete and track your performance in real-time with our leaderboard system, which utilizes the ELO rating system and allows for optional sharing of feedback history.

⚔️ Model Evaluation Arena: Conduct blind A/B testing of models directly from the Admin Settings for a true side-by-side comparison, making it easier to find the best model for your needs.

🎯 Topic-Based Rankings: Discover more accurate rankings with our experimental topic-based re-ranking system, which adjusts leaderboard standings based on tag similarity in feedback.

📂 Unified and Collaborative Workspace : Access and manage all your model files, prompts, documents, tools, and functions in one convenient location, while also enabling multiple users to collaborate and contribute to models, knowledge, prompts, or tools, streamlining your workflow and enhancing teamwork.

📜 Chat History: Access and manage your conversation history with ease via the chat navigation sidebar. Toggle off chat history in the Settings > Chats menu to prevent chat history from being created with new interactions.

🔄 Regeneration History Access: Easily revisit and explore your entire LLM response regeneration history.

📬 Archive Chats: Effortlessly store away completed conversations you've had with models for future reference or interaction, maintaining a tidy and clutter-free chat interface.

🗃️ Archive All Chats: This feature allows you to quickly archive all of your chats at once.

📦 Export All Archived Chats as JSON: This feature enables users to easily export all their archived chats in a single JSON file, which can be used for backup or transfer purposes.

📄 Download Chats as JSON/PDF/TXT: Easily download your chats individually in your preferred format of .json, .pdf, or .txt format.

📤📥 Import/Export Chat History: Seamlessly move your chat data in and out of the platform via Import Chats and Export Chats options.

🗑️ Delete All Chats: This option allows you to permanently delete all of your chats, ensuring a fresh start.

🗣️ Voice Input Support with Multiple Providers: Engage with your model through voice interactions using multiple Speech-to-Text providers: Local Whisper (default, with VAD filtering), OpenAI-compatible endpoints, Deepgram, and Azure Speech Services. Enjoy the convenience of talking to your model directly with automatic voice input after 3 seconds of silence for a streamlined experience.

😊 Emoji Call: Toggle this feature on from the Settings > Interface menu, allowing LLMs to express emotions using emojis during voice calls for a more dynamic interaction.

🎙️ Hands-Free Voice Call Feature: Initiate voice calls without needing to use your hands, making interactions more seamless.

📹 Video Call Feature: Enable video calls with supported vision models like LlaVA and GPT-4o, adding a visual dimension to your communications.

👆 Tap to Interrupt: Stop the AI’s speech during voice conversations with a simple tap on mobile devices, ensuring seamless control over the interaction.

🎙️ Voice Interrupt: Stop the AI’s speech during voice conversations with your voice on mobile devices, ensuring seamless control over the interaction.

🔊 Multiple Text-to-Speech Providers: Customize your Text-to-Speech experience with multiple providers: OpenAI-compatible endpoints, Azure Speech Services, ElevenLabs (with EU residency support), local Transformers models, and browser-based WebAPI for reading aloud LLM responses.

🔗 Direct Call Mode Access: Activate call mode directly from a URL, providing a convenient shortcut for mobile device users.

✨ Customizable Text-to-Speech: Control how message content is segmented for Text-to-Speech (TTS) generation requests, allowing for flexible speech output options.

🔊 Azure Speech Services Integration: Supports Azure Speech services for Text-to-Speech (TTS), providing users with a wider range of speech synthesis options.

🎚️ Customizable Audio Playback: Allows users to adjust audio playback speed to their preferences in Call mode settings, enhancing accessibility and usability.

🎵 Broad Audio Compatibility: Enjoy support for a wide range of audio file format transcriptions with RAG, including 'audio/x-m4a', to broaden compatibility with audio content within the platform.

🎤 Deepgram Speech-to-Text Integration: Leverage Deepgram's advanced speech recognition capabilities for high-accuracy voice transcription, providing an additional STT option beyond local Whisper and OpenAI.

🔊 ElevenLabs Text-to-Speech Integration: Access ElevenLabs' premium voice synthesis with support for EU residency API endpoints, offering high-quality and natural-sounding voice output for enhanced user experiences.

🔊 Audio Compression: Experimental audio compression allows navigating around the 25MB limit for OpenAI's speech-to-text processing, expanding the possibilities for audio-based interactions.

🗣️ Experimental SpeechT5 TTS: Enjoy local SpeechT5 support for improved text-to-speech capabilities.

🚀 Versatile, UI-Agnostic, OpenAI-Compatible Plugin Framework: Seamlessly integrate and customize Open WebUI Pipelines for efficient data processing and model training, ensuring ultimate flexibility and scalability.

🛠️ Native Python Function Calling: Access the power of Python directly within Open WebUI with native function calling. Easily integrate custom code to build unique features like custom RAG pipelines, web search tools, and even agent-like actions via a built-in code editor to seamlessly develop and integrate function code within the Tools and Functions workspace.

🐍 Python Code Execution: Execute Python code locally in the browser via Pyodide with a range of libraries supported by Pyodide.

🌊 Mermaid Rendering: Create visually appealing diagrams and flowcharts directly within Open WebUI using the Mermaid Diagramming and charting tool, which supports Mermaid syntax rendering.

🔗 Iframe Support: Enables rendering HTML directly into your chat interface using functions and tools.

✨ Multiple OpenAI-Compatible API Support: Seamlessly integrate and customize various OpenAI-compatible APIs, enhancing the versatility of your chat interactions.

🔑 Simplified API Key Management: Easily generate and manage secret keys to leverage Open WebUI with OpenAI libraries, streamlining integration and development.

🌐 HTTP/S Proxy Support: Configure network settings easily using the http_proxy or https_proxy environment variable. These variables, if set, should contain the URLs for HTTP and HTTPS proxies, respectively.

🌐🔗 External Ollama Server Connectivity: Seamlessly link to an external Ollama server hosted on a different address by configuring the environment variable.

🛢️ Flexible Database Integration: Seamlessly connect to custom databases, including SQLite, Postgres, and multiple vector databases like Milvus, using environment variables for flexible and scalable data management.

🗄️ Multiple Vector Database Support: Choose from 9 vector database options for optimal RAG performance: ChromaDB (default), PostgreSQL with PGVector, Qdrant, Milvus, Elasticsearch, OpenSearch, Pinecone, S3Vector, and Oracle 23ai. Each option provides different scaling characteristics and performance profiles to match your deployment needs.

☁️ Enterprise Cloud Storage Backends: Configure cloud storage backends including Amazon S3 (with S3-compatible providers like MinIO), Google Cloud Storage, and Microsoft Azure Blob Storage for scalable file storage, enabling stateless instances and distributed deployments.

📂 Cloud File Picker Integration: Import documents directly from Google Drive and OneDrive/SharePoint through native file picker interfaces, streamlining workflows for users working with enterprise cloud storage solutions.

🌐🗣️ External Speech-to-Text Support: The addition of external speech-to-text (STT) services provides enhanced flexibility, allowing users to choose their preferred provider for seamless interaction.

🌐 Remote ChromaDB Support: Extend the capabilities of your database by connecting to remote ChromaDB servers.

🔀 Multiple Ollama Instance Load Balancing: Effortlessly distribute chat requests across multiple Ollama instances for enhanced performance and reliability.

🚀 Advanced Load Balancing and Reliability: Utilize enhanced load balancing capabilities, stateless instances with full Redis support, and automatic web socket re-connection to promote better performance, reliability, and scalability in WebUI, ensuring seamless and uninterrupted interactions across multiple instances.

☁️ Cloud Storage Backend Support: Enable stateless Open WebUI instances with cloud storage backends (Amazon S3, Google Cloud Storage, Microsoft Azure Blob Storage) for enhanced scalability, high availability, and balancing heavy workloads across multiple instances.

🛠️ OAuth Management for User Groups: Enhance control and scalability in collaborative environments with group-level management via OAuth integration.

🔐 SCIM 2.0 Automated Provisioning: Enterprise-grade user and group provisioning through SCIM 2.0 protocol, enabling seamless integration with identity providers like Okta, Azure AD, and Google Workspace for automated user lifecycle management, reducing administrative overhead.

📊 OpenTelemetry Observability: Export traces, metrics, and logs to your observability stack using OpenTelemetry protocol (OTLP), supporting both gRPC and HTTP exporters with configurable endpoints, authentication, and sampling strategies for comprehensive production monitoring.

👑 Super Admin Assignment: Automatically assigns the first sign-up as a super admin with an unchangeable role that cannot be modified by anyone else, not even other admins.

🛡️ Granular User Permissions: Restrict user actions and access with customizable role-based permissions, ensuring that only authorized individuals can perform specific tasks.

👥 Multi-User Management: Intuitive admin panel with pagination allows you to seamlessly manage multiple users, streamlining user administration and simplifying user life-cycle management.

🔧 Admin Panel: The user management system is designed to streamline the on-boarding and management of users, offering the option to add users directly or in bulk via CSV import.

👥 Active Users Indicator: Monitor the number of active users and which models are being utilized by whom to assist in gauging when performance may be impacted due to a high number of users.

🔒 Default Sign-Up Role: Specify the default role for new sign-ups to pending, user, or admin, providing flexibility in managing user permissions and access levels for new users.

🔒 Prevent New Sign-Ups: Enable the option to disable new user sign-ups, restricting access to the platform and maintaining a fixed number of users.

🔒 Prevent Chat Deletion: Ability for admins to toggle a setting that prevents all users from deleting their chat messages, ensuring that all chat messages are retained for audit or compliance purposes.

🔗 Webhook Integration: Subscribe to new user sign-up events via webhook (compatible with Discord, Google Chat, Slack and Microsoft Teams), providing real-time notifications and automation capabilities.

📣 Configurable Notification Banners: Admins can create customizable banners with persistence in config.json, featuring options for content, background color (info, warning, error, or success), and dismissibility. Banners are accessible only to logged-in users, ensuring the confidentiality of sensitive information.

🛡️ Model Whitelisting: Enhance security and access control by allowing admins to whitelist models for users with the user role, ensuring that only authorized models can be accessed.

🔑 Admin Control for Community Sharing: Admins can enable or disable community sharing for all users via a toggle in the Admin Panel > Settings menu. This toggle allows admins to manage accessibility and privacy, ensuring a secure environment. Admins have the option of enabling or disabling the Share on Community button for all users, which allows them to control community engagement and collaboration.

📧 Trusted Email Authentication: Optionally authenticate using a trusted email header, adding an extra layer of security and authentication to protect your Open WebUI instance.

🔒 Backend Reverse Proxy Support: Bolster security through direct communication between Open WebUI's backend and Ollama. This key feature eliminates the need to expose Ollama over the local area network (LAN). Requests made to the /ollama/api route from Open WebUI are seamlessly redirected to Ollama from the backend, enhancing overall system security and providing an additional layer of protection.

🔒 Authentication: Please note that Open WebUI does not natively support federated authentication schemes such as SSO, OAuth, SAML, or OIDC. However, it can be configured to delegate authentication to an authenticating reverse proxy, effectively achieving a Single Sign-On (SSO) experience. This setup allows you to centralize user authentication and management, enhancing security and user convenience. By integrating Open WebUI with an authenticating reverse proxy, you can leverage existing authentication systems and streamline user access to Open WebUI. For more information on configuring this feature, please refer to the Federated Authentication Support.

🔓 Optional Authentication: Enjoy the flexibility of disabling authentication by setting WEBUI_AUTH to False. This is an ideal solution for fresh installations without existing users or can be useful for demonstration purposes.

🚫 Advanced API Security: Block API users based on customized model filters, enhancing security and control over API access.

❗ Administrator Updates: Ensure administrators stay informed with immediate update notifications upon login, keeping them up-to-date on the latest changes and system statuses.

👥 User Group Management: Create and manage user groups for seamless organization and control.

🔐 Group-Based Access Control: Set granular access to models, knowledge, prompts, and tools based on user groups, allowing for more controlled and secure environments.

🛠️ Granular User Permissions: Easily manage workspace permissions, including file uploads, deletions, edits, and temporary chats, as well as model, knowledge, prompt, and tool creation.

🔑 LDAP Authentication: Enhance security and scalability with LDAP support for user management.

🔐 SCIM 2.0 Provisioning: Automate user and group lifecycle management through SCIM 2.0 protocol integration with identity providers like Okta, Azure AD, and Google Workspace, reducing administrative overhead and ensuring synchronized user management across systems.

🌐 Customizable OpenAI Connections: Enjoy smooth operation with custom OpenAI setups, including prefix ID support and explicit model ID support for APIs.

🔐 Ollama API Key Management: Manage Ollama credentials, including prefix ID support, for secure and efficient operation.

🔄 Connection Management: Easily enable or disable individual OpenAI and Ollama connections as needed.

🎨 Intuitive Model Workspace: Manage models across users and groups with a redesigned and user-friendly interface.

🔑 API Key Authentication: Tighten security by easily enabling or disabling API key authentication.

🔄 Unified Model Reset: Reset and remove all models from the Admin Settings with a one-click option.

🔓 Flexible Model Access Control: Easily bypass model access controls for user roles when not required, using the 'BYPASS_MODEL_ACCESS_CONTROL' environment variable, simplifying workflows in trusted environments.

🔒 Configurable API Key Authentication Restrictions: Flexibly configure endpoint restrictions for API key authentication, now off by default for a smoother setup in trusted environments.

---

## ⭐ Features

**URL:** https://docs.openwebui.com/features

**Contents:**
- ⭐ Features
- Key Features of Open WebUI ⭐​
- And many more remarkable features including... ⚡️​
  - 🔧 Pipelines Support​
    - The possibilities with our Pipelines framework knows no bounds and are practically limitless. Start with a few pre-built pipelines to help you get started!​
    - In addition to the extensive features and customization options, we also provide a library of example pipelines ready to use along with a practical example scaffold pipeline to help you get started. These resources will streamline your development process and enable you to quickly create powerful LLM interactions using Pipelines and Python. Happy coding! 💡​
  - 🖥️ User Experience​
  - 💬 Conversations​
  - 💻 Model Management​
  - 👥 Collaboration​

We are hiring! Shape the way humanity engages with intelligence.

🚀 Effortless Setup: Install seamlessly using Docker, Kubernetes, Podman, Helm Charts (kubectl, kustomize, podman, or helm) for a hassle-free experience with support for both :ollama image with bundled Ollama and :cuda with CUDA support.

🛠️ Guided Initial Setup: Complete the setup process with clarity, including an explicit indication of creating an admin account during the first-time setup.

🤝 OpenAI API Integration: Effortlessly integrate OpenAI-compatible APIs for versatile conversations alongside Ollama models. The OpenAI API URL can be customized to integrate Open WebUI seamlessly with various third-party applications.

🛡️ Granular Permissions and User Groups: By allowing administrators to create detailed user roles, user groups, and permissions across the workspace, we ensure a secure user environment for all users involved. This granularity not only enhances security, but also allows for customized user experiences, fostering a sense of ownership and responsibility amongst users.

🔐 SCIM 2.0 Provisioning: Enterprise-grade user and group provisioning through SCIM 2.0 protocol, enabling seamless integration with identity providers like Okta, Azure AD, and Google Workspace for automated user lifecycle management.

📱 Responsive Design: Enjoy a seamless experience across desktop PCs, laptops, and mobile devices.

📱 Progressive Web App for Mobile: Enjoy a native progressive web application experience on your mobile device with offline access on localhost or a personal domain, and a smooth user interface. In order for our PWA to be installable on your device, it must be delivered in a secure context. This usually means that it must be served over HTTPS.

✒️🔢 Full Markdown and LaTeX Support: Elevate your LLM experience with comprehensive Markdown, LaTex, and Rich Text capabilities for enriched interaction.

🧩 Model Builder: Easily create custom models from base Ollama models directly from Open WebUI. Create and add custom characters and agents, customize model elements, and import models effortlessly through Open WebUI Community integration.

📚 Advanced RAG Integration with Multiple Vector Databases: Dive into the future of chat interactions with cutting-edge Retrieval Augmented Generation (RAG) technology. Choose from 9 vector database options: ChromaDB (default), PostgreSQL with PGVector, Qdrant, Milvus, Elasticsearch, OpenSearch, Pinecone, S3Vector, and Oracle 23ai. Documents can be loaded into the Documents tab of the Workspace and accessed using the pound key [#] before a query, or by starting the prompt with [#] followed by a URL for webpage content integration.

📄 Advanced Document Extraction with Multiple Engines: Extract text and data from various document formats including PDFs, Word documents, Excel spreadsheets, PowerPoint presentations, and more using your choice of extraction engines: Apache Tika, Docling, Azure Document Intelligence, Mistral OCR, or external custom (self-built) content extraction engines/document loaders. Advanced document processing capabilities enable seamless integration with your knowledge base, preserving structure and formatting while supporting OCR for scanned documents and images.

🔍 Web Search for RAG with 15+ Providers: Perform web searches using 15+ providers including SearXNG, Google PSE, Brave Search, Kagi, Mojeek, Bocha, Tavily, Perplexity (AI models and Search API), serpstack, serper, Serply, DuckDuckGo, SearchAPI, SerpApi, Bing, Jina, Exa, Sougou, Azure AI Search, and Ollama Cloud, injecting results directly into your local Retrieval Augmented Generation (RAG) experience.

🌐 Web Browsing Capabilities: Integrate websites seamlessly into your chat experience by using the # command followed by a URL. This feature enables the incorporation of web content directly into your conversations, thereby enhancing the richness and depth of your interactions.

🎨 Image Generation & Editing Integration: Seamlessly create and edit images using multiple engines including OpenAI's DALL-E (generation and editing), Gemini (generation and editing), ComfyUI (local, generation and editing), and AUTOMATIC1111 (local, generation). Support for both text-to-image generation and prompt-based image editing workflows with dynamic visual content.

⚙️ Concurrent Model Utilization: Effortlessly engage with multiple models simultaneously, harnessing their unique strengths for optimal responses. Leverage a diverse set of model modalities in parallel to enhance your experience.

🔐 Role-Based Access Control (RBAC): Ensure secure access with restricted permissions. Only authorized individuals can access your Ollama, while model creation and pulling rights are exclusively reserved for administrators.

🌐🌍 Multilingual Support: Experience Open WebUI in your preferred language with our internationalization (i18n) support. We invite you to join us in expanding our supported languages! We're actively seeking contributors!

💾 Persistent Artifact Storage: Built-in key-value storage API for artifacts, enabling features like journals, trackers, leaderboards, and collaborative tools with both personal and shared data scopes that persist across sessions.

☁️ Cloud Storage Integration: Native support for cloud storage backends including Amazon S3 (with S3-compatible providers), Google Cloud Storage, and Microsoft Azure Blob Storage for scalable file storage and data management.

☁️ Enterprise Cloud Integration: Seamlessly import documents from Google Drive and OneDrive/SharePoint directly through the file picker interface, enabling smooth workflows with enterprise cloud storage solutions.

📊 Production Observability with OpenTelemetry: Built-in OpenTelemetry support for comprehensive monitoring with traces, metrics, and logs export to your existing observability stack (Prometheus, Grafana, Jaeger, etc.), enabling production-grade monitoring and debugging.

🔒 Encrypted Database Support: Optional at-rest encryption for SQLite databases using SQLCipher, providing enhanced security for sensitive data in smaller deployments without requiring PostgreSQL infrastructure.

⚖️ Horizontal Scalability for Production: Redis-backed session management and WebSocket support enabling multi-worker and multi-node deployments behind load balancers for high-availability production environments.

🌟 Continuous Updates: We are committed to improving Open WebUI with regular updates, fixes, and new features.

🔧 Pipelines Framework: Seamlessly integrate and customize your Open WebUI experience with our modular plugin framework for enhanced customization and functionality (https://github.com/open-webui/pipelines). Our framework allows for the easy addition of custom logic and integration of Python libraries, from AI agents to home automation APIs.

📥 Upload Pipeline: Pipelines can be uploaded directly from the Admin Panel > Settings > Pipelines menu, streamlining the pipeline management process.

🔗 Function Calling: Integrate Function Calling seamlessly through Pipelines to enhance your LLM interactions with advanced function calling capabilities.

📚 Custom RAG: Integrate a custom Retrieval Augmented Generation (RAG) pipeline seamlessly to enhance your LLM interactions with custom RAG logic.

📊 Message Monitoring with Langfuse: Monitor and analyze message interactions in real-time usage statistics via Langfuse pipeline.

⚖️ User Rate Limiting: Manage API usage efficiently by controlling the flow of requests sent to LLMs to prevent exceeding rate limits with Rate Limit pipeline.

🌍 Real-Time LibreTranslate Translation: Integrate real-time translations into your LLM interactions using LibreTranslate pipeline, enabling cross-lingual communication.

🛡️ Toxic Message Filtering: Our Detoxify pipeline automatically filters out toxic messages to maintain a clean and safe chat environment.

🔒 LLM-Guard: Ensure secure LLM interactions with LLM-Guard pipeline, featuring a Prompt Injection Scanner that detects and mitigates crafty input manipulations targeting large language models. This protects your LLMs from data leakage and adds a layer of resistance against prompt injection attacks.

🕒 Conversation Turn Limits: Improve interaction management by setting limits on conversation turns with Conversation Turn Limit pipeline.

📈 OpenAI Generation Stats: Our OpenAI pipeline provides detailed generation statistics for OpenAI models.

🚀 Multi-Model Support: Our seamless integration with various AI models from various providers expands your possibilities with a wide range of language models to select from and interact with.

🖥️ Intuitive Interface: The chat interface has been designed with the user in mind, drawing inspiration from the user interface of ChatGPT.

⚡ Swift Responsiveness: Enjoy reliably fast and responsive performance.

🎨 Splash Screen: A simple loading splash screen for a smoother user experience.

🌐 Personalized Interface: Choose between a freshly designed search landing page and the classic chat UI from Settings > Interface, allowing for a tailored experience.

📦 Pip Install Method: Installation of Open WebUI can be accomplished via the command pip install open-webui, which streamlines the process and makes it more accessible to new users. For further information, please visit: https://pypi.org/project/open-webui/.

🌈 Theme Customization: Personalize your Open WebUI experience with a range of options, including a variety of solid, yet sleek themes, customizable chat background images, and three mode options: Light, Dark, or OLED Dark mode - or let Her choose for you! ;)

🖼️ Custom Background Support: Set a custom background from Settings > Interface to personalize your experience.

📝 Rich Banners with Markdown: Create visually engaging announcements with markdown support in banners, enabling richer and more dynamic content.

💻 Code Syntax Highlighting: Our syntax highlighting feature enhances code readability, providing a clear and concise view of your code.

🗨️ Markdown Rendering in User Messages: User messages are now rendered in Markdown, enhancing readability and interaction.

🎨 Flexible Text Input Options: Switch between rich text input and legacy text area input for chat, catering to user preferences and providing a choice between advanced formatting and simpler text input.

👆 Effortless Code Sharing : Streamline the sharing and collaboration process with convenient code copying options, including a floating copy button in code blocks and click-to-copy functionality from code spans, saving time and reducing frustration.

🎨 Interactive Artifacts: Render web content and SVGs directly in the interface, supporting quick iterations and live changes for enhanced creativity and productivity.

🖊️ Live Code Editing: Supercharged code blocks allow live editing directly in the LLM response, with live reloads supported by artifacts, streamlining coding and testing.

🔍 Enhanced SVG Interaction: Pan and zoom capabilities for SVG images, including Mermaid diagrams, enable deeper exploration and understanding of complex concepts.

🔍 Text Select Quick Actions: Floating buttons appear when text is highlighted in LLM responses, offering deeper interactions like "Ask a Question" or "Explain", and enhancing overall user experience.

↕️ Bi-Directional Chat Support: You can easily switch between left-to-right and right-to-left chat directions to accommodate various language preferences.

📱 Mobile Accessibility: The sidebar can be opened and closed on mobile devices with a simple swipe gesture.

🤳 Haptic Feedback on Supported Devices: Android devices support haptic feedback for an immersive tactile experience during certain interactions.

🔍 User Settings Search: Quickly search for settings fields, improving ease of use and navigation.

📜 Offline Swagger Documentation: Access developer-friendly Swagger API documentation offline, ensuring full accessibility wherever you are.

💾 Performance Optimizations: Lazy loading of large dependencies minimizes initial memory usage, boosting performance and reducing loading times.

🚀 Persistent and Scalable Configuration: Open WebUI configurations are stored in a database (webui.db), allowing for seamless load balancing, high-availability setups, and persistent settings across multiple instances, making it easy to access and reuse your configurations.

🔄 Portable Import/Export: Easily import and export Open WebUI configurations, simplifying the process of replicating settings across multiple systems.

❓ Quick Access to Documentation & Shortcuts: The question mark button located at the bottom right-hand corner of the main UI screen (available on larger screens like desktop PCs and laptops) provides users with easy access to the Open WebUI documentation page and available keyboard shortcuts.

📜 Changelog & Check for Updates: Users can access a comprehensive changelog and check for updates in the Settings > About > See What's New menu, which provides a quick overview of the latest features, improvements, and bug fixes, as well as the ability to check for updates.

💬 True Asynchronous Chat: Enjoy uninterrupted multitasking with true asynchronous chat support, allowing you to create chats, navigate away, and return anytime with responses ready.

🔔 Chat Completion Notifications: Stay updated with instant in-UI notifications when a chat finishes in a non-active tab, ensuring you never miss a completed response.

🌐 Notification Webhook Integration: Receive timely updates for long-running chats or external integration needs with configurable webhook notifications, even when your tab is closed.

📚 Channels (Beta): Explore real-time collaboration between users and AIs with Discord/Slack-style chat rooms, build bots for channels, and unlock asynchronous communication for proactive multi-agent workflows.

🖊️ Typing Indicators in Channels: Enhance collaboration with real-time typing indicators in channels, keeping everyone engaged and informed.

👤 User Status Indicators: Quickly view a user's status by clicking their profile image in channels, providing better coordination and availability insights.

💬 Chat Controls: Easily adjust parameters for each chat session, offering more precise control over your interactions.

💖 Favorite Response Management: Easily mark and organize favorite responses directly from the chat overview, enhancing ease of retrieval and access to preferred responses.

📌 Pinned Chats: Support for pinned chats, allowing you to keep important conversations easily accessible.

🔍 RAG Embedding Support: Change the Retrieval Augmented Generation (RAG) embedding model directly in the Admin Panel > Settings > Documents menu, enhancing document processing. This feature supports Ollama and OpenAI models.

📜 Citations in RAG Feature: The Retrieval Augmented Generation (RAG) feature allows users to easily track the context of documents fed to LLMs with added citations for reference points.

🌟 Enhanced RAG Pipeline: A togglable hybrid search sub-feature for our RAG embedding feature that enhances the RAG functionality via BM25, with re-ranking powered by CrossEncoder, and configurable relevance score thresholds.

📹 YouTube RAG Pipeline: The dedicated Retrieval Augmented Generation (RAG) pipeline for summarizing YouTube videos via video URLs enables smooth interaction with video transcriptions directly.

📁 Comprehensive Document Retrieval: Toggle between full document retrieval and traditional snippets, enabling comprehensive tasks like summarization and supporting enhanced document capabilities.

🌟 RAG Citation Relevance: Easily assess citation accuracy with the addition of relevance percentages in RAG results.

🗂️ Advanced RAG: Improve RAG accuracy with smart pre-processing of chat history to determine the best queries before retrieval.

📚 Inline Citations for RAG: Benefit from seamless inline citations for Retrieval-Augmented Generation (RAG) responses, improving traceability and providing source clarity for newly uploaded files.

📁 Large Text Handling: Optionally convert large pasted text into a file upload to be used directly with RAG, keeping the chat interface cleaner.

🔄 Multi-Modal Support: Effortlessly engage with models that support multi-modal interactions, including images (e.g., LLaVA).

🤖 Multiple Model Support: Quickly switch between different models for diverse chat interactions.

🔀 Merge Responses in Many Model Chat: Enhances the dialogue by merging responses from multiple models into a single, coherent reply.

✅ Multiple Instances of Same Model in Chats: Enhanced many model chat to support adding multiple instances of the same model.

💬 Temporary Chat Feature: Introduced a temporary chat feature, deprecating the old chat history setting to enhance user interaction flexibility. Please note that document processing in temporary chats is performed entirely in the browser to ensure privacy and data minimization. This means specific file types requiring backend processing (like complex DOCX parsing) may have limited functionality in temporary mode.

🖋️ User Message Editing: Enhanced the user chat editing feature to allow saving changes without sending.

💬 Efficient Conversation Editing: Create new message pairs quickly and intuitively using the Cmd/Ctrl+Shift+Enter shortcut, streamlining conversation length tests.

🖼️ Client-Side Image Compression: Save bandwidth and improve performance with client-side image compression, allowing you to compress images before upload from Settings > Interface.

👥 '@' Model Integration: By seamlessly switching to any accessible local or external model during conversations, users can harness the collective intelligence of multiple models in a single chat. This can done by using the @ command to specify the model by name within a chat.

🏷️ Conversation Tagging : Effortlessly categorize and locate tagged chats for quick reference and streamlined data collection using our efficient 'tag:' query system, allowing you to manage, search, and organize your conversations without cluttering the interface.

🧠 Auto-Tagging: Conversations can optionally be automatically tagged for improved organization, mirroring the efficiency of auto-generated titles.

👶 Chat Cloning: Easily clone and save a snapshot of any chat for future reference or continuation. This feature makes it easy to pick up where you left off or share your session with others. To create a copy of your chat, simply click on the Clone button in the chat's dropdown options. Can you keep up with your clones?

⭐ Visualized Conversation Flows: Interactive messages diagram for improved visualization of conversation flows, enhancing understanding and navigation of complex discussions.

📁 Chat Folders: Organize your chats into folders, drag and drop them for easy management, and export them seamlessly for sharing or analysis.

📤 Easy Chat Import: Import chats into your workspace by simply dragging and dropping chat exports (JSON) onto the sidebar.

📜 Prompt Preset Support: Instantly access custom preset prompts using the / command in the chat input. Load predefined conversation starters effortlessly and expedite your interactions. Import prompts with ease through Open WebUI Community integration or create your own!

📅 Prompt Variables Support: Prompt variables such as {{CLIPBOARD}}, {{CURRENT_DATE}}, {{CURRENT_DATETIME}}, {{CURRENT_TIME}}, {{CURRENT_TIMEZONE}}, {{CURRENT_WEEKDAY}}, {{USER_NAME}}, {{USER_LANGUAGE}}, and {{USER_LOCATION}} can be utilized in the system prompt or by using a slash command to select a prompt directly within a chat.

🧠 Memory Feature: Manually add information you want your LLMs to remember via the Settings > Personalization > Memory menu. Memories can be added, edited, and deleted.

🛠️ Model Builder: All models can be built and edited with a persistent model builder mode within the models edit page.

📚 Knowledge Support for Models: The ability to attach tools, functions, and knowledge collections directly to models from a model's edit page, enhancing the information available to each model.

🗂️ Model Presets: Create and manage model presets for both the Ollama and OpenAI API.

🏷️ Model Tagging: The models workspace enables users to organize their models using tagging.

📋 Model Selector Dropdown Ordering: Models can be effortlessly organized by dragging and dropping them into desired positions within the model workspace, which will then reflect the changes in the model dropdown menu.

🔍 Model Selector Dropdown: Easily find and select your models with fuzzy search and detailed model information with model tags and model descriptions.

⌨️ Arrow Keys Model Selection: Use arrow keys for quicker model selection, enhancing accessibility.

🔧 Quick Actions in Model Workspace: Enhanced Shift key quick actions for hiding/displaying and deleting models in the model workspace.

😄 Transparent Model Usage: Stay informed about the system's state during queries with knowledge-augmented models, thanks to visible status displays.

⚙️ Fine-Tuned Control with Advanced Parameters: Gain a deeper level of control by adjusting model parameters such as seed, temperature, frequency penalty, context length, seed, and more.

🔄 Seamless Integration: Copy any ollama run {model:tag} CLI command directly from a model's page on Ollama library and paste it into the model dropdown to easily select and pull models.

🗂️ Create Ollama Modelfile: To create a model file for Ollama, navigate to the Admin Panel > Settings > Models > Create a model menu.

⬆️ GGUF File Model Creation: Effortlessly create Ollama models by uploading GGUF files directly from Open WebUI from the Admin Settings > Settings > Model > Experimental menu. The process has been streamlined with the option to upload from your machine or download GGUF files from Hugging Face.

⚙️ Default Model Setting: The default model preference for new chats can be set in the Settings > Interface menu on mobile devices, or can more easily be set in a new chat under the model selector dropdown on desktop PCs and laptops.

💡 LLM Response Insights: Details of every generated response can be viewed, including external model API insights and comprehensive local model info.

🕒 Model Details at a Glance: View critical model details, including model hash and last modified timestamp, directly in the Models workspace for enhanced tracking and management.

📥🗑️ Download/Delete Models: Models can be downloaded or deleted directly from Open WebUI with ease.

🔄 Update All Ollama Models: A convenient button allows users to update all their locally installed models in one operation, streamlining model management.

🍻 TavernAI Character Card Integration: Experience enhanced visual storytelling with TavernAI Character Card Integration in our model builder. Users can seamlessly incorporate TavernAI character card PNGs directly into their model files, creating a more immersive and engaging user experience.

🎲 Model Playground (Beta): Try out models with the model playground area (beta), which enables users to test and explore model capabilities and parameters with ease in a sandbox environment before deployment in a live chat environment.

🗨️ Local Chat Sharing: Generate and share chat links between users in an efficient and seamless manner, thereby enhancing collaboration and communication.

👍👎 RLHF Annotation: Enhance the impact of your messages by rating them with either a thumbs up or thumbs down AMD provide a rating for the response on a scale of 1-10, followed by the option to provide textual feedback, facilitating the creation of datasets for Reinforcement Learning from Human Feedback (RLHF). Utilize your messages to train or fine-tune models, all while ensuring the confidentiality of locally saved data.

🔧 Comprehensive Feedback Export: Export feedback history data to JSON for seamless integration with RLHF processing and further analysis, providing valuable insights for improvement.

🤝 Community Sharing: Share your chat sessions with the Open WebUI Community by clicking the Share to Open WebUI Community button. This feature allows you to engage with other users and collaborate on the platform.

🏆 Community Leaderboard: Compete and track your performance in real-time with our leaderboard system, which utilizes the ELO rating system and allows for optional sharing of feedback history.

⚔️ Model Evaluation Arena: Conduct blind A/B testing of models directly from the Admin Settings for a true side-by-side comparison, making it easier to find the best model for your needs.

🎯 Topic-Based Rankings: Discover more accurate rankings with our experimental topic-based re-ranking system, which adjusts leaderboard standings based on tag similarity in feedback.

📂 Unified and Collaborative Workspace : Access and manage all your model files, prompts, documents, tools, and functions in one convenient location, while also enabling multiple users to collaborate and contribute to models, knowledge, prompts, or tools, streamlining your workflow and enhancing teamwork.

📜 Chat History: Access and manage your conversation history with ease via the chat navigation sidebar. Toggle off chat history in the Settings > Chats menu to prevent chat history from being created with new interactions.

🔄 Regeneration History Access: Easily revisit and explore your entire LLM response regeneration history.

📬 Archive Chats: Effortlessly store away completed conversations you've had with models for future reference or interaction, maintaining a tidy and clutter-free chat interface.

🗃️ Archive All Chats: This feature allows you to quickly archive all of your chats at once.

📦 Export All Archived Chats as JSON: This feature enables users to easily export all their archived chats in a single JSON file, which can be used for backup or transfer purposes.

📄 Download Chats as JSON/PDF/TXT: Easily download your chats individually in your preferred format of .json, .pdf, or .txt format.

📤📥 Import/Export Chat History: Seamlessly move your chat data in and out of the platform via Import Chats and Export Chats options.

🗑️ Delete All Chats: This option allows you to permanently delete all of your chats, ensuring a fresh start.

🗣️ Voice Input Support with Multiple Providers: Engage with your model through voice interactions using multiple Speech-to-Text providers: Local Whisper (default, with VAD filtering), OpenAI-compatible endpoints, Deepgram, and Azure Speech Services. Enjoy the convenience of talking to your model directly with automatic voice input after 3 seconds of silence for a streamlined experience.

😊 Emoji Call: Toggle this feature on from the Settings > Interface menu, allowing LLMs to express emotions using emojis during voice calls for a more dynamic interaction.

🎙️ Hands-Free Voice Call Feature: Initiate voice calls without needing to use your hands, making interactions more seamless.

📹 Video Call Feature: Enable video calls with supported vision models like LlaVA and GPT-4o, adding a visual dimension to your communications.

👆 Tap to Interrupt: Stop the AI’s speech during voice conversations with a simple tap on mobile devices, ensuring seamless control over the interaction.

🎙️ Voice Interrupt: Stop the AI’s speech during voice conversations with your voice on mobile devices, ensuring seamless control over the interaction.

🔊 Multiple Text-to-Speech Providers: Customize your Text-to-Speech experience with multiple providers: OpenAI-compatible endpoints, Azure Speech Services, ElevenLabs (with EU residency support), local Transformers models, and browser-based WebAPI for reading aloud LLM responses.

🔗 Direct Call Mode Access: Activate call mode directly from a URL, providing a convenient shortcut for mobile device users.

✨ Customizable Text-to-Speech: Control how message content is segmented for Text-to-Speech (TTS) generation requests, allowing for flexible speech output options.

🔊 Azure Speech Services Integration: Supports Azure Speech services for Text-to-Speech (TTS), providing users with a wider range of speech synthesis options.

🎚️ Customizable Audio Playback: Allows users to adjust audio playback speed to their preferences in Call mode settings, enhancing accessibility and usability.

🎵 Broad Audio Compatibility: Enjoy support for a wide range of audio file format transcriptions with RAG, including 'audio/x-m4a', to broaden compatibility with audio content within the platform.

🎤 Deepgram Speech-to-Text Integration: Leverage Deepgram's advanced speech recognition capabilities for high-accuracy voice transcription, providing an additional STT option beyond local Whisper and OpenAI.

🔊 ElevenLabs Text-to-Speech Integration: Access ElevenLabs' premium voice synthesis with support for EU residency API endpoints, offering high-quality and natural-sounding voice output for enhanced user experiences.

🔊 Audio Compression: Experimental audio compression allows navigating around the 25MB limit for OpenAI's speech-to-text processing, expanding the possibilities for audio-based interactions.

🗣️ Experimental SpeechT5 TTS: Enjoy local SpeechT5 support for improved text-to-speech capabilities.

🚀 Versatile, UI-Agnostic, OpenAI-Compatible Plugin Framework: Seamlessly integrate and customize Open WebUI Pipelines for efficient data processing and model training, ensuring ultimate flexibility and scalability.

🛠️ Native Python Function Calling: Access the power of Python directly within Open WebUI with native function calling. Easily integrate custom code to build unique features like custom RAG pipelines, web search tools, and even agent-like actions via a built-in code editor to seamlessly develop and integrate function code within the Tools and Functions workspace.

🐍 Python Code Execution: Execute Python code locally in the browser via Pyodide with a range of libraries supported by Pyodide.

🌊 Mermaid Rendering: Create visually appealing diagrams and flowcharts directly within Open WebUI using the Mermaid Diagramming and charting tool, which supports Mermaid syntax rendering.

🔗 Iframe Support: Enables rendering HTML directly into your chat interface using functions and tools.

✨ Multiple OpenAI-Compatible API Support: Seamlessly integrate and customize various OpenAI-compatible APIs, enhancing the versatility of your chat interactions.

🔑 Simplified API Key Management: Easily generate and manage secret keys to leverage Open WebUI with OpenAI libraries, streamlining integration and development.

🌐 HTTP/S Proxy Support: Configure network settings easily using the http_proxy or https_proxy environment variable. These variables, if set, should contain the URLs for HTTP and HTTPS proxies, respectively.

🌐🔗 External Ollama Server Connectivity: Seamlessly link to an external Ollama server hosted on a different address by configuring the environment variable.

🛢️ Flexible Database Integration: Seamlessly connect to custom databases, including SQLite, Postgres, and multiple vector databases like Milvus, using environment variables for flexible and scalable data management.

🗄️ Multiple Vector Database Support: Choose from 9 vector database options for optimal RAG performance: ChromaDB (default), PostgreSQL with PGVector, Qdrant, Milvus, Elasticsearch, OpenSearch, Pinecone, S3Vector, and Oracle 23ai. Each option provides different scaling characteristics and performance profiles to match your deployment needs.

☁️ Enterprise Cloud Storage Backends: Configure cloud storage backends including Amazon S3 (with S3-compatible providers like MinIO), Google Cloud Storage, and Microsoft Azure Blob Storage for scalable file storage, enabling stateless instances and distributed deployments.

📂 Cloud File Picker Integration: Import documents directly from Google Drive and OneDrive/SharePoint through native file picker interfaces, streamlining workflows for users working with enterprise cloud storage solutions.

🌐🗣️ External Speech-to-Text Support: The addition of external speech-to-text (STT) services provides enhanced flexibility, allowing users to choose their preferred provider for seamless interaction.

🌐 Remote ChromaDB Support: Extend the capabilities of your database by connecting to remote ChromaDB servers.

🔀 Multiple Ollama Instance Load Balancing: Effortlessly distribute chat requests across multiple Ollama instances for enhanced performance and reliability.

🚀 Advanced Load Balancing and Reliability: Utilize enhanced load balancing capabilities, stateless instances with full Redis support, and automatic web socket re-connection to promote better performance, reliability, and scalability in WebUI, ensuring seamless and uninterrupted interactions across multiple instances.

☁️ Cloud Storage Backend Support: Enable stateless Open WebUI instances with cloud storage backends (Amazon S3, Google Cloud Storage, Microsoft Azure Blob Storage) for enhanced scalability, high availability, and balancing heavy workloads across multiple instances.

🛠️ OAuth Management for User Groups: Enhance control and scalability in collaborative environments with group-level management via OAuth integration.

🔐 SCIM 2.0 Automated Provisioning: Enterprise-grade user and group provisioning through SCIM 2.0 protocol, enabling seamless integration with identity providers like Okta, Azure AD, and Google Workspace for automated user lifecycle management, reducing administrative overhead.

📊 OpenTelemetry Observability: Export traces, metrics, and logs to your observability stack using OpenTelemetry protocol (OTLP), supporting both gRPC and HTTP exporters with configurable endpoints, authentication, and sampling strategies for comprehensive production monitoring.

👑 Super Admin Assignment: Automatically assigns the first sign-up as a super admin with an unchangeable role that cannot be modified by anyone else, not even other admins.

🛡️ Granular User Permissions: Restrict user actions and access with customizable role-based permissions, ensuring that only authorized individuals can perform specific tasks.

👥 Multi-User Management: Intuitive admin panel with pagination allows you to seamlessly manage multiple users, streamlining user administration and simplifying user life-cycle management.

🔧 Admin Panel: The user management system is designed to streamline the on-boarding and management of users, offering the option to add users directly or in bulk via CSV import.

👥 Active Users Indicator: Monitor the number of active users and which models are being utilized by whom to assist in gauging when performance may be impacted due to a high number of users.

🔒 Default Sign-Up Role: Specify the default role for new sign-ups to pending, user, or admin, providing flexibility in managing user permissions and access levels for new users.

🔒 Prevent New Sign-Ups: Enable the option to disable new user sign-ups, restricting access to the platform and maintaining a fixed number of users.

🔒 Prevent Chat Deletion: Ability for admins to toggle a setting that prevents all users from deleting their chat messages, ensuring that all chat messages are retained for audit or compliance purposes.

🔗 Webhook Integration: Subscribe to new user sign-up events via webhook (compatible with Discord, Google Chat, Slack and Microsoft Teams), providing real-time notifications and automation capabilities.

📣 Configurable Notification Banners: Admins can create customizable banners with persistence in config.json, featuring options for content, background color (info, warning, error, or success), and dismissibility. Banners are accessible only to logged-in users, ensuring the confidentiality of sensitive information.

🛡️ Model Whitelisting: Enhance security and access control by allowing admins to whitelist models for users with the user role, ensuring that only authorized models can be accessed.

🔑 Admin Control for Community Sharing: Admins can enable or disable community sharing for all users via a toggle in the Admin Panel > Settings menu. This toggle allows admins to manage accessibility and privacy, ensuring a secure environment. Admins have the option of enabling or disabling the Share on Community button for all users, which allows them to control community engagement and collaboration.

📧 Trusted Email Authentication: Optionally authenticate using a trusted email header, adding an extra layer of security and authentication to protect your Open WebUI instance.

🔒 Backend Reverse Proxy Support: Bolster security through direct communication between Open WebUI's backend and Ollama. This key feature eliminates the need to expose Ollama over the local area network (LAN). Requests made to the /ollama/api route from Open WebUI are seamlessly redirected to Ollama from the backend, enhancing overall system security and providing an additional layer of protection.

🔒 Authentication: Please note that Open WebUI does not natively support federated authentication schemes such as SSO, OAuth, SAML, or OIDC. However, it can be configured to delegate authentication to an authenticating reverse proxy, effectively achieving a Single Sign-On (SSO) experience. This setup allows you to centralize user authentication and management, enhancing security and user convenience. By integrating Open WebUI with an authenticating reverse proxy, you can leverage existing authentication systems and streamline user access to Open WebUI. For more information on configuring this feature, please refer to the Federated Authentication Support.

🔓 Optional Authentication: Enjoy the flexibility of disabling authentication by setting WEBUI_AUTH to False. This is an ideal solution for fresh installations without existing users or can be useful for demonstration purposes.

🚫 Advanced API Security: Block API users based on customized model filters, enhancing security and control over API access.

❗ Administrator Updates: Ensure administrators stay informed with immediate update notifications upon login, keeping them up-to-date on the latest changes and system statuses.

👥 User Group Management: Create and manage user groups for seamless organization and control.

🔐 Group-Based Access Control: Set granular access to models, knowledge, prompts, and tools based on user groups, allowing for more controlled and secure environments.

🛠️ Granular User Permissions: Easily manage workspace permissions, including file uploads, deletions, edits, and temporary chats, as well as model, knowledge, prompt, and tool creation.

🔑 LDAP Authentication: Enhance security and scalability with LDAP support for user management.

🔐 SCIM 2.0 Provisioning: Automate user and group lifecycle management through SCIM 2.0 protocol integration with identity providers like Okta, Azure AD, and Google Workspace, reducing administrative overhead and ensuring synchronized user management across systems.

🌐 Customizable OpenAI Connections: Enjoy smooth operation with custom OpenAI setups, including prefix ID support and explicit model ID support for APIs.

🔐 Ollama API Key Management: Manage Ollama credentials, including prefix ID support, for secure and efficient operation.

🔄 Connection Management: Easily enable or disable individual OpenAI and Ollama connections as needed.

🎨 Intuitive Model Workspace: Manage models across users and groups with a redesigned and user-friendly interface.

🔑 API Key Authentication: Tighten security by easily enabling or disabling API key authentication.

🔄 Unified Model Reset: Reset and remove all models from the Admin Settings with a one-click option.

🔓 Flexible Model Access Control: Easily bypass model access controls for user roles when not required, using the 'BYPASS_MODEL_ACCESS_CONTROL' environment variable, simplifying workflows in trusted environments.

🔒 Configurable API Key Authentication Restrictions: Flexibly configure endpoint restrictions for API key authentication, now off by default for a smoother setup in trusted environments.

---

## 🚚 Migration Guide: Open WebUI 0.4 to 0.5

**URL:** https://docs.openwebui.com/features/plugin/migration/

**Contents:**
- 🚚 Migration Guide: Open WebUI 0.4 to 0.5
- 🧐 What Has Changed and Why?​
  - Key Changes:​
    - Example:​
- ✅ Step-by-Step Migration Guide​
  - 🔄 1. Shifting from apps to routers​
  - 📜 An Important Example​
  - 👩‍💻 2. Updating Import Statements​
    - Before:​
    - After:​

Welcome to the Open WebUI 0.5 migration guide! If you're working on existing projects or building new ones, this guide will walk you through the key changes from version 0.4 to 0.5 and provide an easy-to-follow roadmap for upgrading your Functions. Let's make this transition as smooth as possible! 😊

With Open WebUI 0.5, we’ve overhauled the architecture to make the project simpler, more unified, and scalable. Here's the big picture:

Here’s an overview of what changed:

Apps have been moved to Routers.

Main app structure simplified.

Choose the approach that best fits your use case!

📌 Why did we make these changes?

Follow this guide to smoothly update your project.

All apps have been renamed and relocated under open_webui.routers. This affects imports in your codebase.

Quick changes for import paths:

To clarify the special case of the main app (webui), here’s a simple rule of thumb:

In general, just replace open_webui.apps with open_webui.routers—except for webui, which is now open_webui.main!

Let’s look at what this update looks like in your code:

Prioritize the unified endpoint (chat_completion) for simplicity and future compatibility.

Depending on your use case, you can choose between:

open_webui.main.chat_completion:

open_webui.utils.chat.generate_chat_completion:

We’ve updated the function signatures to better fit the new architecture. If you're looking for a direct replacement, start with the lightweight utility function generate_chat_completion from open_webui.utils.chat. For the full API flow, use the new unified chat_completion function in open_webui.main.

If you're using chat_completion, here’s how your function should look now:

Let’s rewrite a sample function to match the new structure:

Here’s a quick cheat sheet to remember:

That's it! You've successfully migrated from Open WebUI 0.4 to 0.5. By refactoring your imports, using the unified endpoint, and updating function signatures, you'll be fully equipped to leverage the latest features and improvements in version 0.5.

💬 Questions or Feedback? If you run into any issues or have suggestions, feel free to open a GitHub issue or ask in the community forums!

**Examples:**

Example 1 (python):
```python
# Full API flow with parsing (new function):from open_webui.main import chat_completion# Lightweight, direct POST request (direct successor):from open_webui.utils.chat import generate_chat_completion
```

Example 2 (python):
```python
class Pipe:    def __init__(self):        pass    async def pipe(        self,        body: dict,        __user__: dict,        __request__: Request, # New parameter    ) -> str:        # Write your function here
```

Example 3 (python):
```python
from open_webui.apps.webui.models import SomeModel
```

Example 4 (python):
```python
from open_webui.models import SomeModel
```

---

## 🌟 OpenAPI Tool Servers

**URL:** https://docs.openwebui.com/features/plugin/tools/openapi-servers/

**Contents:**
- 🌟 OpenAPI Tool Servers
- ☝️ Why OpenAPI?​
- 🚀 Quickstart​
  - With Bash​
  - With Docker​
- 🌱 Open WebUI Community​

We are hiring! Shape the way humanity engages with intelligence.

This repository provides reference OpenAPI Tool Server implementations making it easy and secure for developers to integrate external tooling and data sources into LLM agents and workflows. Designed for maximum ease of use and minimal learning curve, these implementations utilize the widely adopted and battle-tested OpenAPI specification as the standard protocol.

By leveraging OpenAPI, we eliminate the need for a proprietary or unfamiliar communication protocol, ensuring you can quickly and confidently build or integrate servers. This means less time spent figuring out custom interfaces and more time building powerful tools that enhance your AI applications.

Established Standard: OpenAPI is a widely used, production-proven API standard backed by thousands of tools, companies, and communities.

No Reinventing the Wheel: No additional documentation or proprietary spec confusion. If you build REST APIs or use OpenAPI today, you're already set.

Easy Integration & Hosting: Deploy your tool servers externally or locally without vendor lock-in or complex configurations.

Strong Security Focus: Built around HTTP/REST APIs, OpenAPI inherently supports widely used, secure communication methods including HTTPS and well-proven authentication standards (OAuth, JWT, API Keys).

Future-Friendly & Stable: Unlike less mature or experimental protocols, OpenAPI promises reliability, stability, and long-term community support.

Get started quickly with our reference FastAPI-based implementations provided in the servers/ directory. (You can adapt these examples into your preferred stack as needed, such as using FastAPI, FastOpenAPI or any other OpenAPI-compatible library):

The filesystem server should be reachable from: http://localhost:8000

The documentation path will be: http://localhost:8000

If you have docker compose installed, bring the servers up with:

The services will be reachable from:

Now, simply point your OpenAPI-compatible clients or AI agents to your local or publicly deployed URL—no configuration headaches, no complicated transports.

**Examples:**

Example 1 (bash):
```bash
git clone https://github.com/open-webui/openapi-serverscd openapi-servers
```

Example 2 (bash):
```bash
# Example: Installing dependencies for a specific server 'filesystem'cd servers/filesystempip install -r requirements.txtuvicorn main:app --host 0.0.0.0 --reload
```

Example 3 (bash):
```bash
docker compose up
```

---

## 🪄 Special Arguments

**URL:** https://docs.openwebui.com/features/plugin/development/reserved-args

**Contents:**
- 🪄 Special Arguments
  - body​
  - __user__​
  - __metadata__​
  - __model__​
  - __messages__​
  - __chat_id__​
  - __session_id__​
  - __message_id__​
  - __event_emitter__​

This tutorial is a community contribution and is not supported by the Open WebUI team. It serves only as a demonstration on how to customize Open WebUI for your specific use case. Want to contribute? Check out the contributing tutorial.

When developping your own Tools, Functions (Filters, Pipes or Actions), Pipelines etc, you can use special arguments explore the full spectrum of what Open-WebUI has to offer.

This page aims to detail the type and structure of each special argument as well as provide an example.

A dict usually destined to go almost directly to the model. Although it is not strictly a special argument, it is included here for easier reference and because it contains itself some special arguments.

A dict with user information.

Note that if the UserValves class is defined, its instance has to be accessed via __user__["valves"]. Otherwise, the valves keyvalue is missing entirely from __user__.

A dict with wide ranging information about the chat, model, files, etc.

A dict with information about the model.

A list of the previous messages.

See the body["messages"] value above.

The str of the chat_id.

See the __metadata__["chat_id"] value above.

The str of the session_id.

See the __metadata__["session_id"] value above.

The str of the message_id.

See the __metadata__["message_id"] value above.

A Callable used to display event information to the user.

A Callable used for Actions.

A list of files sent via the chat. Note that images are not considered files and are sent directly to the model as part of the body["messages"] list.

The actual binary of the file is not part of the arguments for performance reason, but the file remain nonetheless accessible by its path if needed. For example using docker the python syntax for the path could be:

Note that the same files dict can also be accessed via __metadata__["files"] (and its value is [] if no files are sent) or via body["files"] (but the files key is missing entirely from body if no files are sent).

An instance of fastapi.Request. You can read more in the migration page or in fastapi's documentation.

A str for the type of task. Its value is just a shorthand for __metadata__["task"] if present, otherwise None.

A dict containing the body needed to accomplish a given __task__. Its value is just a shorthand for __metadata__["task_body"] if present, otherwise None.

Its structure is the same as body above, with modifications like using the appropriate model and system message etc.

A list of ToolUserModel instances.

For details the attributes of ToolUserModel instances, the code can be found in tools.py.

**Examples:**

Example 1 (json):
```json
{  "stream": true,  "model": "my-cool-model",  # lowercase string with - separated words: this is the ID of the model  "messages": [    {      "role": "user",      "content": [        {          "type": "text",          "text": "What is in this picture?"        },        {          "type": "image_url",          "image_url": {            "url": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAdYAAAGcCAYAAABk2YF[REDACTED]"            # Images are passed as base64 encoded data          }        }      ]    },    {      "role": "assistant",      "content": "The image appears to be [REDACTED]"    },  ],  "features": {    "image_generation": false,    "code_interpreter": false,    "web_search": false  },  "stream_options": {    "include_usage": true  },  "metadata": "[The exact same dict as __metadata__]",  "files": "[The exact same list as __files__]"}
```

Example 2 (json):
```json
{  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",  "email": "cheesy_dude@openwebui.com",  "name": "Patrick",  "role": "user",  # role can be either `user` or `admin`  "valves": "[the UserValve instance]"}
```

Example 3 (json):
```json
{  "user_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",  "chat_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",  "message_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",  "session_id": "xxxxxxxxxxxxxxxxxxxx",  "tool_ids": null,  # tool_ids is a list of str.  "tool_servers": [],  "files": "[Same as in body['files']]",  # If no files are given, the files key exists in __metadata__ and its value is []  "features": {    "image_generation": false,    "code_interpreter": false,    "web_search": false  },  "variables": {    "{{USER_NAME}}": "cheesy_username",    "{{USER_LOCATION}}": "Unknown",    "{{CURRENT_DATETIME}}": "2025-02-02 XX:XX:XX",    "{{CURRENT_DATE}}": "2025-02-02",    "{{CURRENT_TIME}}": "XX:XX:XX",    "{{CURRENT_WEEKDAY}}": "Monday",    "{{CURRENT_TIMEZONE}}": "Europe/Berlin",    "{{USER_LANGUAGE}}": "en-US"  },  "model": "[The exact same dict as __model__]",  "direct": false,  "function_calling": "native",  "type": "user_response",  "interface": "open-webui"}
```

Example 4 (json):
```json
{  "id": "my-cool-model",  "name": "My Cool Model",  "object": "model",  "created": 1746000000,  "owned_by": "openai",  # either openai or ollama  "info": {      "id": "my-cool-model",      "user_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",      "base_model_id": "gpt-4o",      # this is the name of model that the model endpoint serves      "name": "My Cool Model",      "params": {      "system": "You are my best assistant. You answer [REDACTED]",      "function_calling": "native"      # custom options appear here, for example "Top K"      },      "meta": {      "profile_image_url": "/static/favicon.png",      "description": "Description of my-cool-model",      "capabilities": {          "vision": true,          "usage": true,          "citations": true      },      "position": 17,      "tags": [          {          "name": "for_friends"          },          {          "name": "vision_enabled"          }      ],      "suggestion_prompts": null      },      "access_control": {      "read": {          "group_ids": [],          "user_ids": []      },      "write": {          "group_ids": [],          "user_ids": []      }      },      "is_active": true,      "updated_at": 1740000000,      "created_at": 1740000000  },  "preset": true,  "actions": [],  "tags": [      {          "name": "for_friends"      },      {          "name": "vision_enabled"      }  ]}
```

---

## 🛠️ Tools & Functions

**URL:** https://docs.openwebui.com/features/plugin/

**Contents:**
- 🛠️ Tools & Functions
- TL;DR​
- What are "Tools" and "Functions"?​
  - Tools​
    - Example of a Tool:​
    - Examples of Tools (extending LLM’s abilities):​
  - Functions​
    - Let's break that down:​
  - Where to Find and Manage Functions​
  - Summary of Differences:​

Imagine you've just stumbled upon Open WebUI, or maybe you're already using it, but you're a bit lost with all the talk about "Tools", "Functions", and "Pipelines". Everything sounds like some mysterious tech jargon, right? No worries! Let's break it down piece by piece, super clearly, step by step. By the end of this, you'll have a solid understanding of what these terms mean, how they work, and why know it's not as complicated as it seems.

Getting started with Tools and Functions is easy because everything’s already built into the core system! You just click a button and import these features directly from the community, so there’s no coding or deep technical work required.

Let's start by thinking of Open WebUI as a "base" software that can do many tasks related to using Large Language Models (LLMs). But sometimes, you need extra features or abilities that don't come out of the box—this is where tools and functions come into play.

Tools are an exciting feature because they allow LLMs to do more than just process text. They provide external abilities that LLMs wouldn't otherwise have on their own.

Imagine you're chatting with an LLM and you want it to give you the latest weather update or stock prices in real time. Normally, the LLM can't do that because it's just working on pre-trained knowledge. This is where tools come in!

Tools are essentially abilities you’re giving your AI to help it interact with the outside world. By adding these, the LLM can "grab" useful information or perform specialized tasks based on the context of the conversation.

While tools are used by the AI during a conversation, functions help extend or customize the capabilities of Open WebUI itself. Imagine tools are like adding new ingredients to a dish, and functions are the process you use to control the kitchen! 🚪

For instance, maybe you want to:

Without functions, these would all be out of reach. But with this framework in Open WebUI, you can easily extend these features!

Functions are not located in the same place as Tools.

Both are designed to be pluggable, meaning you can easily import them into your system with just one click from the community! 🎉 You won’t have to spend hours coding or tinkering with them.

And then, we have Pipelines… Here’s where things start to sound pretty technical—but don’t despair.

Pipelines are part of an Open WebUI initiative focused on making every piece of the WebUI inter-operable with OpenAI’s API system. Essentially, they extend what both Tools and Functions can already do, but now with even more flexibility. They allow you to turn features into OpenAI API-compatible formats. 🧠

You likely won't need pipelines unless you're dealing with super-advanced setups.

In most cases, as a beginner or even an intermediate user, you won’t have to worry about pipelines. Just focus on enjoying the benefits that tools and functions bring to your Open WebUI experience!

Jump into Open WebUI, head over to the community section, and try importing a tool like weather updates or maybe adding a new feature to the toolbar with a function. Exploring these tools will show you how powerful and flexible Open WebUI can be!

🌟 There's always more to learn, so stay curious and keep experimenting!

---

## ⚙️ What are Tools?

**URL:** https://docs.openwebui.com/features/plugin/tools

**Contents:**
- ⚙️ What are Tools?
- 🧩 Tooling Taxonomy: Which "Tool" are you using?​
  - 1. Native Features (Built-in)​
  - 2. Workspace Tools (Custom Plugins)​
  - 3. MCP (Model Context Protocol) 🔌​
  - 4. OpenAPI / Function Calling Servers​
- 📦 How to Install & Manage Workspace Tools​
- 🔧 How to Use Tools in Chat​
  - Option 1: Enable on-the-fly (Specific Chat)​
  - Option 2: Enable by Default (Global/Model Level)​

Tools are the various ways you can extend an LLM's capabilities beyond simple text generation. When enabled, they allow your chatbot to do amazing things — like search the web, scrape data, generate images, talk back using AI voices, and more.

Because there are several ways to integrate "Tools" in Open WebUI, it's important to understand which type you are using.

Users often encounter the term "Tools" in different contexts. Here is how to distinguish them:

These are deeply integrated into Open WebUI and generally don't require external scripts.

These are Python scripts that run directly within the Open WebUI environment.

MCP is an open standard that allows LLMs to interact with external data and tools.

Generic web servers that provide an OpenAPI (.json or .yaml) specification. Open WebUI can ingest these specs and treat every endpoint as a tool.

Workspace Tools are the most common way to extend your instance with community features.

Never import a Tool you don’t recognize or trust. These are Python scripts and might run unsafe code on your host system. Crucially, ensure you only grant "Tool" permissions to trusted users, as the ability to create or import tools is equivalent to the ability to run arbitrary code on the server.

Once installed or connected, here’s how to enable them for your conversations:

While chatting, click the ➕ (plus) icon in the input area. You’ll see a list of available Tools — you can enable them specifically for that session.

You can also let your LLM auto-select the right Tools using the AutoTool Filter.

Once Tools are enabled, Open WebUI gives you two different ways to let your LLM interact with them. You can switch this via the chat settings:

Here, your LLM doesn’t need to natively support function calling. We guide the model using a smart tool-selection prompt template to select and use a Tool.

✅ Works with practically any model (including smaller local models).

💡 Admin Note: You can also toggle the default mode for each specific model in the Admin Panel > Settings > Models > Advanced Parameters.

❗ Not as reliable as Native Mode when chaining multiple complex tools.

If your model supports native function calling (like GPT-4o, Gemini, Claude, or GPT-5), use this for a faster, more accurate experience where the LLM decides exactly when and how to call tools.

Tools bring your AI to life by giving it hands to interact with the world.

---

## ⚙️ What are Tools?

**URL:** https://docs.openwebui.com/features/plugin/tools/

**Contents:**
- ⚙️ What are Tools?
- 🧩 Tooling Taxonomy: Which "Tool" are you using?​
  - 1. Native Features (Built-in)​
  - 2. Workspace Tools (Custom Plugins)​
  - 3. MCP (Model Context Protocol) 🔌​
  - 4. OpenAPI / Function Calling Servers​
- 📦 How to Install & Manage Workspace Tools​
- 🔧 How to Use Tools in Chat​
  - Option 1: Enable on-the-fly (Specific Chat)​
  - Option 2: Enable by Default (Global/Model Level)​

Tools are the various ways you can extend an LLM's capabilities beyond simple text generation. When enabled, they allow your chatbot to do amazing things — like search the web, scrape data, generate images, talk back using AI voices, and more.

Because there are several ways to integrate "Tools" in Open WebUI, it's important to understand which type you are using.

Users often encounter the term "Tools" in different contexts. Here is how to distinguish them:

These are deeply integrated into Open WebUI and generally don't require external scripts.

These are Python scripts that run directly within the Open WebUI environment.

MCP is an open standard that allows LLMs to interact with external data and tools.

Generic web servers that provide an OpenAPI (.json or .yaml) specification. Open WebUI can ingest these specs and treat every endpoint as a tool.

Workspace Tools are the most common way to extend your instance with community features.

Never import a Tool you don’t recognize or trust. These are Python scripts and might run unsafe code on your host system. Crucially, ensure you only grant "Tool" permissions to trusted users, as the ability to create or import tools is equivalent to the ability to run arbitrary code on the server.

Once installed or connected, here’s how to enable them for your conversations:

While chatting, click the ➕ (plus) icon in the input area. You’ll see a list of available Tools — you can enable them specifically for that session.

You can also let your LLM auto-select the right Tools using the AutoTool Filter.

Once Tools are enabled, Open WebUI gives you two different ways to let your LLM interact with them. You can switch this via the chat settings:

Here, your LLM doesn’t need to natively support function calling. We guide the model using a smart tool-selection prompt template to select and use a Tool.

✅ Works with practically any model (including smaller local models).

💡 Admin Note: You can also toggle the default mode for each specific model in the Admin Panel > Settings > Models > Advanced Parameters.

❗ Not as reliable as Native Mode when chaining multiple complex tools.

If your model supports native function calling (like GPT-4o, Gemini, Claude, or GPT-5), use this for a faster, more accurate experience where the LLM decides exactly when and how to call tools.

Tools bring your AI to life by giving it hands to interact with the world.

---
