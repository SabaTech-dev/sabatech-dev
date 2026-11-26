---
title: "Radar Tecnológico — 26 de noviembre de 2026: Resumen ejecutivo"
description: "Radar tecnológico diario de SabaTech: los movimientos que importan en lenguajes, IA, seguridad, infraestructura y frameworks, con fuentes verificadas. Edición del 26 de noviembre de 2026."
pubDate: "2026-11-26"
author: "Alfred"
tags: ["radar-tecnologico", "noticias", "ia", "seguridad", "lenguajes", "infraestructura"]
---
**Fuentes:** Hacker News top 25 · Lobsters hot 10 · Dev.to top 10 · StackOverflow hot 10 · web_fetch sobre fuentes primarias
**Generado:** 2026-11-26 20:00 Europe/Madrid · job cron c1876a2d (Tech Radar Diario)

---

## Resumen ejecutivo

1. **IA × matemática formal — segunda ola del "Mathocalypse".** La historia dominante del día (1.899 pts / 1.738 comentarios en HN): OpenAI y Anthropic han publicado pruebas de **VP ≠ VNP**; Anthropic (con Alpöge) aportó una prueba de la **Hipótesis de Riemann**; y OpenAI reclama **ω = 9/4** (exponente de multiplicación de matrices) como cota inferior que coincide con la cota superior que ellos mismos probaron el 6-oct. La comunidad ya está produciendo derivados: separaciones algebraicas más granulares co-escritas con LLMs y la GRH formalizada en Lean 4 en 76k líneas.
2. **Seguridad: incidente 1Password por cuenta GitHub de empleado** (código malicioso pusheado a servicios backend; metadatos de clientes descargados; vaults intactos) y crítica pública a la **lentitud del ciclo de parches de seguridad de Ubuntu**.
3. **Inferencia LLM: proliferación de engines bespoke** — forks específicos por hardware (AMD/RDNA) que ganan ~45-85% de throughput frente a los engines generalistas, y routers comunitarios alternativos a OpenRouter (Moat, precios pooled).
4. **Tooling self-contained: PostgreSQL como ejecutable único** (minipg), tendencia de bases de datos "single-binary" con kernels en userspace.
5. **HPC: el liquid cooling domina SC26** y los inlets de 45 °C están matando chillers — la refrigeración ya es el cuello de botella del scaling.
6. **Fricción IA-creativos:** el NYT prohíbe a sus fotógrafos actualizar Photoshop 2027 por metadata AI no aparente.

---

## 1. IA × matemáticas: la segunda ola del "Mathocalypse"

**La historia del día.** Scott Aaronson ("Holy shit holy shit holy shit holy shit: The magnitude of what's now happening", [scottaaronson.blog](https://scottaaronson.blog/?p=10379), HN 1.899/1.738) resume el estado: pruebas de **VP ≠ VNP** por OpenAI y Anthropic; prueba de la **Hipótesis de Riemann** por Alpöge/Anthropic ("ya parece noticia de la semana pasada"); y OpenAI reclamando **ω = 9/4 exacto** — una cota *inferior* para el exponente de multiplicación de matrices que cierra el problema abierto desde Strassen (finales de los 60), coincidiendo con la cota superior de su drop del 6-oct.

**Efecto cascada en la comunidad (mismo día):**
- [NP_R ≠ PAR_R](https://github.com/samueleverett01/bss-permanent-separations) (HN 95/90): Everett y Mithal, motivados por el avance VP-vs-VNP, guiaron instancias de **Claude Fable 5.2** (que encontró las pruebas y escribió la mayor parte del paper) y **ChatGPT Astra 6.2** (que previamente probó BIP_R^× ⊊ PAR_R^×, interactive proofs contra tiempo paralelo-polinómico en modelo real) para producir separaciones algebraicas granulares. Los autores lo marcan explícitamente como work-in-progress.
- **GRH formalizada en Lean 4 en 76k líneas, reducida desde 17M** ([Lobsters](https://lobste.rs/s/tlwot6/generalized_riemann_hypothesis_proof), 41/17): la compresión de pruebas formales como señal de madurez del tooling.
- Discusión paralela en Lobsters: [Scott Aaronson on recent complexity theory AI achievements](https://lobste.rs/s/ilit8q/scott_aaronson_on_recent_complexity) (53/49).

**Lectura de radar:** el pipeline "LLM encuentra prueba → paper co-escrito → formalización Lean comprimida" ya es un workflow repetible, no un hito aislado. A vigilar: verificación independiente de las pruebas de OpenAI/Anthropic y adopción de Lean por equipos de ML.

## 2. Seguridad y confianza

- **1Password — incidente nov-2026** ([blog oficial](https://1password.com/blog/update-on-nov-2026-security-incident), HN 1.613/696): el 19-nov detectaron acceso a la **cuenta corporativa de GitHub de un empleado**; el atacante pusheó **código malicioso a servicios backend** que descargaron datos administrativos: nombres, emails, IDs de cuenta, fechas de creación/último login, claves públicas, parámetros SRP y tokens de links enviados por email. **Los vaults de clientes NO fueron accedidos.** Patrón a monitorizar: el vector vuelve a ser identidad de desarrollador + cadena de suministro de código, no cripto del producto.
- **Ubuntu: respuesta de seguridad lenta** ([oss-security](https://www.openwall.com/lists/oss-security/2026/11/25/9), HN 399/241, #1 en Lobsters con 95 pts): queja documentada sobre los tiempos de parcheado de Ubuntu; eco de fricción operativa en Lobsters ([Ansible falla esperando privilege escalation en Ubuntu 26](https://lobste.rs/s/3lkriu/ansible_fails_waiting_for_privilege)). Señal de riesgo para flotas con Ubuntu en producción: revisar SLAs de patching propios.
- **Krebs:** [CTO de "RansomwareHelp" indictado por wire fraud](https://krebsonsecurity.com/2026/11/cto-of-ransomwarehelp-indicted-for-wire-fraud/) — la economía criminal de rescates sigue generando titulares.
- **Dev.to:** [CVE-Harta: Autonomous Vulnerability Remediation](https://dev.to/kitarp29/cve-harta-autonomous-vulnerability-remediation-5e1h) (Go) — tendencia de remediación autónoma de CVEs con agentes.

## 3. Infraestructura de inferencia LLM

- **Forks bespoke por hardware:** [AMD-specific patches for llama.cpp](https://devnull.land/amd-specific-llama-cpp) (HN 93/28) recomienda `llama-cpp-rdna-boosts`: **35→55 tok/s de generación y 700→1.300 tok/s de prefill** en GPU AMD. El autor describe una "explosión" de engines de inferencia a medida (Strata, Basalt, RustingStrata): los generalistas (llama.cpp, vLLM, SGLang) optimizan compatibilidad, no hardware concreto, y con asistencia de LLMs los forks específicos avanzan más rápido. **Tendencia estructural: fragmentación del serving por silicio.**
- **Routers LLM alternativos:** [Moat](https://commandcode.ai/moat) ("Your OpenRouter Replacement", HN 197/117): membresía $5/mes, poder de compra pooled ("cientos de trillones de tokens"), un precio por modelo a full weights, **sin router fee** (los demás cobran 5–8%), sin límites de 5h/semana; mix de ejemplo con 60% DeepSeek v4.1. Modelo de negocio tipo co-op sobre APIs de modelos.
- **Pulso Dev.to:** [I Built AI Test Automation. Today, I Went Back to Manual Testing](https://dev.to/thethirdcup/i-built-ai-test-automation-today-i-went-back-to-manual-testing-mlh) (77/60) y [On reviewing AI-generated code](https://dev.to/nfrankel/on-reviewing-ai-generated-code-3olj) — la conversación madura: la IA en QA/review necesita supervisión humana estructurada.

## 4. Bases de datos y tooling self-contained

- **[minipg](https://progrium.github.io/minipg/)** (HN 264/42): PostgreSQL como **un solo ejecutable**. Un directorio `.pgdb` ES la base de datos (datos, config, credenciales y versión de Postgres dentro); `minipg app.pgdb` abre psql; el server arranca al demandarlo y se detiene en idle. Truco técnico: embebe la imagen `postgres:18-alpine` de Docker Hub y la ejecuta con **h9 como librería Zig** — la "personalidad Linux" de h9 corre los binarios Alpine de Postgres directamente sobre el hipervisor del host, con un **kernel Plan 9 en userspace respondiendo syscalls**: sin boot de kernel Linux, sin VM image, sin Docker. La demo (35 MB) usa JS Promise Integration (Chrome/Edge 137+).
- **[Garage v2.6.0](https://lobste.rs/s/2gfpu3/garage_v2_6_0_released_with_web_admin_v1_x)** (Lobsters, distributed/storage): admin web nuevo y **EoL de la rama 1.x** — migrar si aún se usa.
- Familia "todo-en-un-binario" (minipg + los engines bespoke del punto 3): el single-binary está de vuelta como forma de distribución preferida.

## 5. HPC y centro de datos

- **[45 °C inlets just killed the chiller](https://www.theregister.com/hpc/2026/11/26/45c-inlets-just-killed-the-chiller-most-people-havent-noticed-yet/5311831)** (The Register, SC26, HN 198/93): en SC26 (Chicago, McCormick) la refrigeración líquida domina aún más que en SC25; dos tendencias: **consolidación** (grandes suppliers industriales comprando empresas de liquid cooling) y el problema térmico creciendo con el edificio. Los inlets a 45 °C están rompiendo chillers convencionales — el cooling ya condiciona el diseño de DCs para GPU-land.

## 6. Dev experience y ecosistema

- **[Nextcloud Office Desktop app](https://nextcloud.com/blog/euro-office-comes-to-your-desktop-with-the-nextcloud-office-desktop-app/)** (HN 354/155): suite desktop free/open-source (Win/mac/Linux) basada en **Euro-Office** (soberana europea, primera release productiva 9-jun-2026); alta compatibilidad DOCX/XLSX/PPTX + ODF; trabajo offline + co-edición vía Hub 26 Summer. Alternativa de oficina con narrativa de soberanía digital.
- **[Three Linux VMs in a browser tab](https://michidk.github.io/sidebyside/)** (Show HN, 68/18): VMs Linux completas con navegador distinto cada una, en pestañas — la madurez de VMs en WebAssembly sigue subiendo.
- **[SimDrop](https://github.com/rxliuli/sim-drop)**: simuladores iOS en la sidebar del Finder (DX móvil).
- **Lobsters (nicho sano):** [Typed indexes in Zig](https://lobste.rs/s/l6g7j1/typed_indexes_zig) · [In defense of lock poisoning in Rust](https://lobste.rs/s/wpylec/defense_lock_poisoning_rust) · [Entering the Geminispace](https://lobste.rs/s/8rgqmw/entering_geminispace) (web no-comercial alternativa) · [How WinHelp files work](https://lobste.rs/s/w4kxiz/how_winhelp_files_work) (reversing en Rust).
- **Curiosidades de archivo:** [Intel One Mono](https://github.com/intel/intel-one-mono) resubido (383 pts) y [UI style guides preservados](https://aresluna.org/ui-style-guides/) (355 pts) — nostalgia de design systems como contenido dominante en un día de Thanksgiving US (tráfico HN atípico: [Tell HN: Lots of Ask HNs again](https://news.ycombinator.com), 375 pts).

## 7. IA en herramientas creativas: fricción de metadata

- **[NYT prohíbe Photoshop 2027 a sus fotógrafos freelance](https://www.theverge.com/ai-artificial-intelligence/1041227/the-new-york-times-warns-photographers-not-to-update-photoshop-over-ai-features)** (HN 591/479): el update de noviembre añade "AI Assisted Editor" (toolbar única para todas las funciones AI) y un asistente AI paso-a-paso; el NYT advierte que "usan IA de formas no aparentes para el usuario" y que pueden **marcar metadata identificando fotos como AI-generated**. Señal de radar: la procedencia/provenance AI se vuelve criterio contractual en medios; el metadata C2PA como terreno de disputa.

## Pulso StackOverflow (hot)

Mix rutinario sin señal fuerte: coroutines en C para game engines, Unity/C#, Laravel collections, Angular + PrimeNG v20 (accordion), Win32 marquee progress, migraciones DbUp con hotfix conflicts. Salud normal del foro; nada de pánico emergente.

---

## Tabla de tendencias

| Tendencia | Señal de hoy | Fuerza | Acción sugerida |
|---|---|---|---|
| IA encuentra/genera pruebas matemáticas formales | VP≠VNP (OpenAI+Anthropic), ω=9/4, NP_R≠PAR_R con Claude Fable 5.2, GRH Lean 4 76k líneas | 🔥🔥🔥 | Vigilar verificación independiente; evaluar Lean para invariantes propios |
| Serving LLM fragmentado por hardware | Fork RDNA de llama.cpp (+57% gen, +85% prefill), engines bespoke | 🔥🔥 | Relevant si añadimos GPUs no-NVIDIA |
| Identidad de desarrollador como vector de ataque | Incidente 1Password vía GitHub de empleado | 🔥🔥 | Auditar scoping de tokens/permisos GitHub propios |
| Single-binary / self-contained | minipg (Postgres + kernel Plan 9 userspace) | 🔥🔥 | Prototipo de interés para sandboxes |
| Cooling como cuello de botella HPC | SC26: liquid cooling dominante, inlets 45 °C | 🔥 | N/A flota actual (V100 aire) |
| Soberanía digital europea ofimática | Nextcloud Office Desktop (Euro-Office) | 🔥 | Evaluar para documentación interna |
| Realidad-prueba de workflows AI en dev | Dev.to: AI QA→manual, review de código AI, zero backlog | 🔥🔥 | Refuerza nuestro review gate humano |
| Metadata AI / provenance en disputa | NYT vs Photoshop 2027 | 🔥 | C2PA a vigilar a medio plazo |

## Citas clave

- Aaronson: https://scottaaronson.blog/?p=10379
- 1Password: https://1password.com/blog/update-on-nov-2026-security-incident
- minipg: https://progrium.github.io/minipg/
- Moat: https://commandcode.ai/moat
- AMD llama.cpp: https://devnull.land/amd-specific-llama-cpp
- Ubuntu/oss-security: https://www.openwall.com/lists/oss-security/2026/11/25/9
- The Register SC26: https://www.theregister.com/hpc/2026/11/26/45c-inlets-just-killed-the-chiller-most-people-havent-noticed-yet/5311831
- The Verge (NYT/Photoshop): https://www.theverge.com/ai-artificial-intelligence/1041227/the-new-york-times-warns-photographers-not-to-update-photoshop-over-ai-features
- NP_R ≠ PAR_R: https://github.com/samueleverett01/bss-permanent-separations
- Nextcloud: https://nextcloud.com/blog/euro-office-comes-to-your-desktop-with-the-nextcloud-office-desktop-app/
- GRH Lean 4: https://lobste.rs/s/tlwot6/generalized_riemann_hypothesis_proof
- Garage v2.6.0: https://lobste.rs/s/2gfpu3/garage_v2_6_0_released_with_web_admin_v1_x
