# Fichamento — Ciclo 3

**Consulta original (PT):** `"species occurrence" AND "software" AND ("data curation and structuring" OR "community matrix compilation" OR "ecological data wrangling" OR "data cleaning" OR "taxonomic standardization and database management")`
**Estruturação lógica aplicada (EN):**
```
"species occurrence" AND "software" AND (
    "data curation and structuring" OR
    "community matrix compilation" OR
    "ecological data wrangling" OR
    "data cleaning" OR
    "taxonomic standardization and database management"
)
```
**Observação de busca:** os strings exatos do grupo OR raramente ocorrem literalmente; a busca foi executada com as citações completas (retornando poucos hits) e complementada com as variantes naturais de cada termo (data curation, taxonomic standardization, data cleaning, community matrix). O fichamento abaixo reúne o que cada ramo do OR retornou de útil.
**Data:** 05/10/2026

## Ramo a ramo

### RAMO A — "data curation and structuring" / data curation
**Hit central: OCCUR Shiny application (Methods in Ecology and Evolution)** [33]
- **O quê:** aplicação Shiny (R) que é um *guia interativo de curadoria* de registros de ocorrência: 5 módulos (taxonômico, temporal, espacial, duplicados) que condensam a literatura de data cleaning em um fluxo que o usuário escolhe e valida.
- **Achado de problema (citável):** "These curation processes are often neither described in detail nor well documented. This hampers the comparability and reproducibility of studies." → a curadoria de ocorrências é hoje **ad hoc e mal documentada**.
- **UX:** o valor principal é transformar literatura dispersa (artigos, relatórios, manuais de software) em "a user-friendly guide"; gera automaticamente um relatório de curadoria para a seção de métodos do manuscrito.
- **Relevância:** é o estado-da-arte mais próximo de um "software de curadoria de matrizes" com consciência de reprodutibilidade.

**OCCUR + literatura de curadoria relacionada:**
- **CoordinateCleaner (GBIF news)** [20] — R library para limpar problemas de geolocalização; em ~91M registros de plantas do GBIF, flagou **3,6% dos registros** e **18,5% dos datasets** com viés de rasterização/arredondamento. Cita a tese: "With more than two scientific articles relying on species occurrence data from GBIF.org published every day, ensuring the data quality... is critical."
- **CoordinateCleaner (artigo, MEcE 2019)** [39] — versão completa: 9.691 instituições bio-diversidade mapeadas para detectar horticultura/cativeiro; algoritmos para rasterização, erro de conversão e arredondamento; limpa 3,7% de 90M+ registros.
- **BDcleaner** [22] — workflow para limpeza de erros taxonômicos e geográficos (Global Ecology and Conservation 2020).
- **Zizka et al. 2020 "No one-size-fits-all solution to clean GBIF"** [23] — evidência de que *não existe limpeza única* — resultado varia com método; citada 194×. **Ponto crucial para justificativa de projeto:** a escolha do método de limpeza altera os resultados.
- **occTest (NSF PAR)** [36] — pacote R que sintetiza o ecossistema de limpeza em estrutura hierárquica: testPhases → testBlocks → testTypes → testMethods (geográfico, ambiental, influência humana, temporal). Permite rodar múltiplos métodos e explorar *consenso* entre eles — resposta direta ao "no one-size-fits-all".
- **Chapman 2005 (GBIF document)** [21] — "Principles and Methods of Data Cleaning: Primary Species and Species-Occurrence Data" — o documento fundacional de cleaning de dados de ocorrência (base de tudo; citado inclusive em meeting de 2009 [GE-BICH]).

### RAMO B — "community matrix compilation"
**Hits centrais (matrizes espécie×amostra / site-by-species):**
- **dissmapr (B-Cubed)** [30][43] — pacote R com workflow completo que **converte registros de ocorrência em matrizes site-by-species e site-by-environment** sobre grid comum ("harmonise everything onto a common grid as site-by-species and site-by-environment matrices"). Função `format_df()` faz a reshape long→wide. É a materialização mais recente do conceito de "compilar matriz de composição comunitária" a partir de ocorrências brutas.
- **Dissimilarity Cube guide (B-Cubed)** [44] — extensão conceitual: estrutura multi-dimensional onde cada célula de grid é um assemblage; "Species occurrence records are compiled and aggregated to a regular spatial grid, defining local assemblages".
- **HMSC (Ovaskainen et al.)** [28][29] — framework JSDM; define formalmente as **matrizes Y (ocorrências), X (ambiente), T (traits), C (filogenia)**; a matriz Y é a "occurrence data... the occurrences of the species recorded in a set of temporal and/or spatial sampling units". Referência clássica para estrutura de dados comunitários.
- **labdsv** [46] — funções para converter "database form to the sparse matrix form required by multivariate analyses in packages 'labdsv' and 'vegan'" — utilidade exata de *compilar matriz* a partir de dados em formato de banco.
- **spaa::data2mat** [48] — função dedicada: "Convert species list data to species matrix... rows are plots/sites, columns are species".
- **ecoPD::siteBySpecies** — gera site-by-species matrix de um objeto phylo4com (present/abs ou abundância, com controle de NA→zero e transposição).
- **P.I. Charter (Ecology and Evolution 2026)** [37] — app Shiny que **coleta, limpa e compila** dados de plantas aquáticas (point-intercept) no Minnesota; destaque: "leverage R's data-wrangling capabilities to unify disparate data—*an otherwise time-intensive task*—is perhaps its most salient feature". Casos de uso incluem "elucidate long-term trajectories of plant community composition".

### RAMO C — "ecological data wrangling"
- **P.I. Charter** [37] — mesmo hit do Ramo B: usa tidyverse para wrangling de dados de ocorrências coletados por múltiplas entidades.
- **Kass et al. 2025 (Ecography, PDF)** [18] — "Achieving higher standards in species distribution modeling by leveraging the diversity of available software": mapeia **todos** os pacotes R de download (rgbif, BIEN, robis), cleaning (modleR, sdm, bdc, CoordinateCleaner, sampbias) e modelagem. Citação: "SDM analysis involves multiple linked tasks... downloading data from public repositories, tabular data management and cleaning, manipulation of geospatial data, and statistical modeling." — **melhor mapa de ecossistema** para a seção de referências.
- **EcoCleanR (CRAN + vignette)** [16][17] — pacote R (Ecography 2024) que automatiza *integração de biodiversidade de múltiplos agregadores* (GBIF, OBIS, iDigBio): download, merge, limpeza de inconsistências taxonômicas, problemas de georreferenciamento e outliers espaciais/ambientais. Vignette mostra o passo a passo: `occ_data()` do rgbif → `occurrence()` do robis → `idig_search_records()` → `ec_db_merge()` com atributos padronizados TDWG.
- **RuHere vignette** [19] — exemplo didático de obtenção e preparo de ocorrências: `prepare_gbif_download()`, `format_columns()` ("standardizes column names, extracts clean binomials, and fixes data types"), `bind_here()` ("combines multiple standardized occurrence data frames into a single dataset"), `spatialize()`.
- **gbif-bulk (GitHub, FRBCesab)** [27] — pipeline de 7 passos em R: resolver nomes aceitos → download → limpeza → grid mundial → interseção → range size → richness. Exemplo de *pipeline de agregação* reproduzível.
- **Improving ecological data science with workflow management software (MEcE)** [40] — argumento para usar WMS (targets/drake) em pipelines de dados de ocorrência ("billions of species occurrence records"); WMS aumenta reprodutibilidade e reduz dependência de execução manual.
- **spocc (rOpenSci)** — wrangling *cross-source*: uma interface para 7 provedores, unificando outputs (motivação citada: "users requesting a more seamless experience across data sources").

### RAMO D — "data cleaning"
(Coberto extensivamente no Ramo A: CoordinateCleaner, BDcleaner, occTest, Zizka 2020, Chapman 2005.)
**Adicionais:**
- **Semi-automated Taverna workflow (BDJ + PMC)** [34][35] — workflow em Taverna WMS integrando retrieval + enrichment + cleaning (OpenRefine com extensão BioVeL) + name resolution. Três categorias de limpeza: *Data Quality Checks, Data Transformation, Data Extension*. Usável via web-portal sem instalação local.
- **GBIF "Cleaning GBIF data for use in Ecology" (TESS/Elixir hands-on)** — tutorial prático de limpeza de dados GBIF (learning objectives: obter ocorrências, visualizar, limpar).
- **Collating biodiversity occurrence data for conservation (Frontiers in Ecology and Evolution)** [38] — South African National Parks; observa "there are limited data-entry-ready software options available to collate species data across the multiple available data sources, match names to accepted taxonomies and develop species checklists"; propõe banco relacional simples (taxon table + occurrence records) — inclusive viável em Excel com Power Pivot.

### RAMO E — "taxonomic standardization and database management"
- **BioTIME 2.0 (Zenodo)** [45] — database de abundância temporal de assemblages ecológicos, v2.0 com "substantial additional curation to the taxonomic accuracy of the records"; acompanha R package (BioTIMEr).
- **BRAHMS (Oxford)** [47] — software de banco de dados para herbarios, com módulos "Taxonomic Research" e "Collection Curation" — gestão taxonômica de coleções.
- **Demosponge global dataset (Data in Brief, via Exa)** — 4.776.338 registros agregados de múltiplas fontes → **taxonomic standardization com WoRMS** + desduplicação → 417.626 registros de 1.816 espécies; formato Darwin Core. Documenta o pipeline completo de curadoria taxonômica marinha.
- **letsRept** — pacote R para harmonização taxonômica de répteis contra o Reptile Database (detecção de lumping/splitting).
- **NFDI4Earth pilot (foraminíferos)** — "lack of common taxonomic standards... limit reusability of fossil data"; pipeline de harmonização de taxonomia em PANGAEA.
- **Taxonstand (Cayuela et al.)** — pacote R de standardização de nomes de plantas; usado em vários papers como passo de standardização (ex.: dataset Central America/México, 333.411 ocorrências).
- **Chapman 2005** [21] e **GE-BICH 2009** — bases de padronização taxonômica (WoRMS/ITIS/CaL como vocabulários mestres; Darwin Core como formato).

## Síntese — o que a literatura mostra (e o gap)

1. **Ecossistema maduro, fragmentado:** existem dezenas de ferramentas, cada uma cobrindo um sub-passo (download: rgbif/spocc; cleaning: CoordinateCleaner/occTest; taxonomia: taxize/TNRS/Taxonstand; matriz: labdsv/spaa/vegan). **Nenhum software único cobre do download à matriz final** — o "glue" é script do pesquisador [18].
2. **A etapa de "compilar a matriz de composição comunitária" é tratada como banal** (um `format_df()` no dissmapr, um `data2mat` no spaa) — **não há software dedicado, nem literatura que a trate como problema de UX/ergonomia**. É o ponto onde um software novo teria espaço.
3. **Curadoria é o elo fraco documentado:** OCCUR [33] e Zizka 2020 [23] concordam que a curadoria é ad hoc, varia por método, e muda os resultados — mas a solução proposta é *guia/reprodutibilidade*, não *interface*.
4. **O padrão de UX emergente:** GUIs Shiny para não-programadores (OCCUR, P.I. Charter, GLOSSA) + report automático de métodos — mas sem método de pesquisa de usuários.
5. **Para o projeto do usuário** (se for software de curadoria/estruturação de matrizes de composição): a contribuição diferencial plausível é (a) **unificar** os passos fragmentados num fluxo, (b) tornar a **compilação da matriz** explícita e transparente (o que hoje é invisível em `format_df()`), e (c) **documentar a curadoria** automaticamente (OCCUR provou a demanda).

## Fontes

16. EcoCleanR vignette: https://zentaquabula.stat.unipd.it/web/packages/EcoCleanR/vignettes/data_merging.html
17. EcoCleanR CRAN: https://cran.r-project.org/web//packages//EcoCleanR/index.html
18. Kass et al. 2025 Ecography: https://www.cb.iee.unibe.ch/unibe/portal/fak_naturwis/d_dbio/b_ioekev/abt_cb/content/e58879/e337551/e1640689/e1657933/Kass_Ecogra2025_eng.pdf
19. RuHere vignette: https://cran.r-project.org/web/packages/RuHere/vignettes/obtaining_data.html
20. CoordinateCleaner GBIF: https://www.gbif.org/data-use/5lkEzTJaUPAZyCGUC3PDKC/coordinatecleaner-fast-and-standardized-cleaning-of-species-occurrence-data
21. Chapman 2005: https://www.gbif.org/document/80528/principles-and-methods-of-data-cleaning-primary-species-and-species-occurrence-data
22. BDcleaner: https://www.sciencedirect.com/science/article/pii/S235198941930633X
23. Zizka 2020: https://pmc.ncbi.nlm.nih.gov/articles/PMC7528811
27. gbif-bulk: https://github.com/FRBCesab/gbif-bulk
28. HMSC GitHub: https://github.com/hmsc-r/hmsc
29. HMSC Helsinki: https://www.helsinki.fi/en/researchgroups/statistical-ecology/software/hmsc
30. dissmapr docs: https://docs.b-cubed.eu/software/dissmapr/readme/
33. OCCUR: https://besjournals.onlinelibrary.wiley.com/doi/10.1111/2041-210X.14271
34. Taverna workflow BDJ: https://bdj.pensoft.net/article_preview.php?id=4221
35. Taverna workflow PMC: https://pmc.ncbi.nlm.nih.gov/articles/PMC4267104
36. occTest: https://par.nsf.gov/servlets/purl/10544284
37. P.I. Charter: https://pmc.ncbi.nlm.nih.gov/articles/PMC13239110
38. Collating biodiversity (SA): https://frontiersin.org/articles/10.3389/fevo.2023.1037282/full
39. CoordinateCleaner MEcE: https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.13152
40. Workflow mgmt MEcE: https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.14113
43. dissmapr site: https://b-cubed-eu.github.io/dissmapr/index.html
44. Dissimilarity Cube guide: https://docs.b-cubed.eu/guides/dissimilarity-cube/
45. BioTIME 2.0: https://zenodo.org/records/15222193
46. labdsv: https://ftp2.uib.no/cran/web/packages/labdsv/refman/labdsv.html
47. BRAHMS: https://herbaria.plants.ox.ac.uk/bol/brahms/software
48. spaa::data2mat: https://api.rdocumentation.org/packages/spaa/versions/0.2.2/topics/data2mat
