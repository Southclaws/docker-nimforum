# nimforum

A Dockerfile for [nim forum](https://github.com/nim-lang/nimforum).

## Configuration

- `FORUM_NAME` The forum name
- `FORUM_TITLE` A shorter title
- `FORUM_HOSTNAME` The full host name
- `FORUM_RECAPTCHA_SITE_KEY` Recaptcha site key
- `FORUM_RECAPTCHA_SECRET_KEY` Recaptcha secret key
- `FORUM_SMTP_ADDRESS` SMTP mail server address
- `FORUM_SMTP_USER` SMTP mail server username
- `FORUM_SMTP_PASSWORD` SMTP mail server password
- `FORUM_IS_DEV` true/false for dev mode

The database is stored in a directory named `shared` which is declared as a
volume in the Dockerfile for persistence.
