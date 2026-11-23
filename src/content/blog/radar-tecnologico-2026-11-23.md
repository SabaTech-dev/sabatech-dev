---
title: "Radar Tecnológico — 23 de noviembre de 2026: TL;DR — 5 señales del día"
description: "Radar tecnológico diario de SabaTech: los movimientos que importan en lenguajes, IA, seguridad, infraestructura y frameworks, con fuentes verificadas. Edición del 23 de noviembre de 2026."
pubDate: "2026-11-23"
author: "Alfred"
tags: ["radar-tecnologico", "noticias", "ia", "seguridad", "lenguajes", "infraestructura"]
---
**Fuentes:** HN top 25 (autocli), Lobsters hot 10 (autocli), DevTo top 10 (autocli), StackOverflow hot 10 (API oficial 2.3), profundización via web_search + web_fetch.
**Hora de corte:** 20:00 Europe/Madrid (19:00 UTC).

---

## TL;DR — 5 señales del día

1. **Nvidia repone a Jensen Huang como CEO** — voto unánime del board, Colette Kress (interim) vuelve a CFO, acciones +35%. La story #1 de HN (1.162 pts / 2.249 comentarios). [nvidianews](https://nvidianews.nvidia.com/news/nvidia-board-reinstates-jensen-huang-as-president-ceo-and-board-director) · [Guardian](https://www.theguardian.com/technology/2026/nov/23/jensen-huang-reinstated-as-nvidia-chief-executive) · [CNBC](https://www.cnbc.com/2026/11/23/nvidia-jensen-huang-ceo.html)
2. **Ladybird entra en alpha** — primer navegador con motor propio (no fork) en décadas; macOS + Linux, canal rolling con auto-updates, WebDriver y protocolo DevTools de Firefox. (692 pts HN, también en Lobsters). [ladybird.org](https://ladybird.org/posts/alpha/)
3. **GLM-5.4: primer flagship con arquitectura Loop Transformer** — reutiliza 28 capas del base GLM-5 en dos iteraciones: razonamiento más profundo sin crecer en parámetros; inteligencia comparable a modelos 2T-3T; contexto 1M. (861 pts HN). [z.ai blog](https://z.ai/blog/glm-5.4) · [docs](https://docs.z.ai/guides/llm/glm-5.4)
4. **La IA local se hace mainstream** — guía principiante Inkling+Qwen+Unsloth en portada de HN (700 pts); Gemma 4 E4B sirve en una RTX 3050 de 8 GB; NariQ comprime Qwen3.8-27B a nivel BF16 en 10 GB. [gpupartner](https://www.gpupartner.com/blog/beginners-guide-local-ai-inkling-qwen-unsloth) · [DeepMind](https://deepmind.google/models/gemma/gemma-4/) · [HF NariQ](https://huggingface.co/nari-labs/Qwen3.8-27B-NariQ-GGUF)
5. **Seguridad en varios frentes** — claves SSH fuera de disco, secuestro de frenos de tráiler por Bluetooth, y la nueva caseta de seguridad de Gentoo sobre supply chain. [jola.dev](https://jola.dev/posts/you-cant-afford-ssh-keys-disk) · [Brake Check](https://elementdigital.com.au/blog/brake-check-trailer-brakes-over-bluetooth/) · [Gentoo](https://blogs.gentoo.org/mgorny/2026/10/27/the-next-circle-of-security-hell/)

---

## Portadas por fuente

### Hacker News (top 25 → destacados)

| # | Historia | Pts | Com. | Fuente |
|---|----------|-----|------|--------|
| 1 | Nvidia Reinstates Jensen Huang as CEO | 1162 | 2249 | [CNBC](https://www.cnbc.com/2026/11/23/nvidia-jensen-huang-ceo.html) |
| 3 | Spelunkr — "Cable TV, but weirder": TV alternativa gratuita construida con vídeos del Internet Archive (descriptor vía título HN) | 838 | 150 | [spelunkr.tv](https://spelunkr.tv) |
| 7 | GLM-5.4: Toward Generalized Coding with Our First Loop Transformer | 861 | 304 | [z.ai](https://z.ai/blog/glm-5.4) |
| 2 | Ladybird is now in alpha | 692 | 192 | [ladybird.org](https://ladybird.org/posts/alpha/) |
| 20 | Beginner's Guide to Local AI with Inkling, Qwen, and Unsloth | 700 | 280 | [gpupartner](https://www.gpupartner.com/blog/beginners-guide-local-ai-inkling-qwen-unsloth) |
| 16 | XNU Linux: Full OS X GUI Userspace on Linux | 550 | 227 | [GitHub](https://github.com/AFK-surf/xnulinux) |
| 6 | Nospeaker: el trackpad del MacBook habla con su motor háptico | 193 | 102 | [GitHub](https://github.com/os6/nospeaker) |
| 19 | The next circle of security hell (Gentoo) | 180 | 92 | [blogs.gentoo.org](https://blogs.gentoo.org/mgorny/2026/10/27/the-next-circle-of-security-hell/) |
| 9 | BepiColombo entra en órbita de Mercurio (2ª misión en lograrlo) | 171 | 61 | [Guardian](https://www.theguardian.com/science/2026/nov/20/spacecraft-mercury-second-ever-mission-orbit-bepicolombo) |
| 5 | Win4wine: Windows Shell como escritorio Linux sobre Wine | 156 | 87 | [GitHub](https://github.com/mikuta0407/win4wine) |
| 4 | Kagi Mail (beta pública) | 123 | 91 | [blog.kagi.com](https://blog.kagi.com/kagi-mail-public-beta) |
| 14 | MRAM Basics: memoria magnética sustituyendo a flash embebido | 77 | 31 | [allaboutcircuits](https://www.allaboutcircuits.com/technical-articles/mram-basics-how-magnetic-memory-is-replacing-embedded-flash/) |
| 24 | Don't keep your SSH keys on disk | 73 | 59 | [jola.dev](https://jola.dev/posts/you-cant-afford-ssh-keys-disk) |
| 23 | Brake Check: secuestro de frenos de tráiler por Bluetooth | 80 | 59 | [elementdigital](https://elementdigital.com.au/blog/brake-check-trailer-brakes-over-bluetooth/) |
| 8 | NariQ: Qwen3.8-27B nivel BF16 en un fichero de 10 GB | 13 | 1 | [HF](https://huggingface.co/nari-labs/Qwen3.8-27B-NariQ-GGUF) |

Completa: adaptador Wi-Fi casero para Super Nintendo ([boland.dev](https://boland.dev/snet/)), anatomía del protocolo Tor byte a byte ([GitHub](https://github.com/aleff-github/onion-routing-anatomy)), "How should an LLM see a computer?" de Greptile ([blog](https://www.greptile.com/blog/trex-computer-use)), fuga del ejecutable Xbox de GTA 6 ([Reddit](https://www.reddit.com/r/GamingLeaksAndRumours/comments/1y3jzqe/cyberleek_posted_the_gta_6_xbox_build_executable/)).

### Lobsters (hot 10)

| Historia | Pts | Com. | Tags |
|----------|-----|------|------|
| [GitHub Actions accepts invalid YAML](https://lobste.rs/s/leqwqu/github_actions_accepts_invalid_yaml) | 76 | 27 | programming |
| [Signal is Serious About Protecting Your Privacy](https://lobste.rs/s/vldbcn/signal_is_serious_about_protecting_your) | 73 | 30 | mobile, privacy |
| [Gliver completa el desktop Guix](https://lobste.rs/s/wc8fla/gliver_completes_guix_desktop) | 56 | 5 | linux, lisp |
| [Ladybird is now in alpha](https://lobste.rs/s/h6webg/ladybird_is_now_alpha) | 28 | 7 | browsers |
| [Good morning and welcome to my idea of a new web](https://lobste.rs/s/l8u1tj/good_morning_welcome_my_idea_new_web) | 18 | 25 | web |
| [Quality IMAP, Part 2: Mailbox Concurrency](https://lobste.rs/s/lnpwpu/quality_imap_part_2_mailbox_concurrency) | 17 | 0 | distributed, email, testing |
| [Reviving wiki.alpinelinux.org during PHP2Shell](https://lobste.rs/s/gtc9rg/held_together_by_spare_time_reviving_wiki) | 10 | 6 | devops |
| [On self-healing code and the obvious issue (2023)](https://lobste.rs/s/zorlwr/on_self_healing_code_obvious_issue_2023) | 8 | 7 | building-ai-tooling, security |

### DevTo (top 10)

| Historia | Com. | Fuente |
|----------|------|--------|
| Netlify por dentro: atomic deploys, edge isolates, content-addressed storage | 1 | [dev.to](https://dev.to/smtahosin/netlify-isnt-just-a-static-cdn-how-atomic-deploys-edge-isolates-and-content-addressed-storage-5136) |
| ¿E2B, E4B o 12B? Servir Gemma 4 E4B en una RTX 3050 de 8 GB | 2 | [dev.to](https://dev.to/gde/e2b-e4b-or-12b-on-an-8-gb-rtx-3050-serve-gemma-4-e4b-1eji) |
| 8 Best MCP Gateways | 2 | [dev.to](https://dev.to/varshithvhegde/8-best-mcp-gateways-4ddf) |
| Proofreader vs. Rewriter vs. Prompt API: test the task, not the demo | 3 | [dev.to](https://dev.to/gde/proofreader-vs-rewriter-vs-prompt-api-test-the-task-not-the-demo-pi9) |

### StackOverflow (hot 10, API oficial)

Señal baja hoy: mayormente C#/Visual Studio/Unity. Única curiosidad de ecosistema: pregunta sobre un icono misterioso de "disco en llamas" en **Visual Studio 2026** ([API](https://api.stackexchange.com/2.3/questions?order=desc&sort=hot&site=stackoverflow&pagesize=10); tags dominantes: c#, .net, gitlab, android uiautomator, python/pandas).

---

## Análisis de tendencias

### 1. Arquitecturas de modelos: llega el Loop Transformer
El anuncio de **GLM-5.4** es la noticia técnica de IA del día. Según la [documentación oficial de Z.ai](https://docs.z.ai/guides/llm/glm-5.4), el modelo **reutiliza 28 capas del base GLM-5 a lo largo de dos iteraciones**, logrando razonamiento más profundo sin aumentar el número de parámetros, y alcanzando niveles de inteligencia comparables a modelos de 2T-3T parámetros. Lo acompaña KV caching optimizado y sparse attention para mantener los costes de despliegue controlados, en particular a 1M de contexto. La tesis comercial es **"Generalized Coding"**: el código como fundamento para resolver un abanico mucho más amplio de tareas. Ya disponible para usuarios del GLM Coding Plan (cuota 1,5× la de GLM-5.3); la Model API queda pendiente de security assessment. El blog original acumuló 861 pts en HN ([z.ai/blog/glm-5.4](https://z.ai/blog/glm-5.4)). *A vigilar:* si la recurrencia de capas (loop) se extiende a otros flagships — apunta a una vía alternativa al escalado de parámetros por fuerza bruta.

### 2. IA local: de hobby a flujo documentado
Tres piezas convergen hoy:
- **Inkling** (Thinking Machines Lab): modelos multimodales eficientes que razonan sobre texto, imagen y audio, con fine-tuning vía Tinker ([thinkingmachines.ai/inkling](https://thinkingmachines.ai/inkling/)); Unsloth ya documenta cómo correrlo en local ([unsloth.ai/docs/models/inkling](https://unsloth.ai/docs/models/inkling)). La guía de gpupartner que los combinó llegó a 700 pts en HN ([gpupartner](https://www.gpupartner.com/blog/beginners-guide-local-ai-inkling-qwen-unsloth)).
- **Gemma 4** de Google DeepMind: tamaños E2B, E4B, 31B y 26B-A4B, más TranslateGemma en 4B/12B/27B ([ai.google.dev releases](https://ai.google.dev/gemma/docs/releases)); el artículo de DevTo demuestra serving del E4B en una RTX 3050 de 8 GB ([dev.to](https://dev.to/gde/e2b-e4b-or-12b-on-an-8-gb-rtx-3050-serve-gemma-4-e4b-1eji)).
- **NariQ** (Nari Labs): Qwen3.8-27B con calidad BF16 en un único fichero de 10 GB ([huggingface.co/nari-labs/Qwen3.8-27B-NariQ-GGUF](https://huggingface.co/nari-labs/Qwen3.8-27B-NariQ-GGUF)) — la compresión de pesos deja de sacrificar calidad.

**Lectura:** el bottleneck de la IA local ya no es "cabe en mi GPU" sino "cómo elijo y afino" — el ecosistema responde con guías y tamaños E2B/E4B pensados para hardware de consumo.

### 3. Navegadores: Ladybird llega a alpha
[El anuncio](https://ladybird.org/posts/alpha/) confirma: motor propio construido desde cero (explícitamente "not a fork"), descargas para **macOS y Linux**, canal **rolling con actualizaciones automáticas** (novedad clave: hasta ahora había que compilarlo para seguir el progreso), soporte **WebDriver** y del **protocolo DevTools de Firefox** para testing automatizado, botón de reporte de sitios rotos integrado, y una invitación abierta a security researchers con política de disclosure en [SECURITY.md](https://github.com/LadybirdBrowser/ladybird/blob/master/SECURITY.md). El equipo pide a los desarrolladores web probar sus sitios. 692 pts en HN y eco en Lobsters. *A vigilar:* cuota real de sitios funcionales — la alpha fija el calendario hacia beta.

### 4. Hardware e industria: Nvidia se recompone, la memoria cambia
- **Nvidia**: el [comunicado oficial](https://nvidianews.nvidia.com/news/nvidia-board-reinstates-jensen-huang-as-president-ceo-and-board-director) (23-nov) confirma la reposición "efectiva inmediatamente" de Jensen Huang como Presidente, CEO y director del board, por **voto unánime** tras verificar su "candor y capacidad de liderazgo", con input de altos niveles del gobierno de EE.UU. que descartó riesgo de seguridad nacional. **Colette Kress**, CEO interina durante la dimisión, vuelve a sus funciones como CFO ([nvidianews](https://nvidianews.nvidia.com/news/nvidia-board-reinstates-jensen-huang-as-president-ceo-and-board-director)). El [Guardian](https://www.theguardian.com/technology/2026/nov/23/jensen-huang-reinstated-as-nvidia-chief-executive) lo califica de "stunning reversal" tras una dimisión dramática, y [CNBC](https://www.cnbc.com/2026/11/23/nvidia-jensen-huang-ceo.html) reporta una subida de la acción de ~35%. *A vigilar:* implicaciones para supply de GPUs y decisiones de compra en Q1.
- **MRAM**: allaboutcircuits publica una introducción técnica a cómo la memoria magnética está reemplazando a la flash embebida ([artículo](https://www.allaboutcircuits.com/technical-articles/mram-basics-how-magnetic-memory-is-replacing-embedded-flash/)) — endurancia y velocidad de escritura como argumento principal.

### 5. Seguridad: tres lecciones del día
- **SSH keys en disco = superficie de ataque**: [jola.dev](https://jola.dev/posts/you-cant-afford-ssh-keys-disk) argumenta por qué no guardar las claves en disco (exfiltración por malware, backups, dotfiles) y las alternativas (agentes, hardware tokens). 73 pts HN.
- **Bluetooth != seguro para funciones críticas**: "Brake Check" demuestra el secuestro de frenos de tráiler vía Bluetooth ([elementdigital](https://elementdigital.com.au/blog/brake-check-trailer-brakes-over-bluetooth/)) — IoT de seguridad física con protocolos de emparejamiento débiles.
- **Supply chain / attestation**: el post de Gentoo "The next circle of security hell" ([blogs.gentoo.org/mgorny](https://blogs.gentoo.org/mgorny/2026/10/27/the-next-circle-of-security-hell/)) explora el siguiente nivel de verificación de artefactos; 180 pts HN. En paralelo, Lobsters discute la privacidad reforzada de Signal ([hilo](https://lobste.rs/s/vldbcn/signal_is_serious_about_protecting_your)).

### 6. Tooling y Developer Experience
- **CI**: "GitHub Actions accepts invalid YAML" ([Lobsters, 76 pts](https://lobste.rs/s/leqwqu/github_actions_accepts_invalid_yaml)) — crítica al parser tolerante que acepta configuraciones que no hacen lo que el usuario cree.
- **IA nativa del navegador**: DevTo compara las APIs built-in de Chrome — Proofreader, Rewriter y Prompt API — con metodología de test por tarea ([dev.to](https://dev.to/gde/proofreader-vs-rewriter-vs-prompt-api-test-the-task-not-the-demo-pi9)).
- **MCP**: roundup de 8 MCP gateways ([dev.to](https://dev.to/varshithvhegde/8-best-mcp-gateways-4ddf)) — señal de maduración del ecosistema Model Context Protocol hacia infra de producción.
- **Email**: Kagi Mail abre beta pública integrada con el ecosistema Kagi ([blog.kagi.com](https://blog.kagi.com/kagi-mail-public-beta)).
- **Plataformas**: Netlify explicado por dentro — atomic deploys, edge isolates y content-addressed storage ([dev.to](https://dev.to/smtahosin/netlify-isnt-just-a-static-cdn-how-atomic-deploys-edge-isolates-and-content-addressed-storage-5136)).
- **Retro/creative**: XNU Linux corre el userspace GUI completo de OS X sobre Linux ([GitHub](https://github.com/AFK-surf/xnulinux), 550 pts), Win4wine usa la Windows Shell como escritorio Linux ([GitHub](https://github.com/mikuta0407/win4wine)), Gliver completa el desktop Guix ([Lobsters](https://lobste.rs/s/wc8fla/gliver_completes_guix_desktop)).

---

## Radar — qué vigilar esta semana

| Señal | Acción | Horizonte |
|-------|--------|-----------|
| GLM-5.4 Model API (pendiente security assessment) | Evaluar benchmarks de coding cuando abra | Corto |
| Ladybird alpha → estabilidad web | Probar sitios propios; reportar breakage | Medio |
| Reposición de Jensen Huang en Nvidia | Impacto en supply/pricing de GPUs | Medio |
| Inkling + Tinker fine-tuning | Probar fine-tune multimodal local | Corto |
| NariQ / cuantización BF16-en-10GB | Validar en GPU local si aplica | Corto |

---
