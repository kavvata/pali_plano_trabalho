# Fichamento — Ciclo 4

**Consulta original (PT):** `"species occurrence" AND "software" AND ("sistematização e estruturação da matriz de composição comunitária" OR "curadoria e padronização dos dados taxonômicos")`
**Tradução p/ EN usada na busca:** `"systematization and structuring of the community composition matrix" OR "curation and standardization of taxonomic data"` (e variantes: "community composition matrix", "taxonomic data curation")
**Data:** 05/10/2026

## Achado central: **NENHUMA FONTE RETORNOU**

A busca exata dos strings traduzidos retornou **0 hits relevantes** (o único hit, um blog genérico sobre "open source biodiversity software" [41], não corresponde a nenhum dos termos compostos). Isso é esperado e informativo:

1. **Os termos compostos em inglês não são fórmulas indexadas na literatura.** "Community composition matrix", "taxonomic data curation" e afins aparecem *como descrições*, não como strings fixos que um artigo indexaria.
2. **O vocabulário formal da área usa outros termos** — e é por eles que os mesmos conceitos foram recuperados no Ciclo 3:
   - "matriz de composição comunitária" → *site-by-species matrix*, *community data matrix*, *occurrence matrix* (HMSC), *site_spp* (dissmapr), *incidence matrix* (vegan);
   - "curadoria e padronização dos dados taxonômicos" → *taxonomic standardization / harmonization / name resolution*, *taxonomic curation* (BioTIME 2.0, Demosponge dataset).

## O que a busca confirmou por aproximação (leads)

- **dissmapr** [30][43]: "harmonise everything onto a common grid as **site-by-species** and site-by-environment matrices" — a frase mais próxima de "estruturação da matriz de composição comunitária" encontrada em todo o levantamento.
- **HMSC** [28][29]: definição canônica da **matriz Y** de ocorrências (espécies × unidades amostrais) + matrizes X/T/C.
- **labdsv** [46]: "convert data from **database form to the sparse matrix form** required by multivariate analyses" — a operação literal de "sistematizar" dados em matriz.
- **BioTIME 2.0** [45]: "additional curation to the **taxonomic accuracy** of the records" — literalmente "curadoria de dados taxonômicos".
- **BRAHMS** [47]: módulos "Taxonomic Research" + "Collection Curation" — gestão de banco taxonômico.

## Implicação para o projeto

Se a intenção da consulta PT era testar se **existe software/literatura que trate explicitamente** da "sistematização e estruturação da matriz de composição comunitária" como problema:
- **Não existe nenhum software dedicado com esse nome/escopo.** A compilação da matriz é um *passo interno* de pacotes de análise (dissmapr, vegan, HMSC), tratado como trivial.
- "Curadoria e padronização taxonômica" tem ferramentas maduras (TNRS, taxize, Taxonstand, OpenRefine/BioVeL, letsRept) — mas sempre **descotadas da etapa de montagem da matriz**.
- **Gap confirmado:** não há, nem em PT nem em EN, trabalho que una curadoria taxonômica + estruturação explícita da matriz comunitária em um único software com preocupação de usabilidade. Isso reforça o achado do Ciclo 3.

## Recomendação para novas buscas (ciclos futuros)

Em vez dos strings compostos, usar os **termos técnicos nativos**:
```
"site-by-species matrix" AND ("occurrence" OR "community data") AND (software OR application OR tool)
"taxonomic name resolution" AND "occurrence" AND (Shiny OR "graphical user interface")
"community matrix" AND "data preparation" AND (biodiversity OR occurrence)
```
E em **português** (para captar produção BR nacional que os buscadores em EN podem indexar mal):
```
"matriz de composição" AND "ocorrência" AND software
"curadoria taxonômica" AND "dados de ocorrência"
```

## Fontes (aproximações usadas acima; ver ciclos 3 para fichamento completo)

- [30] dissmapr: https://docs.b-cubed.eu/software/dissmapr/readme/
- [43] dissmapr site: https://b-cubed-eu.github.io/dissmapr/index.html
- [28] HMSC: https://github.com/hmsc-r/hmsc
- [29] HMSC (Helsinki): https://www.helsinki.fi/en/researchgroups/statistical-ecology/software/hmsc
- [46] labdsv: https://ftp2.uib.no/cran/web/packages/labdsv/refman/labdsv.html
- [45] BioTIME 2.0: https://zenodo.org/records/15222193
- [47] BRAHMS: https://herbaria.plants.ox.ac.uk/bol/brahms/software
- [41] (único hit literal, não relevante ao conceito): https://www.natural-solutions.world/blog/open-source-biodiversity-software
