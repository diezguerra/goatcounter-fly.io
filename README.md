# Goatcounter Fly.io deployment

This repo contains the `Dockerfile` and `fly.toml` neccessary to build and
deploy [goatcounter](https://www.goatcounter.com/)
to the [fly.io](https://fly.io)
cloud.

## Needed Fly.io secrets

* `GOATCOUNTER_DB`
    * Format like `GOATCOUNTER_DB="postgres+user=<REDACTED> password=<REDACTED> host=<REDACTED> port=5432 sslmode=disable"`
    * Run `goatcounter db help` for more info
* `GOATCOUNTER_LISTEN` e.g. `0.0.0.0:8080`
* `GOATCOUNTER_EMAIL` e.g. `your@email.com`

## Initial creation

On initial deployment, a first `createsite` command needs to be run.
That can be done using the `flyctl ssh console` command.
