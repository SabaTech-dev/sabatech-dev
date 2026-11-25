---
title: "Radar Tecnológico — 25 de noviembre de 2026: Resumen ejecutivo"
description: "Radar tecnológico diario de SabaTech: los movimientos que importan en lenguajes, IA, seguridad, infraestructura y frameworks, con fuentes verificadas. Edición del 25 de noviembre de 2026."
pubDate: "2026-11-25"
author: "Alfred"
tags: ["radar-tecnologico", "noticias", "ia", "seguridad", "lenguajes", "infraestructura"]
---
> **Fuentes:** Hacker News top 25 · Lobsters hot 10 · Dev.to top 10 · StackOverflow hot 10 (API oficial 2.3) · complementado con web_search/web_fetch.
> **Generado:** 2026-11-25 20:00 Europe/Madrid · cron Tech Radar Diario (jokerserver)

---

## Resumen ejecutivo

1. **IA produce investigación matemática formal (y hay que verificarla):** Google Research publicó hoy 6 papers matemáticos generados íntegramente por **Cogentic** (agente basado en Gemini 4), con el paper estrella afirmando factorización de enteros con cota probada `L_N[1/3, 105]`. Las formalizaciones Lean 4 **no son públicas aún** y no hay peer review — la comunidad (257 comentarios en HN) pide verificación antes de celebrar.
2. **Cadena de suministro dev como vector de ataque #1:** 1Password confirmó hoy el detalle de un incidente (19-nov): compromiso de la cuenta GitHub corporativa de un empleado → push de código malicioso a backends + acceso a CI/CD. Vaults intactos. Misma semana: toma de subdominios del Tesoro de EE.UU. por 3 $.
3. **LLMs locales con cuantización extrema y enfoque agéntico:** PrismML lanzó **Ternary Bonsai 2.5 27B** (pesos ternarios, arquitectura híbrida de atención de Qwen3.8-27B, GGUF en HuggingFace) apuntando a coding agéntico y tool-use de largo horizonte.
4. **Rust en debate de ergonomics y rendimiento:** Armin Ronacher publica hoy "Abolish Lock Poisoning" (continúa el debate de dic-2025), mientras se optimiza el nuevo trait solver de rustc y **Servo 0.8** suma captions de video HTML e integración con Flutter Web.
5. **Matemática algorítmica en lo más votado:** "The matrix multiplication exponent is nine fourths" (ω = 9/4) lidera el día con 922 pts / 521 com., en sintonía con el tema Cogentic — la matemática profunda domina el agenda tech de hoy.
6. **Verificación formal entra en el stack mainstream:** Lean 4 aparece dos veces en el día — formalizando los papers de Cogentic y encontrando bugs no reportados en el core de Clojure (verificación de lenguajes dinámicos con proof assistants).

---

## Historias investigadas

### 1. Google Cogentic: 6 papers matemáticos de un agente IA — y el rumor "Factoring in P"

- **Qué pasó:** Google Research subió hoy 25-nov los papers a [google-research/cogentic_research_papers](https://github.com/google-research/google-research/tree/master/cogentic_research_papers). Cada paper dice haber sido "íntegramente obtenido por Cogentic" sin interacción humana salvo el prompt inicial ([cobertura MLQ](https://mlq.ai/news/googles-cogentic-agent-posts-six-math-papers-led-by-a-claimed-proven-l13-bound-for-factoring-integers/), [CellCog](https://cellcog.ai/blog/google-cogentic-math-papers/)).
- **El claim:** factorización completa de cualquier entero en tiempo esperado **probado** `L_N[1/3, 105]`, frente a la mejor cota rigurosa previa (1992) `L_N[1/2, 1]`. Iguala el exponente 1/3 del General Number Field Sieve (que es solo heurístico) pero con **prueba formal**.
- **Contexto crítico:** `L[1/3, c]` sigue siendo **subexponencial** — no es "Factoring in P". Y la constante 105 es astronómica: sin impacto práctico alguno en RSA de hoy. El rumor de HN ("labs might have cracked Factoring in P") sobreinterpreta el resultado.
- **El cabo suelto:** las pruebas Lean 4 de los 6 papers están "completas" según Google pero **no se han publicado** ("companion submission" pendiente). Sin peer review. El escéptico tiene razón hasta que Lean diga lo contrario.
- **Por qué importa:** primer paquete de "research matemática end-to-end por agente IA" publicado por un laboratorio mayor. Si Lean verifica, cambia el workflow de la investigación matemática; si no, será un caso de estudio de alucinación con peer-review-económico.

### 2. 1Password: incidente backend vía GitHub de empleado (update hoy)

- **Cronología:** el 19-nov detectaron indicios de acceso a la cuenta GitHub corporativa de un empleado ([blog oficial](https://1password.com/blog/update-on-nov-2026-security-incident)); update público hoy 25-nov.
- **Vector:** el atacante usó la cuenta para **acceder código fuente y hacer push de código malicioso a servicios backend**, que descargaron datos administrativos de clientes. También copió código de repos privados y obtuvo acceso al **sistema CI/CD**.
- **Datos afectados:** nombres, emails, IDs de cuenta/usuario, timestamps (creación/último login), claves públicas, parámetros SRP (inutilizables para acceso), tokens de emails de invitaciones/provisioning/recovery, metadata interna no secreta.
- **Lo que NO se tocó:** contenidos de los vaults de clientes — el modelo zero-knowledge aguantó. Rotación total de credenciales CI/CD disparada; sin impacto en servicios.
- **Patrón:** mismo triángulo del post de 1Password del 5-nov sobre credential harvesting con IA ([AI credential harvesting](https://1password.com/blog/ai-credential-harvesting)): identidad de desarrollador (GitHub) + secrets de CI/CD = joya de la corona. Reforzar passkeys/FIDO y secret rotation es la lección operativa del día.

### 3. PrismML Ternary Bonsai 2.5 27B — LLM local ternario para agentes

- Lanzado hace ~24h ([PrismML](https://prismml.com/), [GGUF en HuggingFace](https://huggingface.co/prism-ml/Ternary-Bonsai-2.5-27B-GGUF), hilo r/LocalLLaMA).
- "Agentic release" de la línea Bonsai 27B: conserva la **arquitectura híbrida de atención de Qwen3.8-27B**, pesos **ternarios** ({-1,0,1}) y foco en coding agéntico + tool use de largo horizonte.
- Señal: la cuantización ternaria (1.58-bit) ya no es solo benchmark — es una familia de modelos agénticos productivos. Relevante para flotas self-hosted con VRAM limitada (27B ternario ≈ footprint de un 7-13B denso).

### 4. Spring Boot 4.2.0

- [Release 19-nov-2026](https://spring.io/blog/2026/11/19/spring-boot-4-2-0-available-now/): mejoras, features nuevas y upgrades de dependencias.
- En StackOverflow ya aparece la pregunta caliente sobre su **política de dependencias circulares** (beans circulares): migraciones desde 3.x deben revisar cómo tratan los loops de beans — la era "permitir y avisar" se cierra.

### 5. Servo 0.8: el motor web Rust no para

- [Phoronix](https://www.phoronix.com/news/Servo-0.8-October-2026): Servo 0.8 debutó con los cambios de octubre; [post en servo.org hoy](https://servo.org/): **captions de video HTML** y trabajo de integración **Flutter Web**.
- Con el statu quo iOS (sigue sin haber navegadores non-WebKit, ver Lobsters) y la presión de alternativas, Servo vuelve a ser un proyecto a vigilar como motor embebible.

### 6. Rust: "Abolish Lock Poisoning" (Ronacher, hoy)

- [Post de Armin Ronacher](https://lucumr.pocoo.org/2026/11/25/poisoning/): argumenta que el mutex poisoning de Rust es una feature que hoy no aterrizaría; responde al contra-post de sunshowers ([In defense of lock poisoning](https://sunshowers.io/posts/on-poisoning/), dic-2025).
- Debate de diseño de API estándar: manejo de estado inconsistente tras panic con lock. En paralelo, el [nuevo trait solver de rustc sigue en optimización](https://lobste.rs/s/lyyksp/optimizing_rustc_s_next_trait_solver) — el compilador de Rust se hace más rápido y más simple por dentro.

---

## Señales y tendencias

| Tendencia | Señales de hoy | Lectura |
|---|---|---|
| IA formal-verificable | Cogentic+Lean (Google), Clojure core verificado con Lean | Lean 4 como árbitro de la IA generativa; la verificación formal se vuelve prerrequisito, no lujo |
| Supply chain dev bajo fuego | 1Password (GitHub→CI/CD), incidente en Hex.pm (registro de paquetes Elixir), subdomain takeover Tesoro EEUU por 3 $ | La identidad del desarrollador y CI/CD son el perímetro; passkeys + rotación automática |
| LLMs locales agénticos eficientes | Bonsai 2.5 27B ternario, predicción de tamaño LoRA | Cuantización extrema + tool use = frontier razonable en self-hosted |
| Seguridad de agentes IA | Modelos coordinando vía inference servers pese a sandbox; tool-gates (Strands Decider 2B) | El covert-channel entre modelos sandboxes es una superficie nueva; gates de herramientas como control |
| Rust más allá de hype | poisoning debate, trait solver, Servo 0.8, Rustc en Lobsters ×3 | Madurez: el debate pasa de memoria segura a ergonomics y performance del compilador |
| Burnout y agentes en la cultura dev | Dev.to: 4 de 10 top stories sobre pasión/carga mental; "¿blogs cuando leen agentes?" | El disenso sobre ritmo de trabajo y el contenido-for-AI entran en el mainstream |

---

## Top 25 Hacker News

| # | Historia | Pts | Com. |
|---|---|---|---|
| 1 | [1Password Security Incident](https://1password.com/blog/update-on-nov-2026-security-incident) | 326 | 140 |
| 2 | [Google releases Cogentic papers on integer factorization, discrete logs and more](https://github.com/google-research/google-research/tree/master/cogentic_research_papers) | 336 | 257 |
| 3 | [Button Sounds – collection of professionally-recorded button clicks and presses](https://buttons.joshwcomeau.com/) | 747 | 119 |
| 4 | [I checked Clojure's core with Lean and found unreported bugs](https://s.conao3.com/blog/2026/e4f733) | 88 | 31 |
| 5 | [Porting Rockbox to an Undocumented $9 Aliexpress 'YP3' MP3 Player with LLMs](https://jayd.ml/2026/11/14/rockbox-on-yp3.html) | 108 | 56 |
| 6 | [Predicting LoRA size for any dataset](https://engram.com/blog/lora-size) | 61 | 5 |
| 7 | [Britain's ghost stations](https://spectator.com/article/britains-ghost-stations-are-fascinating/) | 14 | 0 |
| 8 | [A few questions for the guy who went snorkeling in a Home Depot retention pond](https://www.vox.com/down-to-earth/511999/home-depot-retention-pond-snorkel-joseph-ricketts) | 319 | 83 |
| 9 | [Windows Loudness Equalization, reverse-engineered and ported to PipeWire](https://github.com/xoxorwr/pw-loudness-eq) | 260 | 151 |
| 10 | [Deriving Black-Scholes](https://david.alvarezrosa.com/posts/deriving-black-scholes/) | 18 | 9 |
| 11 | [The matrix multiplication exponent is nine fourths [pdf]](https://github.com/openai/math/blob/main/preprints/The-matrix-multiplication-exponent-is-nine-fourths-November-24-2026/paper.pdf) | 922 | 521 |
| 12 | [Investigating degraded experiences across GitHub products](https://www.githubstatus.com/incidents/qn8mfv6q5hlx) | 157 | 79 |
| 13 | [Rumors swirling that labs might have cracked Factoring in P](https://www.reddit.com/r/singularity/comments/1y59ef1/rumor_that_openai_or_anthropic_found_a_way_to/) | 282 | 198 |
| 14 | [In C++, = default and {} are not the same constructor](https://lemire.me/blog/2026/11/02/default-and-braces-are-not-the-same-constructor/) | 53 | 108 |
| 15 | [Pinocchio at 200: a tale of hunger, greed and Italy's culinary history](https://www.repubblica.it/en/europe/food-travel/2026/11/24/news/carlo_collodi_pinocchio_pellegrino_artusi_italian_literature-425744069/) | 49 | 7 |
| 16 | [Show HN: Old Nvidia and ATI tech demos, running again in the browser](https://gpu-demo-gallery.pages.dev/) | 293 | 66 |
| 17 | [Smart people who give a shit use tools](https://www.iankduncan.com/engineering/2026-11-19-smart-people-who-give-a-shit-use-tools) | 131 | 123 |
| 18 | [Models Can Communicate via Inference Servers Despite Being Sandboxed](https://www.lesswrong.com/posts/7wzWuLP3HhyBLmKfo/models-can-communicate-via-inference-servers-despite-being) | 407 | 175 |
| 19 | [The industrialization of noise: Automated proof-solving is the same old dead end [pdf]](https://arxiv.org/abs/2611.31286) | 47 | 65 |
| 20 | [Hazel (YC W24) Is Hiring a Product Designer](https://www.ycombinator.com/companies/hazel-2/jobs/8EhsvYE-product-designer-contract) | 1 | – |
| 21 | [The short age of dragon riders](https://atilloy.com/2026/11/16/the-short-age-of-dragon-riders/) | 244 | 159 |
| 22 | [Ternary Bonsai 2.5 27B](https://prismml.com/news/bonsai-2-5-27b) | 517 | 170 |
| 23 | [Show HN: Ribbon Architect – Endless ways to tie a gift ribbon](https://ribbonarchitect.com) | 13 | 1 |
| 24 | [Getting old Java phones online again](https://antcating.github.io/2026/11/23/getting-old-java-phones-online-again.html) | 147 | 66 |
| 25 | [Bypassing iOS Safari's 60 FPS Limit to Build Web Applications That Feel Native](https://rida.dev/blog/bypassing-ios-safari-60-fps-limit) | 394 | 132 |

## Lobsters hot 10

| # | Historia | Pts | Com. | Tags |
|---|---|---|---|---|
| 1 | [Marginalia Search, Money, C++, Rust, AI, stuff](https://lobste.rs/s/srb0dp/marginalia_search_money_c_rust_ai_stuff) | 76 | 16 | c++, java, performance |
| 2 | [Optimizing Rustc's next trait solver](https://lobste.rs/s/lyyksp/optimizing_rustc_s_next_trait_solver) | 23 | 1 | compilers, performance, rust |
| 3 | [Pokemon Childhood Version: A romhack where Mew is under the truck](https://lobste.rs/s/em9zdb/pokemon_childhood_version_romhack_where) | 64 | 5 | assembly, games |
| 4 | [Abolish Lock Poisoning](https://lobste.rs/s/sj2pkv/abolish_lock_poisoning) | 35 | 56 | rust |
| 5 | [Why there are still no non-WebKit browsers on iOS](https://lobste.rs/s/sv2flr/why_there_are_still_no_non_webkit_browsers) | 72 | 16 | browsers, ios |
| 6 | [October in Servo: video captions and inert content](https://lobste.rs/s/tf9ldm/october_servo_video_captions_inert) | 19 | 0 | browsers, release, rust, web |
| 7 | [Update on a security incident involving 1Password’s backend systems](https://lobste.rs/s/aulbi2/update_on_security_incident_involving) | 9 | 0 | security |
| 8 | [Taking over US Treasury subdomains for $3 each](https://lobste.rs/s/ogxwpi/taking_over_us_treasury_subdomains_for_3) | 18 | 1 | networking, security |
| 9 | [Security incident on Hex.pm](https://lobste.rs/s/rfcgkx/security_incident_on_hex_pm) | 71 | 9 | elixir, erlang, gleam |
| 10 | [2035 came early](https://lobste.rs/s/rkk6o8/2035_came_early) | 118 | 6 | nix, wasm |

## Dev.to top 10

| # | Historia | Reacciones |
|---|---|---|
| 1 | [The Price You Pay for Passion](https://dev.to/thethirdcup/the-price-you-pay-for-passion-3h5l) | – | 44 |
| 2 | [The mental toll of working in tech](https://dev.to/klaudiagrz/the-mental-toll-of-working-in-tech-2m6k) | – | 13 |
| 3 | [Lazy Senior Dev Mode Made My App Smaller. Was It Better?](https://dev.to/necoz/lazy-senior-dev-mode-made-my-app-smaller-was-it-better-90i) | – | 4 |
| 4 | [The Third Cup: You Don't Have to Fly That High](https://dev.to/thethirdcup/the-third-cup-you-dont-have-to-fly-that-high-3ehd) | – | 36 |
| 5 | [I Know It's You, But I Can't Prove It](https://dev.to/codingwithjiro/i-know-its-you-but-i-cant-prove-it-39i2) | – | 4 |
| 6 | [Stop AI Agents Acting on Bluffs? A Strands Decider 2B Tool Gate Test](https://dev.to/aws-builders/stop-ai-agents-acting-on-bluffs-a-strands-decider-2b-tool-gate-test-5004) | – | 10 |
| 7 | [Part 7: What Reading the Code Could Never Find](https://dev.to/ndcodes/part-7-what-reading-the-code-could-never-find-8c1) | – | 0 |
| 8 | [A Year of Hacking: a Cloudinary Hackathon Retrospective](https://dev.to/cloudinary/a-year-of-hacking-a-cloudinary-hackathon-retrospective-3odm) | – | 2 |
| 9 | [I Built My First Multi-Agent System on AWS, and It Was Easier Than I Expected](https://dev.to/hemapriya_kanagala/i-built-my-first-multi-agent-system-on-aws-and-it-was-easier-than-i-expected-58c2) | – | 15 |
| 10 | [Are Blogs Still Worth Writing When Agents Do the Reading?](https://dev.to/amananandrai/are-blogs-still-worth-writing-when-agents-do-the-reading-4eg0) | – | 2 |

## StackOverflow hot 10

| # | Pregunta | Tags |
|---|---|---|
| 1 | [Copy text on image click](https://stackoverflow.com/questions/80018689/copy-text-on-image-click) | javascript, html, css |
| 2 | [Flutter AAB works with Internal App Sharing but crashes when installed from Google Play Closed Testing](https://stackoverflow.com/questions/80018680/flutter-aab-works-with-internal-app-sharing-but-crashes-when-installed-from-goog) | android, flutter, google-play, google-play-console |
| 3 | [Rust Glancer fails to initialize](https://stackoverflow.com/questions/80018687/rust-glancer-fails-to-initialize) | vs-code, rust, vscode-extensions, vscodium |
| 4 | [Why does the behaviour of the in operator/__contains__ method differ from manual equality checks?](https://stackoverflow.com/questions/80018665/why-does-the-behaviour-of-the-in-operator-contains-method-differ-from-manual) | python, list, numpy |
| 5 | [Overflow: auto doesn't show top part of image](https://stackoverflow.com/questions/80018677/overflow-auto-doesnt-show-top-part-of-image) | javascript, html, css |
| 6 | [Safe pattern to process multiple files in Awk](https://stackoverflow.com/questions/80018639/safe-pattern-to-process-multiple-files-in-awk) | bash, awk, posix |
| 7 | [Transforming batch of vector 4 float using simd](https://stackoverflow.com/questions/80018671/transforming-batch-of-vector-4-float-using-simd) | c, gcc, x86-64, simd, intrinsics |
| 8 | [Delphi Custom Control - Name assignment error at design time](https://stackoverflow.com/questions/80018684/delphi-custom-control-name-assignment-error-at-design-time) | delphi, custom-controls, design-time |
| 9 | [Spring Boot 4.2.0 circular dependency policy](https://stackoverflow.com/questions/80018672/spring-boot-4-2-0-circular-dependency-policy) | spring, spring-boot |
| 10 | [Only calling the framebuffer size callback when the user is done resizing the window?](https://stackoverflow.com/questions/80018652/only-calling-the-framebuffer-size-callback-when-the-user-is-done-resizing-the-wi) | c++, glfw, imgui |

---

## Meta

- Recogida de fuentes OK: HN 25/25, Lobsters 10/10, Dev.to 10/10, StackOverflow 10/10 (exit 0).
- Research complementario: 8 consultas (web_search ×6, web_fetch ×2).
- Verificación de citas: ver footer `cita-check`.

---
