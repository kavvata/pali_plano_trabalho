# Fichamento — Ciclo 2

**Consulta:** `"species occurrence" AND "software" AND "user experience"` (pesquisa em inglês)
**Data:** 05/10/2026
**Resultado bruto:** 10 hits; **2 altamente relevantes** (N-SDM 2.0, app de ID automática de espécies), demais tangenciais.

## Achado central

**Não existe, à primeira busca, literatura que estude UX como objeto em software de dados de ocorrência.** Os hits que contêm "user experience" literalmente são:

- software de SDM que _aplica_ UX ("reengineered... user experience highlighted several areas for improvement") [1];
- apps de _identificação_ de espécies (citizen science), não de manejo de dados de ocorrência [2].

Isso é um **gap de literatura utilizável**: se o projeto do usuário envolve UX de software para dados de ocorrência, a literatura comparada vem de (a) UX em apps de citizen science, (b) UX em ferramentas de SDM, e (c) UX em data wrangling/curadoria ecológica (ver ciclos 3-4).

## Fontes fichadas

### 1. N-SDM 2.0 (Ecography) [1]

- **O quê:** versão 2.0 do software N-SDM para modelagem de espécies aninhadas, "reengineered software with extended features".
- **Trecho relevante:** "user experience highlighted several areas for improvement" — UX apareceu como _critério de redesign_ na evolução do software.
- **Relevância:** evidência de que UX em software ecológico é tratada como feedback prático (iterações de redesign), não como disciplina formal.

### 2. Automated species identification apps (BioScience) [2]

- **O quê:** revisão + análise de reviews de usuários de 19 apps de ID automática de espécies (>100k downloads cada), com LDA sobre os comentários.
- **Achados de UX:** temas positivos = identificação precisa + "user-friendly design, intuitive interfaces"; negativos = "interface challenges, technical glitches and unintuitive design".
- **Dado-chave:** >50% dos registros de ocorrência no GBIF são de citizen science (Waller 2019) — a UX dos apps de campo **é** a UX do pipeline de dados de ocorrência.
- **Fechamento dos autores:** "We expect user-related aspects concerning further optimization of apps' interfaces to be a research focus of the wider human computer interface research community." → confirma que o campo está _iniciando_ a discussão HCI.
- **Relevância:** melhor fonte encontrada para ancorar "user experience" no universo de dados de ocorrência.

### 3. Biologer (BDJ) [3]

- **O quê:** plataforma aberta (software online) para coleta de dados de biodiversidade: usuários, táxons, ocorrências, importação de dados.
- **Relevância:** tangencial — plataforma de _coleta_ com gestão de usuários; sem estudo de UX próprio.

### 4. dataXplore / BiRC (BRC) [4]

- **O quê:** web app do Biological Records Centre para triar vieses em dados de ocorrência ("screening species occurrence data for common forms of bias").
- **Relevância:** exemplo de web app de _triagem de dados_ para não-programadores — adjacente ao escopo.

### 5. B-Cubed D2.2 (occurrence cube implementation) [5]

- **O quê:** implementação do serviço de cubes; justifica a interface gráfica em GBIF.org: "it will offer an easier user experience and improved functionality, catering to a wide range of users" — dropdowns/checkboxes no lugar de SQL.
- **Relevância:** UX como _critério de design_ num serviço de dados: ocultar SQL atrás de menus, manter modo avançado para especialistas. Bom padrão de referência (progressive disclosure).

### 6. Software codesign entre end users e developers [PMC11660699 → ver [6]]

- **Nota:** hit de "Software codesign between end users and developers to enhance utility" (PMC11660944) — exercício de codesign com usuários reais; não verifiquei o texto integral (fora do escopo de extração). Guardar como lead para UX por codesign.

## Síntese

1. **"User experience" é raro como termo indexado** em software de dados de ocorrência; aparece como justificação de redesign, não como objeto de pesquisa.
2. O fluxo mais citado de UX no domínio: **ocultar complexidade (SQL, GIS, R) atrás de GUIs** (B-Cubed [5], GLOSSA, N-SDM [1], dataXplore).
3. A ponte mais forte para UX formal (HCI) é a **citizen science** [2] — e ela já é maioria dos dados de ocorrência no GBIF.
4. **Gap identificado e explorável:** nenhum software de curadoria/wrangling de ocorrências encontrado neste ciclo fez estudo de usuários; o ciclo 3 mostra _guias_ de curadoria (OCCUR) com justificativa de "user-friendly" mas sem método HCI.

## Fontes

1. N-SDM 2.0: https://nsojournals.onlinelibrary.wiley.com/doi/10.1002/ecog.08547
2. Species ID apps (BioScience/PMC): https://academic.oup.com/bioscience/article/74/9/601/7815612 | https://pmc.ncbi.nlm.nih.gov/articles/PMC11480699
3. Biologer: https://bdj.pensoft.net/article/53014/
4. BRC apps: https://www.brc.ac.uk/theme/apps-and-technology
5. B-Cubed D2.2: https://www.b-cubed.eu/storage/app/uploads/public/65e/1d0/3d2/65e1d03d2d9d5647000672.pdf
