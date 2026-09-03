# Eerste vrouwen in de Nederlandse gemeenteraden 1919-1923

Statische landingspagina voor de dataset *Eerste vrouwen in de Nederlandse gemeenteraden 1919-1923*, samengesteld door Margit van der Steen.

De dataset zelf staat op DataverseNL: <https://doi.org/10.34894/RYJU04>. Deze repository bevat alleen de website die de dataset toelicht en ernaar verwijst.

Live: <https://eerste-vrouwen-gemeenteraad-1919-1923.huygens.knaw.nl>

## Structuur

```
html/                  de site zelf (statische HTML/CSS)
  index.html
  css/style.css
  img/logo-homepage-intro.svg
cron/                  scripts voor de deploy-container
  crontab              draait crontask.sh elk uur
  crontask.sh          cloont/pullt deze repo en kopieert html/ naar het volume
  entrypoint_cron.sh   installeert de crontab en start cron
Dockerfile             image voor de cron-container
Docker-compose.yml     nginx + cron-container achter Traefik
```

## Deploy

De site wordt niet gebouwd; `html/` wordt rechtstreeks geserveerd. Twee containers delen één Docker-volume:

- **web** — nginx, serveert het volume, wordt via Traefik-labels op de hostname gerouteerd.
- **cron** — pullt elk uur deze repository van GitHub en kopieert `html/` naar hetzelfde volume.

Een wijziging op `main` staat dus uiterlijk een uur later online; verder is er geen deploy-stap.

Starten:

```sh
docker compose -f Docker-compose.yml up -d --build
```

Het externe netwerk `traefik-public` moet bestaan.

## Lokaal bekijken

`html/index.html` heeft geen build of server nodig — openen in de browser volstaat. Voor correcte paden eventueel:

```sh
python3 -m http.server -d html 8000
```

## Licentie

MIT, zie [LICENSE](LICENSE).
