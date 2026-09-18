#!/usr/bin/env bash
# check.sh — scores the METODOLOGIA section of src/plano_trabalho.tex.
# Usage: ./check.sh   (from anywhere)
# Prints "SCORE: <n>" (max 25). Exit 0 = criteria met (hard gates pass AND n >= 23).
set -u

ROOT="$(cd "$(dirname "$0")" && pwd)"
TEX="$ROOT/src/plano_trabalho.tex"
BIB="$ROOT/src/plano_trabalho.bib"
LOG="$ROOT/src/plano_trabalho.log"
SCORE=0
HARD_FAIL=0

ok() { printf '[PASS] %s\n' "$1"; }
ko() { printf '[FAIL] %s\n' "$1"; }

if [[ ! -f "$TEX" || ! -f "$BIB" ]]; then
  echo "ERROR: missing $TEX or $BIB"
  exit 2
fi

# ---- extract METODOLOGIA section (from its \section to the next \section) ----
SECTION="$(awk '/\\section\{METODOLOGIA\}/{f=1;next} f && /\\section\{/{f=0} f' "$TEX")"
has() { printf '%s\n' "$SECTION" | grep -qiE "$1"; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# ---- C1 (2): document compiles ----
if (cd "$ROOT" && ./compile.sh) >"$TMP/build.log" 2>&1; then
  SCORE=$((SCORE+2)); ok "C1 compila (2)"
else
  ko "C1 compila (0/2) — saída do build:"; tail -5 "$TMP/build.log"; HARD_FAIL=1
fi

# ---- C2 (2): no undefined references/citations in latex log ----
if [[ -f "$LOG" ]] && ! grep -qi 'undefined' "$LOG"; then
  SCORE=$((SCORE+2)); ok "C2 sem referências indefinidas (2)"
else
  ko "C2 sem referências indefinidas (0/2) [HARD]"; grep -i 'undefined' "$LOG" 2>/dev/null | head -5; HARD_FAIL=1
fi

# ---- C3 (2): classificação da abordagem (natureza/objetivos/procedimentos) ----
c3=0
has 'aplicada'   && c3=$((c3+1))
has 'explorat'   && c3=$((c3+1))
has 'descritiv'  && c3=$((c3+1))
if   (( c3==3 )); then SCORE=$((SCORE+2)); ok "C3 classificação aplicada/exploratória/descritiva (2)"
elif (( c3==2 )); then SCORE=$((SCORE+1)); ko "C3 classificação (1/2 — 1 termo ausente)"
else ko "C3 classificação (0/2 — $c3/3 termos)"; fi

# ---- C4 (3): fases do Design Thinking presentes ----
n4=0
for p in 'empatia' 'defini' 'ide[aç]' 'prototip' 'teste'; do
  has "$p" && n4=$((n4+1))
done
if   (( n4==5 )); then s4=3
elif (( n4>=3 )); then s4=2
elif (( n4>=1 )); then s4=1
else s4=0; fi
SCORE=$((SCORE+s4))
(( n4==5 )) && ok "C4 fases DT 5/5 ($s4)" || ko "C4 fases DT $n4/5 ($s4/3)"

# ---- C5 (4): marcadores explícitos de etapa (parágrafos iniciados por "(N) ") — HARD: >=5 ----
STEPS=$(printf '%s\n' "$SECTION" | grep -cE '^\([0-9]\) ')
if   (( STEPS>=5 )); then s5=4
elif (( STEPS==4 )); then s5=3
elif (( STEPS==3 )); then s5=2
elif (( STEPS==2 )); then s5=1
else s5=0; fi
SCORE=$((SCORE+s5))
if (( STEPS>=5 )); then ok "C5 passo a passo: $STEPS etapas ($s5/4)"
else ko "C5 passo a passo: $STEPS etapas ($s5/4) — hard gate: >=5 parágrafos iniciados por '(N)'"; HARD_FAIL=1; fi

# ---- C6 (3): volume da seção (palavras, comandos LaTeX removidos) ----
WORDS=$(printf '%s\n' "$SECTION" | sed -e 's/\\cite[a-zA-Z]*{[^}]*}//g' -e 's/\\[a-zA-Z]\+//g' | wc -w)
if   (( WORDS>=500 )); then s6=3
elif (( WORDS>=350 )); then s6=2
elif (( WORDS>=250 )); then s6=1
else s6=0; fi
SCORE=$((SCORE+s6))
(( WORDS>=500 )) && ok "C6 volume: $WORDS palavras ($s6/3)" || ko "C6 volume: $WORDS palavras ($s6/3, alvo >=500)"

# ---- C7 (3): instrumentos (NASA-TLX, ISO 9241, estatística pareada) ----
c7=0; missing=""
has 'NASA[- ]?TLX'           && c7=$((c7+1)) || missing="$missing NASA-TLX"
has 'ISO ?9241'              && c7=$((c7+1)) || missing="$missing ISO 9241"
has 'paread|Wilcoxon|Student' && c7=$((c7+1)) || missing="$missing estatística pareada"
SCORE=$((SCORE+c7))
(( c7==3 )) && ok "C7 instrumentos: NASA-TLX + ISO 9241 + estatística pareada (3)" || ko "C7 instrumentos: $c7/3 (faltam:$missing)"

# ---- C8 (2): todas as citações da seção existem no bib — HARD ----
KEYS=$(printf '%s\n' "$SECTION" | grep -oE '\\cite[a-zA-Z]*\{[^}]*\}' \
       | sed -e 's/.*{//' -e 's/}//' | tr ',' '\n' | sed '/^$/d' | sort -u)
bad=0; nkeys=0
if [[ -n "$KEYS" ]]; then
  while IFS= read -r k; do
    [[ -z "$k" ]] && continue
    nkeys=$((nkeys+1))
    grep -qE "@[a-zA-Z]+\{$k," "$BIB" || { bad=$((bad+1)); echo "        chave não resolvida: $k"; }
  done <<< "$KEYS"
fi
if (( bad==0 )); then SCORE=$((SCORE+2)); ok "C8 citações resolvem no bib ($nkeys chaves) (2)"
else ko "C8 citações: $bad chave(s) inválida(s) (0/2) [HARD]"; HARD_FAIL=1; fi

# ---- C9 (2): cobertura dos objetivos específicos (entrevistas, requisitos) ----
c9=0
has 'entrevi'   && c9=$((c9+1))
has 'requisito' && c9=$((c9+1))
SCORE=$((SCORE+c9))
(( c9==2 )) && ok "C9 objetivos específicos cobertos (2)" || ko "C9 objetivos específicos: $c9/2"

# ---- C10 (2): alinhamento (IHC + contexto marinho/estuarino) ----
c10=0
has 'IHC|Humano-[Cc]omputador' && c10=$((c10+1))
has 'marin|estuar'             && c10=$((c10+1))
SCORE=$((SCORE+c10))
(( c10==2 )) && ok "C10 alinhamento IHC + marinho/estuarino (2)" || ko "C10 alinhamento: $c10/2"

# ---- C11 (gate, sem pontuação): ética em Etapa 1 (consentimento) ----
if printf '%s\n' "$SECTION" | grep -E '^\(1\) ' | grep -qi 'consentimento'; then
  ok "C11 ética (consentimento) presente em Etapa 1"
else
  ko "C11 ética (consentimento) ausente em Etapa 1 [HARD]"; HARD_FAIL=1
fi

echo "----------------------------------------"
echo "SCORE: $SCORE"
echo "detail: $SCORE/25 | hard_fail=$HARD_FAIL"
if (( HARD_FAIL==0 )) && (( SCORE>=23 )); then
  echo "RESULT: MET (hard gates ok, score >= 23)"
  exit 0
fi
echo "RESULT: NOT MET"
exit 1
