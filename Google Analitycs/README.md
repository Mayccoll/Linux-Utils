# Google Analitycs

1. [Views](#Views)
2. [Filters](#Filters)
3. [Goals](#Goals)

--------------------------------------------------------------------------------

## Views

### Todos los datos sin tráfico IP_NUMBER

- Fillter > Exclude Digital Active IP IP_NUMBER

### Todos los datos sitio web

- Fillter > None

### Solo Trafico cpc

- Fillter > Exclude Digital Active IP IP_NUMBER
- Fillter > Solo Trafico cpc

### Solo Trafico Desktop

- Fillter > Exclude Digital Active IP IP_NUMBER
- Fillter > Solo Trafico Desktop

### Solo Trafico Mobile

- Fillter > Exclude Digital Active IP IP_NUMBER
- Fillter > Solo Trafico Mobile

### Solo Trafico Redes Sociales

- Fillter > Exclude Digital Active IP IP_NUMBER
- Fillter > Solo Trafico Redes Sociales

### Todos los datos de blog

- Fillter > Exclude Digital Active IP IP_NUMBER
- Fillter > Include Subdirectori

### Todos los datos Sin blog

- Fillter > Exclude Digital Active IP IP_NUMBER
- Fillter > Exclude Subdirectori

### Solo Trafico Digital Active

--------------------------------------------------------------------------------

## Filters

### Exclude Digital Active IP IP_NUMBER

- Filter Name > Exclude Digital Active IP IP_NUMBER
- Filter Type > Predefined
- Exclude
- traffic from the IP addresses
- that are equal to
- `IP_NUMBER`

### Solo Trafico Mobile

- Filter Name > Include Mobile Traffic
- Filter Type > Custom
- Include

  - Filter Field > Device category > Mobile

### Solo Trafico Desktop

- Filter Name > Include Desktop Traffic
- Filter Type > Custom
- Include

  - Filter Field > Device category > Desktop

### Solo Trafico cpc

- Filter Name > Include only cpc traffic
- Filter Type > Custom
- Include

  - Filter Field > Campaign Medium > cpc

### Solo Trafico Redes Sociales

- Filter Name > Include only social media
- Filter Type > Custom
- Include

  - Filter Field > Campaign Source > Facebook|Twitter|LinkedIn|Toolbox.com|Stack Exchange|reddit|Pocket|Disqus|Google Groups|Pinterest

### Include Subdirectori

- Filter Type > Predefined
- Include
- traffic to the subdirectories
- that begin with
- `/noticias`

### Exclude Subdirectori

- Filter Type > Predefined
- Exclude
- traffic to the subdirectories
- that begin with
- `/noticias`

### Exclude Traffic From Host

- Filter Type > Predefined
- Exclude
- traffic to the hostname
- that contain
- `datest`

### Include Digital Active IP IP_NUMBER

- Filter Name > Include Digital Active IP IP_NUMBER
- Filter Type > Predefined
- Include
- traffic from the IP addresses
- that are equal to
- `IP_NUMBER`

### Lowercase Campaign

- Filter Name > Lowercase Campaign
- Filter Type > Custom
- Lowercase

  - Filter Field > Campaign Source

### Lowercase Request URL

- Filter Name > Lowercase Request URL
- Filter Type > Custom
- Lowercase

  - Filter Field > Request URL

--------------------------------------------------------------------------------

## 3\. Goals

<https://analytics.google.com/analytics/web/template?uid=hhnhX1eKTtmggCTwG490Yw>

### Goals > **Todos los Gracias**

- Template: View More
- Todos los Gracias
- Destination
- Regular Expression `(.*?)gracias(.*?)`

### Goals > **Ver Pagina Contactenos**

- Template: View More
- Todos los Gracias
- Destination
- Regular Expression `(.*?)(\/contactenos)`
