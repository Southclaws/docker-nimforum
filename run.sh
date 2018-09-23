#!/bin/sh

FORUM_NAME=${FORUM_NAME:-Forum}
FORUM_TITLE=${FORUM_TITLE:-Forum}
FORUM_HOSTNAME=${FORUM_HOSTNAME:-forum.example.com}
FORUM_RECAPTCHA_SITE_KEY=${FORUM_RECAPTCHA_SITE_KEY:-abc}
FORUM_RECAPTCHA_SECRET_KEY=${FORUM_RECAPTCHA_SECRET_KEY:-abc}
FORUM_SMTP_ADDRESS=${FORUM_SMTP_ADDRESS:-mail.example.com}
FORUM_SMTP_USER=${FORUM_SMTP_USER:-"user@example.com"}
FORUM_SMTP_PASSWORD=${FORUM_SMTP_PASSWORD:-password}
FORUM_IS_DEV=${FORUM_IS_DEV:-false}

# set up as if we're dev
# this forces the admin account to be created
./setup_nimforum --dev
mv nimforum-dev.db shared/nimforum.db

# then overwrite the config with our actual data
cat >forum.json <<EOF
{
    "name": "$FORUM_NAME",
    "title": "$FORUM_TITLE",
    "hostname": "$FORUM_HOSTNAME",
    "recaptchaSiteKey": "$FORUM_RECAPTCHA_SITE_KEY",
    "recaptchaSecretKey": "$FORUM_RECAPTCHA_SECRET_KEY",
    "smtpAddress": "$FORUM_SMTP_ADDRESS",
    "smtpUser": "$FORUM_SMTP_USER",
    "smtpPassword": "$FORUM_SMTP_PASSWORD",
    "isDev": $FORUM_IS_DEV,
    "dbPath": "shared/nimforum.db"
}
EOF

./forum
