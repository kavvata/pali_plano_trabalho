# GOAL — Finalizar a seção METODOLOGIA (plano de trabalho, UNESPAR)

## Objective (refined)
Rewrite and deepen the `METODOLOGIA` section of `src/plano_trabalho.tex` to maximize
"Critério 3: Metodologia (8%)": (a) explicitly classify the methodological approach (2%) and
(b) present a concrete, structured passo a passo of the research (6%) — the dominant
sub-criterion, so most of the section's substance must go there. The section must stay
consistent with the existing INTRODUÇÃO, the OBJETIVO section (5 specific objectives), the
linha de pesquisa, and the orientador's areas.

## Anchor context (use as-is; do not re-derive)
- Document: pt-BR, ABNT (abntex2), lualatex. Build: `./compile.sh` → `build/plano_trabalho.pdf`.
- Título: "Usabilidade e carga de trabalho no registro de dados ecológicos: desenvolvimento de
  um sistema para triagem taxonômica de comunidades marinhas e estuarinas".
- Linha de pesquisa: "Desenvolvimento socioambiental e tecnológico em ambientes litorâneos e insulares".
- Áreas do orientador: IHC; Engenharia de Software; Inovação e Startups de Software; IHC e Sustentabilidade.
- Critério: "Metodologia (8%) — Classifica a abordagem metodológica que será utilizada (2%);
  apresenta o passo a passo de realização da pesquisa (6%)."
- The INTRODUÇÃO already commits to: Design Thinking (empatia, definição, ideação, prototipação,
  teste), ISO 9241-11 (eficácia e eficiência), NASA-TLX (6 subescalas), ecoinformática/ciclo de
  vida de dados, and IHC as the framing. METODOLOGIA must operationalize exactly those
  commitments — and nothing more ambitious than them.

## Scope
- Edit ONLY the region between `\section{METODOLOGIA}` and `\section{CRONOGRAMA}` in
  `src/plano_trabalho.tex`. Keep the header exactly `\section{METODOLOGIA}`.

## Non-goals
- Do NOT edit: preamble, INTRODUÇÃO, OBJETIVO, CRONOGRAMA (leave its placeholder), bib file,
  compile.sh, or documentclass options.
- Do NOT add new entries to `plano_trabalho.bib`; cite only keys already present.
- Do NOT invent data, claim results, or start the actual research.
- Do NOT change document style (Arial, ABNT title case, 12pt) or touch other sections.

## Required section structure (formal pt-BR academic prose, no first person)
1. **Classificação da abordagem (vale 2%)** — one short opening paragraph, explicit in the
   forms: natureza → aplicada (problema prático); objetivos → exploratória (entrevistas) e
   descritiva (comparação antes/depois); procedimentos → estudo de campo com métodos
   mistos (entrevistas qualitativas + medições quantitativas pré/pós), conduzido sob o
   referencial da IHC. Keep the draft's core wording where it is good.
2. **Passo a passo (vale 6% — o ponto principal)** — exactly 6 etapas em ambiente LaTeX
   `enumerate` (estilo do operador, iterações 4 e 7): logo após a frase de introdução
   ("...em seis etapas, detalhadas na sequência."), um único `\begin{enumerate}` com um
   `\item Nome. ...` por etapa. Nenhum outro `\item` na seção (quebra o checker). Cada item
   de etapa deve declarar: (i) purpose,
   (ii) actors (quem faz o quê), (iii) técnicas/instrumentos, (iv) output/artifact produced.
   - Etapa 1 -- Empatia: entrevistas semiestruturadas com pesquisadores de comunidades
     bentônicas (grupo de pesquisa UNESPAR), amostragem de conveniência, registro e
     transcrição, análise do fluxo atual (coleta, triagem, identificação de táxons).
   - Etapa 2 -- Definição: consolidação de requisitos funcionais e não funcionais
     (engenharia de requisitos), priorização, especificação do sistema a desenvolver.
   - Etapa 3 -- Linha de base (pré-teste): mesmas tarefas com o método manual atual; registra-se
     tempo por tarefa, taxa de acerto na identificação de táxons e NASA-TLX.
   - Etapa 4 -- Ideação e prototipação: geração e avaliação de alternativas; desenvolvimento
     incremental (engenharia de software) até a versão do sistema a ser testada.
   - Etapa 5 -- Teste (pós-teste): mesmos pesquisadores, mesmas tarefas, agora usando o sistema;
     mede-se eficácia e eficiência (ISO 9241-11) e NASA-TLX.
   - Etapa 6 -- Análise dos dados: estatística descritiva, verificação de normalidade,
     comparação pareada (t de Student pareado ou Wilcoxon), interpretação à luz dos
     objetivos específicos.
3. **Parágrafo de fechamento (1–3 frases)** — vincule o design/avaliação à IHC (usabilidade
   segundo ISO 9241-11) e à gestão sustentável de dados científicos de longo prazo,
   espelhando a linha de pesquisa e a área "IHC e Sustentabilidade".

## Content rules
- Target length: 500–700 words in the section (checker caps credit at ≥500). Current draft: ~277.
- Citations: only keys present in `src/plano_trabalho.bib` (1–6 citations total). Strong
  candidates: `silva_interacao_2010` (IHC), `brown_design_2021` (Design Thinking),
  `iso9241_11_2018`, `hart_development_1988` (NASA-TLX), `elmasri_fundamentals_2017`
  (requisitos/banco), `strasser_promoting_2011` ou `michener_ecoinformatics_2012` (ciclo de
  vida de dados). Full key list is in the bib file.
- Style: terminologia consistente com o resto do documento ("triagem e identificação de
  táxons", "carga de trabalho mental", "linha de base"); em dash como `--`; tom impessoal.
- Traceability: each specific objective in OBJETIVO maps to an etapa
  (entrevistas→1; requisitos→2; linha de base→3; desenvolvimento→4; coleta pós→5/6).

## Milestone roadmap (in order; run `./compile.sh` after each)
- M1 — Inventory: re-read INTRODUÇÃO, OBJETIVO, current METODOLOGIA; list DT phases, specific
  objectives, available bib keys. No file changes.
- M2 — Classificação: rewrite the opening paragraph (natureza/objetivos/procedimentos).
  Compile → commit "Metodologia: classifica a abordagem (natureza, objetivos, procedimentos)".
- M3 — Etapas 1–3: write Etapa 1–3 with purpose/actors/techniques/output. Compile → commit.
- M4 — Etapas 4–6 + parágrafo de fechamento. Compile → commit.
- M5 — Citações e alinhamento: insert citations (existing keys only); IHC/sustentabilidade
  framing; consistency pass against título and objetivos específicos. Compile → commit.
- M6 — QA: run `./check.sh`; fix until `SCORE: 25` (pass = hard gates + ≥23). Final commit.

## Quality standards
- `./compile.sh` must succeed after every edit (it uses `--halt-on-error`).
- No "undefined reference/citation" warnings in `src/plano_trabalho.log` (check.sh enforces).
- Every `\cite`/`\citeonline` key used in the section must exist in the bib (check.sh enforces).
- One git commit per milestone; short conventional message matching repo convention
  (pt-BR, e.g. "Metodologia: adiciona etapas 4-6").
- Keep diffs confined to the METODOLOGIA region.
- The working tree currently has one uncommitted change (the `\titulo{...}` line) — preserve
  it; never revert unrelated lines.

## Assumptions
- latexmk/lualatex/bibtex are installed and `./compile.sh` works today (verified).
- The 6-etapa structure above satisfies "passo a passo"; do not restructure beyond this spec
  unless check.sh fails for structural reasons.
- "Passo a passo" = ordered research stages with activities, instruments, and outputs — NOT a
  Gantt chart (that belongs to the separate CRONOGRAMA section, out of scope).
- Statistical plan stays as in the draft: paired t-test or Wilcoxon after a normality check.
- All content is derivable from the document + anchors above; no external research needed.

## Check script
`./check.sh` (run from project root) → prints `SCORE: <n>` (max 25); exit 0 = criteria met
(all hard gates pass AND n ≥ 23).
- Hard gates: compiles · no undefined refs · ≥5 `\item` (enumeração de etapas) · all citation keys resolve · consentimento no 1º item.
- Sub-scores: classificação 2 · fases DT 3 · etapas 4 · volume 3 · instrumentos (NASA-TLX,
  ISO 9241, estatística pareada) 3 · citações válidas 2 · objetivos específicos 2 ·
  alinhamento IHC/litorâneo 2 · compila 2 · refs 2.
- Baseline (current draft): `SCORE: 17` with hard gate failing (0 explicit etapas). Target 25.
