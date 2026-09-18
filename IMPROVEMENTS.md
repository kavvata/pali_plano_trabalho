# IMPROVEMENTS (post-goal backlog)

Core goal done: METODOLOGIA at check.sh SCORE: 25/25. Improvements, top-down:

- [ ] src/plano_trabalho.tex — closing paragraph: support "preservação e o reúso de longo
  prazo dos dados ecológicos" with an existing cite (`strasser_promoting_2011` or
  `michener_ecoinformatics_2012`). Accept: key valid in bib, `./compile.sh` ok.
- [ ] src/plano_trabalho.tex — Etapa 1: add one sentence on research ethics with
  participants (consent/anonymity). Accept: present in Etapa 1 paragraph, compiles.
- [ ] check.sh — add guard: section must contain exactly six `^(N) ` paragraph starters
  (N in 1..6) and no other `(digit) ` line starts (GOAL.md rule, currently unenforced).
  Accept: script flags an injected stray "(7) Foo" in a test copy.
