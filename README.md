# Deploy and Host ChatGPT-on-WeChat (CowAgent) on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/wechat?referralCode=sLjDXb&utm_medium=integration&utm_source=button&utm_campaign=wechat)

CowAgent, the project formerly called ChatGPT-on-WeChat, is an open-source AI assistant and agent. It chats, plans tasks, runs tools and skills, remembers what you tell it, and answers you in a web console or on the messaging apps you already use: WeChat, Feishu, DingTalk, WeCom, Telegram, Slack and Discord. It works with OpenAI, Claude, DeepSeek, Gemini, Qwen, Kimi, GLM and any OpenAI-compatible API. This template runs CowAgent 2.2.2 on Railway as one service, behind a generated password, with a volume that keeps its settings, memory and chats across redeploys.

This is a community template, not made or supported by the CowAgent project. It is not affiliated with Tencent, WeChat or OpenAI.

## About Hosting ChatGPT-on-WeChat (CowAgent)

The web console and the agent run in one container on your Railway domain. Nothing else is needed.

**Sign in:** open your Railway domain and enter `WEB_PASSWORD`, which the template generates. Find it in the service's **Variables** tab. To change it, edit the variable there, not in the console: the variable is applied on every boot and wins over a password saved in the console.

**Add a model:** set one provider key in the template (`OPEN_AI_API_KEY`, `CLAUDE_API_KEY`, `DEEPSEEK_API_KEY`, `GEMINI_API_KEY`, `DASHSCOPE_API_KEY`, `MOONSHOT_API_KEY` or `ZHIPU_AI_API_KEY`) and `MODEL`, or leave them empty and add providers later under **Settings** in the console. With no key the console still opens; the agent answers once a model is set. For OpenRouter or another OpenAI-compatible service, use `OPEN_AI_API_KEY` with its base URL in `OPEN_AI_API_BASE`, or add it as a custom provider in the console.

**Connect a channel:** the web console works right away. Other channels are connected from the console or with `CHANNEL_TYPE` plus that channel's settings:

- Telegram, Slack, Discord, Feishu, DingTalk and WeCom bots use official bot APIs and work from a server.
- Personal WeChat (`weixin`) logs in by QR code as your own account. WeChat often blocks or limits logins from datacenter addresses like Railway's, so expect it to fail or get your account flagged. Use a WeCom bot or a WeChat Official Account for anything that matters.

## Common Use Cases

- A personal AI assistant you reach from the browser, Telegram, Feishu or DingTalk, with long-term memory
- A team bot in a Feishu, DingTalk, WeCom or Slack group that answers questions from your own knowledge base
- Scheduled agent tasks: daily summaries, web research and reports sent to a chat

## Dependencies for ChatGPT-on-WeChat (CowAgent) Hosting

- An API key for at least one LLM provider. Everything else, including a headless Chromium for the browser tool, is in the image.

### Deployment Dependencies

- [CowAgent on GitHub](https://github.com/zhayujie/CowAgent)
- [CowAgent documentation](https://docs.cowagent.ai/)
- [Channel guides](https://docs.cowagent.ai/channels/index)
- [Template source](https://github.com/two-workspaces/cowagent)

### Implementation Details

- **Tested on Railway:** the console behind the password (a wrong password and requests with no login are refused), a model set from the console through an OpenAI-compatible API, chat replies, the agent running shell commands and a headless Chromium page, and settings and chats surviving a redeploy. Telegram, Slack, Discord, Feishu, DingTalk, WeCom and WeChat channels were not tested.
- **Memory:** about 75 MB idle in our test, so it fits a 0.5 GB plan. The browser tool starts Chromium only while it runs and needs a few hundred MB more for that time.
- **Your data** lives on the volume at `/home/agent/cow`: the agent's workspace, memory, skills and knowledge, and in `.cow` inside it `config.json`, logs and channel credentials. Turn on volume backups in the service's **Backups** tab.
- **The agent has full access to its container** (`agent_permission_mode` is `full-access`, upstream's Docker default). It can run any command there, but not outside the container. Lower it in the console if you share the bot with others.
- **Variables win over the console:** any template variable you fill in is applied on every boot, over what was saved in the console. Leave a variable empty to manage that setting in the console.
- **Keep `WEB_PASSWORD` set.** CowAgent only listens publicly while a password is set; with it empty the service stays private and Railway's healthcheck fails.
- **Login lockout:** after repeated wrong passwords CowAgent locks the login for a while. All visitors arrive through Railway's proxy, so the lock applies to everyone for that time.
- **Language:** `COW_LANG=auto` picks the language by itself and may choose Chinese. Set `en` or `zh` to fix it.
- **Image:** upstream's `zhayujie/chatgpt-on-wechat:2.2.2`, pinned and unmodified.

## Why Deploy ChatGPT-on-WeChat (CowAgent) on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying ChatGPT-on-WeChat (CowAgent) on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
