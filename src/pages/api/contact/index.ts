import type { APIRoute } from 'astro';

interface ContactFormData {
	name: string;
	email: string;
	message: string;
}

// Validación de email con regex
function isValidEmail(email: string): boolean {
	const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	return emailRegex.test(email);
}

// Sanitización básica para prevenir XSS
function sanitizeInput(input: string): string {
	return input
		.replace(/</g, '&lt;')
		.replace(/>/g, '&gt;')
		.replace(/"/g, '&quot;')
		.replace(/'/g, '&#x27;')
		.replace(/\//g, '&#x2F;');
}

export const POST: APIRoute = async ({ request }) => {
	try {
		const data: ContactFormData = await request.json();

		// Validación de campos requeridos
		if (!data.name || !data.email || !data.message) {
			return new Response(
				JSON.stringify({ error: 'Todos los campos son requeridos' }),
				{ status: 400, headers: { 'Content-Type': 'application/json' } }
			);
		}

		// Validación de longitud
		if (data.name.length < 2 || data.name.length > 100) {
			return new Response(
				JSON.stringify({ error: 'El nombre debe tener entre 2 y 100 caracteres' }),
				{ status: 400, headers: { 'Content-Type': 'application/json' } }
			);
		}

		if (data.message.length < 10 || data.message.length > 2000) {
			return new Response(
				JSON.stringify({ error: 'El mensaje debe tener entre 10 y 2000 caracteres' }),
				{ status: 400, headers: { 'Content-Type': 'application/json' } }
			);
		}

		// Validación de formato de email
		if (!isValidEmail(data.email)) {
			return new Response(
				JSON.stringify({ error: 'El formato del email no es válido' }),
				{ status: 400, headers: { 'Content-Type': 'application/json' } }
			);
		}

		// Sanitización de inputs
		const sanitizedData = {
			name: sanitizeInput(data.name.trim()),
			email: sanitizeInput(data.email.trim().toLowerCase()),
			message: sanitizeInput(data.message.trim())
		};

		// TODO: Aquí iría la integración con servicio de email (SendGrid, Resend, etc.)
		// Por ahora, simplemente logueamos los datos
		console.log('Formulario de contacto recibido:', {
			name: sanitizedData.name,
			email: sanitizedData.email,
			message: sanitizedData.message,
			timestamp: new Date().toISOString()
		});

		// Simulamos envío exitoso
		return new Response(
			JSON.stringify({
				success: true,
				message: 'Mensaje recibido correctamente. Nos pondremos en contacto pronto.'
			}),
			{ status: 200, headers: { 'Content-Type': 'application/json' } }
		);

	} catch (error) {
		console.error('Error procesando formulario de contacto:', error);
		return new Response(
			JSON.stringify({ error: 'Error interno del servidor' }),
			{ status: 500, headers: { 'Content-Type': 'application/json' } }
		);
	}
};

// Método OPTIONS para CORS si es necesario
export const OPTIONS: APIRoute = async () => {
	return new Response(null, {
		status: 204,
		headers: {
			'Access-Control-Allow-Origin': '*',
			'Access-Control-Allow-Methods': 'POST, OPTIONS',
			'Access-Control-Allow-Headers': 'Content-Type'
		}
	});
};
