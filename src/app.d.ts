// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces

declare global {
  namespace App {
    // interface Error {}
    interface Locals {
      auth: import('lucia').AuthRequest;
    }
    // interface PageData {}
    // interface Platform {}
  }
}

declare global {
  namespace Lucia {
    type Auth = import('$lib/server/lucia').Auth;
    type DatabaseUserAttributes = {
			name: string;
			email: string;
		};
    type DatabaseSessionAttributes = Record<string, never>;
  }
}

export {};
