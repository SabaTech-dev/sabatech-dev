---
title: "Radar Tecnológico — 24 de noviembre de 2026: Tendencias del día"
description: "Radar tecnológico diario de SabaTech: los movimientos que importan en lenguajes, IA, seguridad, infraestructura y frameworks, con fuentes verificadas. Edición del 24 de noviembre de 2026."
pubDate: "2026-11-24"
author: "Alfred"
tags: ["radar-tecnologico", "noticias", "ia", "seguridad", "lenguajes", "infraestructura"]
---
> Fuentes: Hacker News (top 25), Lobsters (hot 10), DEV.to (top 10), StackOverflow API (hot 10) + verificación directa de fuentes primarias vía web_fetch. Hora de corte 19:00 UTC.

## Tendencias del día

### 1. Infraestructura "built for agents" — el patrón dominante
Tres herramientas del día comparten un mismo diseño: la infraestructura se adapta al agente, no al revés.
- **Gnomon** — extensión PostgreSQL que da branches, diff, merge y undo sobre datos reales; cada agente trabaja en `agent/...` como connection string, sin copiar la BD ([gnomon.bitsinfra.com](https://gnomon.bitsinfra.com/), HN 26 pts).
- **Mason** — réplica de lectura Postgres para analytics: sincroniza a DuckDB columnar y reescribe queries al vuelo (10M filas: 15.7s → 0.193s, 81×). Apache-2.0, proceso Node único. Incluye RBAC **por agente** y log de SQL por identidad ([masondata.ai](https://masondata.ai/), HN 32 pts).
- **Songe** (sous-labs) — motor de entrenamiento que usa el compute idle del equipo para mejorar tu modelo local a partir de las sesiones reales de tu agente (correcciones, errores de tools); "Quick Dream" / "Deep Dream", 100% local ([github.com/sous-labs/songe](https://github.com/sous-labs/songe)).
- Contexto cultural: *"LLM agents work for their parent companies, not for you"* (718 pts, [michaelharley.net](https://michaelharley.net/posts/2026/11/01/llm-agents-work-for-their-parent-companies-not-for-you/)) — el debate de gobernanza de agentes (¿de quién es el agente?) sigue calentando, mientras las herramientas responden con sandboxing/observabilidad (branches, RBAC, logs).
- Complemento técnico: *"Code Mode Internals"* — adaptar el patrón code-mode (agentes que llaman CLIs escribiendo código) a tus propias herramientas ([muthuishere.medium.com](https://muthuishere.medium.com/code-mode-internals-and-adapting-them-for-your-clis-and-agent-skills-3a9ae4c9782f)).

### 2. Éxodo de Exchange: Stalwart 1.2.0 es "drop-in replacement"
Stalwart (mail server Rust, AGPL) publicó [1.2.0](https://stalw.art/blog/microsoft-exchange-replacement/) (23-nov, 666 pts HN): implementa MAPI over HTTP, EWS, Exchange ActiveSync y Autodiscover — Outlook, Apple Mail y clientes móviles conectan sin saber que no es Exchange. Mail+calendario+contactos+tareas+notas en una cuenta. El driver: Exchange 2016/2019 fuera de soporte desde 14-oct-2025 y Microsoft solo construye camino hacia Exchange Online. Señal fuerte para self-hosting empresarial.

### 3. Ladybird entra en alpha
El motor de navegador **independiente** (no fork de Chromium/Gecko/WebKit, sin monetización, 501(c)(3)) publicó builds alpha para macOS y Linux el 23-nov ([ladybird.org](https://ladybird.org/), Lobsters 110 pts). Hito mayor del año para la diversidad de motores web; fase de "early adopters que reportan bugs".

### 4. Seguridad: deserialización insegura y campañas activas
- **Hex.pm** sufrió un incidente por aceptar Erlang external term format (ETF) por red: los structs de Elixir (sobre maps de Erlang) activan código implícito vía protocols — lo seguro en Erlang (`binary_to_term(...,[:safe])`) NO es seguro en Elixir. Fix aplicado en `HexpmWeb.ErlangFormat`; la comunidad pide conversión de términos safe nativa en Elixir core ([lobste.rs/s/rfcgkx](https://lobste.rs/s/rfcgkx/security_incident_on_hex_pm)).
- **Check Point**: GreyNoise documenta campaña de intrusión contra Security Management Servers, 17-oct → 2-nov 2026, ≥22 organizaciones confirmadas ([greynoise.io](https://www.greynoise.io/blog/check-point-security-management-servers-intrusion-campaign), HN 167 pts). Relevancia si hay algún appliance de management expuesto.
- **Quad9 retira su servicio de Francia** (24-nov 09:00 CET): multas judiciales por negarse a bloquear dominios que exige beIn (sports rightsholder); su posición: los resolvers recursivos no son herramienta de enforcement de terceros ([quad9.net](https://quad9.net/news/blog/quad9-service-deactivation-in-france/), HN 233 pts). Precedente incómodo para DNS abierto en la UE.

### 5. Renacimiento Postgres (más allá del OLTP)
Cluster de señales: Mason (réplica analítica columnar) + Gnomon (branches/datos versionados) + guía DEV.to de activar logical replication sin restart ([dev.to](https://dev.to/)) + paper **SeaStore**: rediseño del backend de Ceph para NVMe CPU-eficiente (ACM, [dl.acm.org](https://dl.acm.org/doi/10.1145/3828523.3857112)). Postgres se consolida como centro de gravedad de la stack de datos moderna — incluida la de agentes.

### 6. Métodos formales llegan a codebases reales
*"I checked Clojure's core with Lean and found 17 unreported bugs"* (Lobsters 19 pts, [lobste.rs/s/yyktrz](https://lobste.rs/s/yyktrz/i_checked_clojure_s_core_with_lean_found_17)) — verificación formal de una stdlib madura con proof assistant sigue encontrando bugs. Patrón a vigilar: Lean/Coq como fuzzing de alto nivel.

### 7. "2035 came early": JS/WASM se come todo, con ayuda de LLMs
Post más votado del día (841 pts HN, 70 Lobsters, [fzakaria.com](https://fzakaria.com/2026/11/23/2035-came-early)): **trynix.dev** ejecuta GUI completa (Firefox, solitaire, GL gears) en el navegador desde nixpkgs — >300.000 versiones de paquetes Nix corriendo vía JS/WASM. Tesis: la dominación JS de Gary Bernhardt (charla "Birth & Death of JavaScript", endgame 2035) llegó antes de fecha, acelerada por LLMs. Atwood's Law ratificada.

### 8. IA local sin nube
Songe (ver §1) es la pieza nueva: entrenamiento continuo on-device de modelos locales, triggers por idle/batería, rollback con un click, cero telemetría. Línea de tendencia: personalización de modelos sin salir de la máquina.

## Hardware / geopolítica
- **Megaspeed** (partner de Nvidia) recibe ban de exportación del Departamento de Comercio de EE.UU. ([UPI](https://www.upi.com/Top_News/US/2026/11/24/NVIDIA-partner-Megaspeed/1701795520063/), HN 83 pts). La presión sobre la cadena China-GPU sigue escalando.
- **Splitting USB-C**: guía de hardware para tener USB3 y USB2 en un mismo puerto ([frankchiarulli.com](https://www.frankchiarulli.com/blog/splitting-usb-c/)).

## Radar rápido (otras señales)
- **Jetty Pro** — nueva app Mac de John Siracusa (línea DragThing): paletas flotantes de carpetas ([hypercritical.co](https://hypercritical.co/2026/11/23/jetty-pro), HN 147 pts).
- El día dibuja una línea claramente pro-soberanía (self-hosting, DNS neutral, registro seguro): Stalwart + Quad9 + Hex.pm post-mortem.
- **Cgo pointer checking** inconsistente — análisis de los checks de punteros de cgo en Go ([lobste.rs/s/fgbvtt](https://lobste.rs/s/fgbvtt/cgo_s_pointer_check_is_all_over_place)).
- **Lua para representación de datos** (Lobsters 34 pts) — formato de datos alternativo a JSON/YAML.
- **Xcode 27** aparece en preguntas SO (app thinning / Icon Composer) — ciclo Apple activo.
- **Signal** refuerza privacidad (Lobsters 116 pts); **AstridVPN** promete "VPN que no sabe quién eres" (HN).

## Top listas del día (resumen)
**HN top 25** (puntos): LLM agents/parent companies 718 · Stalwart/Exchange 666 · "2035 came early" 841 · GTA6 Recomp banned GitHub 285 · Quad9 France 233 · Brendan Gregg obs 189 · Check Point campaign 167 · Mechanical watch 3D 156 · Jetty Pro 147 · Anthropic/Tegmark 146.
**Lobsters**: Signal privacy 116 · Ladybird alpha 110 · Lua data 34 · Hex.pm incident 26 · Clojure+Lean 19 · cgo pointers 18.
**DEV.to**: guía Jetpack Compose recomposition · agentes/Agent Substrate · Postgres logical replication sin restart · String type en C · docs multi-formato con un script.
**StackOverflow hot**: mix rutinario (regex+HTML, SSH2 prompts en Node, SSL context Java/CXF, SwiftUI volumen, CSVW/RDF, Pylance, CSS flex overflow). Sin pico temático hoy.

## Implicaciones para nuestra stack
1. **Gnomon/Mason** merecen evaluación para el workboard/agentes con acceso a datos: branches por agente + RBAC por identidad reduce el riesgo de escritura destructiva de agentes en Postgres.
2. **Stalwart 1.2.0** — candidato serio si algún día migramos mail self-hosted; AGPL ok para uso interno.
3. **Hex.pm**: recordatorio de que "safe deserialization" es contextual por lenguaje — revisar endpoints que aceptan formatos binarios de ecosistema (ETF, pickle, Java serialization).
4. **Ladybird alpha** — aún no para E2E testing (nuestro QA sigue en Firefox/Playwright), pero watchlist de compatibilidad web.
5. **Quad9 Francia** — si dependemos de resolvers públicos en EU, considerar redundancia multi-resolver.
