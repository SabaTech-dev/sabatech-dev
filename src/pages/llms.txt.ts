import { getCollection } from "astro:content";

const SITE = "https://sabatech.dev";

const pages = [
  ["QA Framework", "/qa-framework", "The first QA framework built for AI-assisted development: automated E2E testing, quality gates and agentic test generation."],
  ["Security Audit", "/security", "Auditorías de seguridad IA para aplicaciones agénticas: OWASP Agentic Apps 2026, EU AI Act, NIST AI RMF, pentesting y vulnerability assessment."],
  ["Orquestación", "/orquestacion", "Sistema operativo para agentes de IA: orquestación multi-agente, memoria persistente y pipelines de seguridad."],
  ["Saba LLM Auto-Train", "/saba-llm-auto-train", "Entrenamiento y fine-tuning automatizado de LLMs."],
  ["Saba Agent OS", "/saba-agent-os", "Sistema operativo para agentes de IA."],
  ["Asistente Conversacional", "/asistente-conversacional", "Asistente conversacional de voz 100% offline: pipeline en tiempo real ASR → LLM → TTS."],
  ["Pricing", "/pricing", "Planes y precios de SabaTech."],
  ["About", "/about", "Sobre SabaTech."],
  ["Team", "/team", "El equipo de SabaTech."],
];

export async function GET({ site }) {
  const posts = (await getCollection("blog", ({ data }) => !data.draft))
    .sort((a, b) => b.data.pubDate.valueOf() - a.data.pubDate.valueOf());

  const lines = [
    "# SabaTech",
    "",
    "> SabaTech desarrolla herramientas self-hosted para equipos que llevan LLMs a producción: QA-FRAMEWORK (el primer framework de QA para desarrollo asistido por IA), auditoría de seguridad agéntica (OWASP Agentic Apps 2026, EU AI Act, NIST AI RMF) y orquestación multi-agente. Contenido técnico en español e inglés.",
    "",
    ...pages.map(([name, path, desc]) => `- [${name}](${SITE}${path}): ${desc}`),
    "",
    "## Blog",
    "",
    ...posts.map((p) => `- [${p.data.title}](${SITE}/blog/${p.id}) (${p.data.pubDate.toISOString().slice(0, 10)}): ${p.data.description}`),
    "",
    "## Contacto",
    "",
    "- [RSS del blog](${SITE}/rss.xml): feed completo para suscripción.",
    "- Contenido generado y verificado por el equipo SabaTech (humano + agentes de IA).",
    "",
  ];

  return new Response(lines.join("\n"), {
    headers: { "Content-Type": "text/plain; charset=utf-8" },
  });
}
