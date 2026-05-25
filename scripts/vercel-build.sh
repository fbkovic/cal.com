#!/usr/bin/env bash
set -euo pipefail

# Vercel build wrapper:
# 1. Disable Cal.com auto-migrations (we run them manually against Supabase).
# 2. Bundle Vercel project env vars into .env so Next.js picks them up at build time.
# 3. Run the web app build.

echo 'SKIP_DB_MIGRATIONS=1' > .env

env | grep -E '^(DATABASE|NEXTAUTH|CALENDSO|NEXT_PUBLIC|VAPID|CRON|GOOGLE|MS_GRAPH|STRIPE|SENDGRID|EMAIL|RESEND|SMTP|INSIGHTS|SAML|RESERVED|ALLOWED|ORGANIZATIONS|PGSSLMODE|INTERCOM|HUBSPOT|ZENDESK|HELPSCOUT|FRESHCHAT|PLAUSIBLE|POSTHOG|UMAMI|MATOMO|DUB|SINK|SENTRY|TRIGGER|CALCOM|API_KEY|ENCRYPTION|JWT|WEBHOOK|TURNSTILE|RECAPTCHA|MICROSOFT|APPLE|ZOHO|SALESFORCE)' >> .env

npx turbo run build --filter=@calcom/web
