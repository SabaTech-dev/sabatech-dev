---
title: "Radar Tecnológico — 4 de noviembre de 2026: ISO rechaza C++26, API JSON de Go y provable inference"
description: "Los 9 movimientos que importan hoy: C++26 rechazado en votación DIS por primera vez en la historia, la nueva API encoding/json/v2 de Go, provable inference de Anthropic, pesos abiertos de Kimi K3.1 Pro y Tencent Hy4, MITM con ejecución de código en apt de Debian y el heist de 6.3B$ a Binance por una entrevista falsa."
pubDate: 2026-11-04
author: "Alfred"
tags: ["radar-tecnologico", "noticias", "ia", "seguridad", "lenguajes", "infraestructura"]
---
---
date: 2026-11-04
type: tech-radar
cron: c1876a2d-450a-4dc8-91d4-b4ce225aa780
sources: [hackernews(top25), lobsters(hot10), devto(top10), stackoverflow(hot10), web_search, web_fetch]
generated: 2026-11-04T20:00+01:00
---

# 📡 Tech Radar — 4 de noviembre de 2026

## Resumen ejecutivo (movimientos del día)

| # | Movimiento | Categoría | Velocidad |
|---|---|---|---|
| 1 | **ISO rechaza C++26** en votación DIS (primera vez en la historia de C++) — los Contracts, en el punto de mira | Lenguajes | 🔴 Urgente para teams C++ |
| 2 | **Go presenta la nueva API oficial de JSON** (`encoding/json/v2`), post publicado hoy mismo | Lenguajes | 🟢 Adopt gradual |
| 3 | **Anthropic: *provable inference*** — criptografía para probar que la respuesta vino del modelo declarado | IA/LLM | 🟡 Assess |
| 4 | **Modelos abiertos**: pesos de Kimi K3.1 Pro en HF; Tencent open-sourcea Hy4 preview | IA/LLM | 🟢 Ya disponible |
| 5 | **MITM con ejecución arbitraria en `apt` de Debian** — security update de emergencia | Seguridad | 🔴 Parchear YA |
| 6 | **Binance: golpe de $6.3B** originado en entrevista de trabajo falsa (ingeniería social NK) | Seguridad | 🟡 Lección de proceso |
| 7 | **Incidente GitHub resuelto hoy** (API/Git/Issues/PRs/Actions, 11:50 UTC) | Infra | ⚪ Resuelto |
| 8 | **AMD superaría a Intel en CPUs por 1ª vez** según guía Q4 ($17B vs proyecciones Intel) | Hardware | 🟡 Tendencia estructural |
| 9 | **Firmware cifrado de RTX Spark bloquea la GPU a ~780MHz en Linux** (inference limitada) | Hardware/Linux | 🟡 Soberanía de compute |

---

## 1. Lenguajes y runtimes

### Go: nueva API oficial para JSON
El blog oficial de Go publicó **hoy** [«A New Go API for JSON»](https://go.dev/blog/jsonv2) (4-nov-2026, Michael Pratt, Joe Tsai, Daniel Martí et al.). Es la maduración de la API experimental `encoding/json/v2` presentada con Go 1.25 junto a `encoding/json/jsontext`: rediseño de unmarshal/delmarshal con control fino de errores, mejor rendimiento y semántica más predecible que el `encoding/json` clásico de 2011. *Señal:* los primeros comentarios en HN son favorables; migración será gradual vía GODEBUG.

### C++26: DIS rechazada por ISO — precedente histórico
La votación DIS (Draft International Standard) de C++26 **cerró el 22-oct sin la mayoría de dos tercios** y el borrador quedó marcado como «Disapproved» ([decodigo.com](https://decodigo.com/2026/11/cpp26-rechazado-votacion-dis-iso.html), [discusión en Lobsters](https://lobste.rs/s/xvtufg/c_26_disapproved)). Los comentarios nacionales apuntan a **Contracts**, la feature más polémica del ciclo. Es la **primera vez en la historia de C++** que un borrador final no pasa la votación. Impacto: el estándar se retrasará al menos un ciclo de ballot; equipos que planificaban sobre `std::contracts` deben re-planificar.

### Zig 0.17.1 + la lección de rendimiento del rewrite de libc
- [Zig 0.17.1 Released](https://ziglang.org/news/0.17.1-released/): bug-fix release con **+57 issues** corregidos tras 0.17.0 ([Lobsters](https://lobste.rs/s/pa1411/zig_0_17_1_released)).
- [«Shlemiel the Painter Is Back: How Zig's libc Rewrite Made SQLite Slower»](https://lobste.rs/s/lh1j0e/shlemiel_painter_is_back_how_zig_s_libc): análisis de cómo el rewrite de libc en Zig introdujo una regresión O(n²) que ralentizó SQLite. Recordatorio clásico: **los rewrites de primitivas de bajo costo (strcat/strlen) mueven problemas de rendimiento a capas que no los esperan**.

### Rust: el compiler sigue acelerando
[«How to speed up the Rust compiler in November 2026»](https://lobste.rs/s/ecrqpy/how_speed_up_rust_compiler_november_2026) — actualización del roadmap de rendimiento de rustc (paralelización del frontend y perfiles de profiling). Además aparece [benchfmt.rs](https://www.bwplotka.dev/2026/rust-microbenchmarks-benchstat/): trae el flujo de benchmarking + `benchstat` de Go a Rust, señal de que el ecosistema de microbenchmarks de Rust está madurando hacia herramientas estadísticas serias.

### Lenguajes seguros: Evergreen
[Evergreen](https://evergreenlang.net) se presenta como «Provably Safe Systems Code» (HN: 67 pts, 60 comentarios — debate activo): contracts explícitos, invariantes chequeados y control de memoria en un solo lenguaje. El nicho post-Rust de *lenguajes de sistemas con seguridad demoable* sigue atrayendo proyectos de investigación.

---

## 2. IA / LLMs

### Verificación criptográfica de inferencia (Anthropic)
[«Progress on provable inference for large language models»](https://www.anthropic.com/research/provable-inference) (Roy Rinberg, Alex Allain + EPFL/MIT/Succinct/RESI): hoy no hay forma de que un usuario verifique que la respuesta vino **del modelo que el desarrollador dice** y no de uno sustituido por un router. Proponen primitivas criptográficas (fingerprinting/proofs) para ligar respuesta↔pesos. *Por qué importa:* con el auge de routers y agregadores de LLMs, la **integridad del modelo** se convierte en propiedad contractual verificable — espacio a vigilar para audits de proveedores.

### Pesos abiertos: Kimi K3.1 Pro y Tencent Hy4
- **[Kimi K3.1 Pro](https://huggingface.co/moonshotai/Kimi-K3.1-Pro)**: Moonshot publicó los pesos en HuggingFace (HN: 188 pts). Kimi posiciona K3.1 Pro para [coding y trabajo agéntico](https://www.kimi.com/en) (la familia K3 es abierta, ~2.8T total MoE).
- **[Tencent Hy4 preview](https://www.tencent.com/tencent-releases-and-open-sources-tencent-hy4-preview/)**: release oficial — Tencent libera y open-sourcea la preview de su LLM de nueva generación, «ranked among the top tier of open-source models», orientado a tareas de productividad real ([research](https://hy.tencent.ai/research/hy4)). *Señal:* el eje China-open (Moonshot, Tencent, DeepSeek, Qwen) sigue empujando la frontera abierta semanalmente; para flotas self-hosted esto amplía el catálogo de candidatos a evaluar.

### IA y deuda técnica de 40 años
Historia #1 del día en HN (773 pts): [«AI is forcing us to pay off 40 years of technical debt»](https://spectrum.ieee.org/ai-in-cybersecurity-php2shell-vulnerability) (IEEE Spectrum, «PHP2Shell Is a Wakeup Call for AI in Cybersecurity») — la vulnerabilidad *PHP2Shell* como caso: patrones legacy de 1980s-2000s (mixing code/data, ejecución por interpretación de extensión) que la IA usada como herramienta ofensiva explota a escala. Tesis: **la IA no crea clases nuevas de bugs, industrializa las viejas** — pagar la deuda ya no es opcional.

### Agentes: seguridad MCP y privacidad de chat
- [«Letting users trust their own MCP clients, without opening a phishing hole»](https://streamvessel.com/blog/mcp-trusted-redirect-uris) (Alexander Loginov, 4-nov-2026): diseño de redirect-URIs confiables para clientes MCP sin abrir agujeros de phishing — el ecosistema MCP empieza a tener su literatura de seguridad propia.
- **Tell HN (507 pts): [Gemini entrena con el historial de chat incluso para suscriptores](https://news.ycombinator.com/item?id=50363461)** (cuentas personales) — el debate privacy-by-default vs opt-out vuelve al centro.
- [«Verification Is Not Knowledge»](https://blog.cosmos-institute.org/p/verification-is-not-knowledge) (189 pts): la verificación por IA no sustituye la construcción de conocimiento — contrapeso epistemológico al vibe-checking.
- [Experiencia con Antigravity](https://dev.to/gde/what-i-learned-managing-a-full-project-with-antigravity-1ppc) (Dev.to): primera generación de reports de uso real de IDEs agénticos en proyectos completos.
- [«We're Building AI to Replace Ourselves. What's the Plan?»](https://dev.to/sylwia-lask/were-building-ai-to-replace-ourselves-whats-the-plan-4oll): el debate de recolocación entra en blogs de practicantes, no solo en papers.

---

## 3. Seguridad

### 🔴 Debian apt: MITM con ejecución arbitraria de código
[Debian Security Announcement](https://lists.debian.org/debian-security-announce/2026/msg00526.html) + [Lobsters: «Man-in-the-middle arbitrary code execution in Debian's apt»](https://lobste.rs/s/h7bvma/man_middle_arbitrary_code_execution). Un atacante en posición MITM sobre actualizaciones HTTP podía lograr **ejecución arbitraria de código** vía apt. *Acción inmediata:* aplicar el security update en toda flota Debian/Ubuntu heredada; priorizar hosts con repos por HTTP o mirrors no verificados. (Verificado hoy: el anuncio en lists.debian.org está bloqueando fetchers automatizados con 429 — el dato se corroboró vía ambos agregadores.)

### Ingeniería social a escala estatal: Binance $6.3B
[The Register](https://www.theregister.com/security/2026/11/03/north-korean-fake-job-interview-led-to-63b-binance-heist/5307398): el heist de **$6.3B** se originó en una **entrevista de trabajo falsa** atribuida a operadores norcoreanos (408 pts en HN). Combinación clásica 2026: recruitment fake + malware en "take-home task". *Lección operacional:* los procesos de hiring son superficie de ataque; sandboxear entregables de candidatos como si fueran PRs de desconocidos.

### Otros
- [«So my ISP was hijacking my DNS»](https://lobste.rs/s/cozhtg/so_my_isp_was_hijacking_my_dns) (Lobsters #1 del día): los ISPs secuestrando DNS siguen vivos — DoH/DoT como defensa por defecto.
- [«Your Cryptography Conspiracy Theory Is Wrong»](https://lobste.rs/s/bqllfe/your_cryptography_conspiracy_theory_is): desmontaje de teorías conspirativas cripto con matemática verificable.
- [Observations from Running stealmybitcoin.com](https://lobste.rs/s/fgucra/observations_from_running) (97 pts): honeypot ético como fuente de intel sobre tooling de robo cripto.

---

## 4. Infraestructura y datos

### GitHub: incidente hoy (resuelto)
[Incident with Pull Requests, Git Operations and Issues](https://www.githubstatus.com/incidents/smtdswd1h2w4): degradación de API Requests, Git Operations, Issues, PRs y **Actions** el 4-nov; mitigado 11:43 UTC, **resuelto 11:50 UTC**. RCA pendiente de publicación. *Nota para pipelines:* los jobs de CI que fallaron en esa ventana (≈11:00–11:50 UTC) no son regresiones — re-run antes de culpar al código.

### PostgreSQL: libro interno + gotcha de PG19
- [«The Internals of PostgreSQL»](https://www.interdb.jp/pg/index.html) (356 pts en HN): el libro de referencia de interioridades de PG sigue siendo lectura obligatoria para SREs de datos.
- [«PostgreSQL 19's sequence replication only catches up when you tell it to»](https://dev.to/alexgeorgiev17/postgresql-19s-sequence-replication-only-catches-up-when-you-tell-it-to-2410): la replicación de secuencias de PG19 **no se pone al día automáticamente** — gotcha real para failovers (identities desincronizadas = duplicados al reanudar writes).
- [Sync Firestore→Postgres](https://stackoverflow.com/questions/80014732/what-is-the-best-approach-to-map-the-live-read-update-of-data-from-gcp-firesto): patrón recurrente SO — sync live NoSQL→SQL sigue sin respuesta canónica.

### Rendimiento de hardware para inference
[«Linux on the Nvidia RTX Spark Laptop: What Actually Works»](https://www.mindstudio.ai/blog/linux-nvidia-rtx-spark-laptop) (489 pts HN): Linux instala y acelera GPU vía driver open kernel, pero **al conectar a la corriente la GPU se clava a ~780MHz** (vs 2GHz+ en Windows) por el firmware cifrado — un chip que rinde ~65 tok/s en un modelo de 120B cae a una fracción (~35%). *Implicación:* para laptops de inference Linux-first, la batalla ya no es el driver sino el **firmware firmado**.

---

## 5. Frameworks y herramientas

| Herramienta | Novedad | Fuente |
|---|---|---|
| **Wasp** | [Wasp 1.0 oficialmente en camino (ETA ~6 meses)](https://dev.to/wasp/after-5-years-wasp-10-is-coming-a-6-month-plan-for-our-full-stack-js-framework-4hlf): >5 años, 100+ releases, $5M raised; sale de Beta | Dev.to |
| **Kino AI (YC S23)** | [Launch HN: AI media manager y video editor](https://news.ycombinator.com/item?id=50368804) | HN |
| **Kitty** | [Kitty 0.50](https://sw.kovidgoyal.net/kitty/changelog/): release redondo del terminal GPU | HN 320 pts |
| **Ladybird** | [This Month in Ladybird — Octubre 2026](https://ladybird.org/newsletter/2026-10-31/): el browser independiente sigue su ritmo sin Chrome/Blink | HN |
| **Grist** | [Window Functions en spreadsheets](https://www.getgrist.com/blog/running-totals-you-dont-have-to-chase/): running totals sin fórmulas frágiles | HN |
| **A2A CLI + Rust** | [El protocolo agent-to-agent en Rust, tres formas de servirlo](https://dev.to/gde/the-a2a-cli-and-rust-the-same-code-three-ways-to-serve-it-4el0): el estándar A2A gana tooling | Dev.to |
| **XSLT** | [«Death comes for XSLT»](https://lobste.rs/s/chypzr/death_comes_for_xslt) (98 pts / 89 comentarios): epitafio en discusión — mover transformaciones críticas fuera de XSLT si aún las hay | Lobsters |
| **Stringman** | [Robot gripper open-source de escala habitación por $800](https://neufangled.com/) (766 pts): robótica amateur al alcance del hobbyist | HN |
| **Jelly Sheet** | [Demo interactiva de codevember](https://mrdoob.github.io/codevember-2026/01/) (411 pts): spreadsheets JIT estilo mr.doob | HN |

---

## 6. Tendencias del radar (síntesis)

1. **La seguridad supply-chain vuelve al tablero**: apt-MITM + DNS hijacking + hiring-fake heist en el mismo día. La lección sistémica: *canales de confianza por diseño (firma, DoH, verificación de identidad), no por costumbre*.
2. **Verificabilidad como tema transversal**: provable inference (Anthropic), Evergreen (lenguaje provably safe), C++26 Contracts fallando su ballot — el ecosistema pide **garantías demoables**, no promesas.
3. **China-open acelera**: Kimi K3.1 Pro + Tencent Hy4 en 24h. Para infra self-hosted, el coste de evaluar candidatos nuevos baja y la frontera abierta se mueve semanalmente.
4. **Deuda técnica + IA = superficie de ataque industrializada** (IEEE PHP2Shell): el argumento para refactors que llevaban años en el backlog acaba de fortalecerse.
5. **Los IDEs agénticos entran en fase de reportes de uso real** (Antigravity, VS Code agents): de la novedad al caso práctico con fricciones documentadas.

## Fuentes

- Hacker News top 25 (autocli, 4-nov-2026 19:00 UTC)
- Lobsters hot 10 (autocli)
- Dev.to top 10 (autocli)
- Stack Overflow hot 10 (autocli) — señal baja: sync Firestore→Postgres, terminal de VS Code agents, CSS password matching
- Verificación directa: go.dev, anthropic.com, decodigo.com, githubstatus.com, mindstudio.ai, ziglang.org, tencent.com, kimi.com, huggingface.co, evergreenlang.net, streamvessel.com, spectrum.ieee.org, lobste.rs (web_fetch, 4-nov-2026)

> Próxima edición: 5-nov-2026. Items a seguir: RCA del incidente GitHub, ballot DD de C++26, KB de Nvidia sobre clocks RTX Spark, adoption de json/v2.
