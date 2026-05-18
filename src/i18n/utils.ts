import en from "./en";
import es from "./es";

export type TranslationKey = keyof typeof en;
export type Translations = typeof en;

export const translations: Record<string, Translations> = { en, es };

export const defaultLang = "en";
export const supportedLangs = ["en", "es"] as const;
export type SupportedLang = (typeof supportedLangs)[number];

export function getTranslations(lang: string): Translations {
  return translations[lang] || translations[defaultLang];
}

export function t(key: TranslationKey, lang: string = defaultLang): string {
  const dict = getTranslations(lang);
  return (dict as Record<string, string>)[key] || key;
}
