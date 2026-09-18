# IMPROVEMENTS (post-goal backlog)

Core goal done: METODOLOGIA at check.sh SCORE: 25/25. Improvements, top-down:

- [ ] src/plano_trabalho.tex — closing paragraph: support "preservação e o reúso de longo
  prazo dos dados ecológicos" with an existing cite (`strasser_promoting_2011` or
  `michener_ecoinformatics_2012`). Accept: key valid in bib, `./compile.sh` ok.
- [x] src/plano_trabalho.tex — Etapa 1: add one sentence on research ethics with
  participants (consent/anonymity). Accept: present in Etapa 1 paragraph, compiles.
  DONE c5c8d8c (TCLE + anonimato).
- [x] check.sh — hard gate (no score): Etapa 1 paragraph must mention "consentimento"
  (ethics present). Accept: test copy with the sentence removed → exit 1.
  DONE 38279ca (negative test /tmp/negtest verified: C11 FAIL → NOT MET).
- [ ] check.sh — hard gate (no score): METODOLOGIA must have exactly six `^\item ` lines
  (N=6); an injected stray `\item Foo` must fail. Accept: test copy in /tmp → exit 1.
- [ ] src/plano_trabalho.tex — Etapas (3) and (5): make the task set explicit and identical
  in both (e.g., "mesmo conjunto de tarefas de triagem -- pesagem das amostras, contagem e
  identificação de táxons") so pré/pós comparabilidade is unambiguous. Accept: same task
  phrase (or clear reference) in both paragraphs, compiles, SCORE stays 25.
- [ ] src/plano_trabalho.tex — fill CRONOGRAMA quadro: rows = 6 etapas (grouped into ~4
  linhas: entrevistas/requisitos; linha de base; desenvolvimento; teste e análise), columns
  2027.1–2028.2; remove "A fazer" and "..." placeholders. Accept: no "A fazer"/"..." left
  in the section, compiles, row labels mirror the etapas.
- [ ] check.sh — add guard: section must contain exactly six `^(N) ` paragraph starters
  (N in 1..6) and no other `(digit) ` line starts (GOAL.md rule, currently unenforced).
  Accept: script flags an injected stray "(7) Foo" in a test copy.
