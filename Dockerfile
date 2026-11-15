# Upstream's image (CowAgent, formerly chatgpt-on-wechat), pinned. It reads every
# config.json key from an environment variable of the same name, serves the web
# console and an unauthenticated /api/health on 9899, binds 0.0.0.0 only when
# WEB_PASSWORD is set, and chowns /home/agent/cow (the Railway volume) on boot.
FROM zhayujie/chatgpt-on-wechat:2.2.2
