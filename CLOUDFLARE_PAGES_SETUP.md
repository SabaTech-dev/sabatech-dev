# Cloudflare Pages Setup para Sabatech.dev

## Resumen
Este documento contiene las instrucciones para configurar Cloudflare Pages con el repo de Sabatech.dev en GitHub.

## Pre-requisitos
- ✅ Repo GitHub creado: `SabaTech-dev/sabatech-dev`
- ✅ DNS apuntando a Cloudflare: `marjory.ns.cloudflare.com`, `ganz.ns.cloudflare.com`
- ✅ Sitio Astro construyendo correctamente (verificado localmente)

## Pasos de Configuración

### 1. Conectar GitHub con Cloudflare Pages
1. Ir a: https://dash.cloudflare.com/
2. Seleccionar el dominio `sabatech.dev`
3. Ir a "Workers & Pages" → "Create application"
4. Seleccionar "Pages" → "Connect to Git"
5. Autorizar Cloudflare para acceder a tu cuenta de GitHub
6. Seleccionar el repo: `SabaTech-dev/sabatech-dev`

### 2. Configurar el Build
**Build Settings:**
- **Framework preset:** Astro
- **Build command:** `npm run build`
- **Build output directory:** `dist`

**Environment Variables (no necesarias para este proyecto básico):**
- Ninguna por ahora (si el proyecto crece, agregar `NODE_VERSION=18`)

### 3. Configurar el Dominio
1. En la página del proyecto en Cloudflare Pages
2. Ir a "Custom domains"
3. Hacer clic en "Set up a custom domain"
4. Ingresar: `sabatech.dev`
5. Cloudflare detectará automáticamente los DNS records necesarios

### 4. Verificar DNS Records
Después de conectar el dominio, Cloudflare Pages creará automáticamente:

```
Type: CNAME
Name: sabatech.dev
Target: <pages-project-name>.pages.dev
Proxy: ☑️ Proxied (orange cloud icon)
```

### 5. Configurar SSL Full (Strict)
1. Ir al dashboard de Cloudflare → Dominio `sabatech.dev`
2. Navegar a "SSL/TLS" → "Overview"
3. Seleccionar **"Full (strict)"**
4. Asegurar que el certificado esté "Active"

**NOTA:** SSL Full (Strict) requiere que Cloudflare Pages proporcione un certificado válido. Cloudflare lo hará automáticamente.

### 6. Deploy Automático
Después de configurar, cada push a `main` en GitHub desencadenará un deploy automático en Cloudflare Pages.

## Verificación

### Local Build (✅ VERIFICADO)
```bash
cd /home/ubuntu/.openclaw/workspace/sabatech-dev
npm run build
# Resultado: 8 páginas construidas exitosamente
```

### Verificación Post-Deploy
1. Visitar `https://sabatech.dev` - debería mostrar el homepage de SabaTech
2. Verificar que las rutas funcionan:
   - `/about` - Sobre nosotros
   - `/security` - Seguridad
   - `/orquestacion` - Orquestación
   - `/qa-framework` - QA-FRAMEWORK
   - `/team` - Equipo
   - `/contact` - Contacto
   - `/blog` - Blog
3. Verificar el certificado SSL (candado verde en el navegador)
4. Verificar que el branding está aplicado (negro #0a0a0a, rojo #e63946)

## Rollback Plan (si algo falla)

### Si Cloudflare Pages no funciona:
1. Desactivar el proyecto en Cloudflare Pages
2. Restaurar DNS records originales:
   ```
   Type: A
   Name: sabatech.dev
   Content: 64.29.17.1, 216.198.79.1
   Proxy: ☑️ Proxied
   ```

### Si el build falla:
1. Verificar logs en Cloudflare Pages → "Builds" → Último build
2. Revisar que `package.json` tiene el script `build`
3. Verificar que `astro.config.mjs` está configurado correctamente

### Si el SSL no funciona:
1. Verificar que Cloudflare tiene "Full (strict)" seleccionado
2. Verificar que el certificado de Cloudflare Pages está activo
3. Si falla, cambiar a "Flexible" temporalmente e investigar

## Estado Actual
- ✅ Repo GitHub creado
- ✅ Estructura de carpetas Astro configurada
- ✅ Branding aplicado
- ✅ Local build verificando
- ⏳ Esperando configuración manual de Cloudflare Pages

## Siguiente Paso
Una vez configurado Cloudflare Pages, verificar que `https://sabatech.dev` carga correctamente y todas las rutas funcionan.

---

**Documento creado por:** DevOps Agent
**Fecha:** 2026-05-07
**Estado:** Pendiente configuración manual
