# Fichamento — Ciclo 1

**Consulta:** `"species occurrence" AND "software"` (pesquisa em inglês)
**Data:** 05/10/2026
**Resultado bruto:** 10 hits relevantes; nenhum hit "nulo" — combinação altamente produtiva.

## Contexto geral

A interseção "species occurrence" + "software" é dominada por três grandes famílias de ferramentas:
(i) **coleta/download** de registros de ocorrência (SDMdata, rgbif/spocc);
(ii) **limpeza/QC** de registros (CoordinateCleaner, occAssess, occTest);
(iii) **agregação para análise** (occurrence cubes do projeto B-Cubed/GBIF, SpeciesGeoCoder, speciesgeocodeR).

Uma quarta família emergente usa LLMs para extrair ocorrências de texto não estruturado (ARETE)[1].

## Fontes fichadas

### 1. ARETE — R package: Automated REtrieval from TExt [1]

- **O quê:** pacote R para extração automática de dados de ocorrência de espécies de texto não estruturado (literatura científica e cinzenta) com LLMs fine-tunados.
- **Motivação:** grande parte dos dados de ocorrência permanece "oculta" em texto, não em bancos (GBIF/iNaturalist); falência de Wallace (Cardoso et al. 2011).
- **Relevância:** mostra que o frontier atual é _geração_ de dados de ocorrência, não só processamento; os autores observam que trabalhos anteriores eram "specific to each question and not made available in ready-to-use software packages".

### 2. SDMdata — web tool for collecting occurrence records [2][7]

- **O quê:** software web (Python + Flask + GDAL) de código aberto para baixar ocorrências do GBIF, checar nomes de espécies contra o banco GBIF e validar coordenadas; saída em CSV.
- **Detalhe de UX:** daemon independente com "break-point memory protection" — o processo pode ser interrompido e retomado (ponto-chave de UX para jobs longos).
- **Relevância:** exemplo clássico de software de _coleta_; motivado por limitações do modestR (4,6 GB, Windows-only) — acessibilidade cross-platform como argumento central.

### 3. GOTIT — Gene Occurrence and Taxa in Integrative Taxonomy [3]

- **O quê:** LIMS (laboratory information management system) + web app para dados de ocorrência multi-critério (morfológicos + DNA) em projetos de taxonomia integrativa.
- **Relevância:** único software do ciclo focado no _workflow de laboratório_ (amostragem → sequenciamento → hipóteses de espécies) e não em dados já digitalizados; destaca _traceabilidade_ e acesso multiusuário por papéis.

### 4. B-Cubed / GBIF occurrence cubes [4][5][15]

- **O quê:** especificação (D2.1) + implementação (D2.2) de "species occurrence cubes": agregação de ocorrências ao longo de dimensões taxonômica, temporal e espacial, como serviço no GBIF.
- **Relevância:** é o padrão de dados "analysis-ready" atual; a especificação define requisitos MUST/SHOULD/MAY para o software que produz cubes — documentação de requisitos de software para dados de ocorrência, raro na literatura.

### 5. speciesgeocodeR [6]

- **O quê:** pacote R para limpeza automatizada de ocorrências pontuais e codificação em áreas operacionais discretas, com vínculo a árvores filogenéticas.
- **Relevância:** motivação de UX explícita: classificação manual de pontos em áreas é "tedious", "time consuming and error-prone"; o pacote é "user-friendly" com tutorial ilustrado.

### 6. GLOSSA — R Shiny para SDM bayesiano marinho [8]

- **O quê:** aplicação Shiny para modelar distribuições de espécies marinhas sem exigir skills de programação avançada ("intuitive and interactive GUI").
- **Relevância:** exemplo do padrão _Shiny como democratização_ de análise de ocorrências.

### 7. SpeciesGeoCoder [9]

- **O quê:** ferramenta Python (point-in-polygon + GDAL) para categorizar ~644M ocorrências do GBIF em polígonos, com saída em formato Nexus para BioGeoBEARS etc.
- **Relevância:** ênfase em _reprodutibilidade_ e exploração rápida de datasets grandes.

### 8. occAssess [10]

- **O quê:** pacote R para detectar vieses em dados de ocorrência (taxonômico, geográfico, temporal, ambiental).
- **Citação-chave:** "One way to encourage the proper use of species occurrence data is to develop software that can facilitate the various tasks involved, thereby easing the burden on researchers' time."
- **Relevância:** formula explicitamente a tese do software como alívio de carga de trabalho — útil para justificativa de projeto.

### 9. spocc (rOpenSci) [docs: http://docs.ropensci.org/spocc]

- **O quê:** interface única para 7+ repositórios de ocorrências (GBIF, iNaturalist, eBird, iDigBio, VertNet, OBIS, ALA).
- **Relevância:** citação de UX direta: "The inspiration for this comes from users requesting a more seamless experience across data sources" — evidência de demanda por UX unificada entre provedores.

## Síntese (gaps para o fichamento)

1. A literatura de software de ocorrências é **dominada por R** (pacotes + Shiny) e Python; GUIs web dedicadas são minoria.
2. Recorrência de temas de UX _implícitos_: jobs longos com retomada, tutorial ilustrado, "user-friendly", GUI para não-programadores — **nenhum artigo trata UX como objeto de estudo** (ver ciclo 2).
3. A especificação B-Cubed [4] é a única fonte que formaliza _requisitos de software_ (RFC 2119) para processamento de ocorrências — modelo útil se o usuário quiser estruturar requisitos próprios.

## Fontes

1. ARETE: https://arxiv.org/html/2511.04573
2. SDMdata (PMC): https://ncbi.nlm.nih.gov/pmc/articles/PMC4452258
3. GOTIT: https://doi.org/10.1111/2041-210x.13307
4. B-Cubed occurrence cube spec: https://docs.b-cubed.eu/guides/occurrence-cube
5. B-Cubed D2.1: https://b-cubed.eu/storage/app/uploads/public/691/1e0/8f8/6911e08f84bfc404506636.pdf
6. speciesgeocodeR: https://biorxiv.org/content/10.1101/032755v1.full-text
7. SDMdata (PLoS ONE XML): https://storage.googleapis.com/plos-corpus-prod/10.1371/journal.pone.0128295/1/pone.0128295.xml
8. GLOSSA: https://doi.org/10.1111/2041-210x.70167
9. SpeciesGeoCoder: https://ncbi.nlm.nih.gov/pmc/articles/PMC5410971
10. occAssess: https://pmc.ncbi.nlm.nih.gov/articles/PMC8601935
