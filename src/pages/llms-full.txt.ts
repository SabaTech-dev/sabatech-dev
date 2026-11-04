import { getCollection } from "astro:content";

const SITE = "https://sabatech.dev";

export async function GET({ site }) {
  const posts = (await getCollection("blog", ({ data }) => !data.draft))
    .sort((a, b) => b.data.pubDate.valueOf() - a.data.pubDate.valueOf());

  const parts = [
    "# SabaTech — contenido completo del blog",
    "",
    "> Versión extendida de llms.txt con el contenido íntegro de las publicaciones.",
    "",
  ];

  for (const p of posts) {
    parts.push(`---\n\n## ${p.data.title}\n`);
    parts.push(`URL: ${SITE}/blog/${p.id}\n`);
    parts.push(`Fecha: ${p.data.pubDate.toISOString().slice(0, 10)}\n`);
    if (p.data.tags?.length) parts.push(`Etiquetas: ${p.data.tags.join(", ")}\n`);
    parts.push(`\n${(p.body ?? "").trim()}\n`);
  }

  return new Response(parts.join("\n"), {
    headers: { "Content-Type": "text/plain; charset=utf-8" },
  });
}
