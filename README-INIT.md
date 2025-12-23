# MarioForge: Player-Rated Procedural Level Generation for a Mario-like Platformer

**Course:** Artificial Intelligence <3 Games: Procedural Content Generation (University of Wrocław)  
**Semester:** 2025/2026  
**Repository:** [link](https://github.com/antoniczapski/PCG-Mario)  
**Team:**  Antoni Czapski

---

## Abstract (short, buzzword-heavy)
We propose a modern, controllable **procedural content generation (PCG)** system for **Mario-like 2D platformer levels** that aims to produce levels people actually enjoy playing. We will:

(1) reproduce and benchmark representative baseline generators (search-based, PCGML, and LLM-based)

(2) build an improved generator emphasizing **playability constraints**, **quality-diversity**, and **controllability**

(3) ship a public, open-source evaluation platform that connects the **research community** with **players**, collecting pairwise preferences and maintaining an **Elo/TrueSkill-style ranking of generators**.

---

## Background & motivation
Mario-like level generation is a classic PCG domain where “valid-looking” levels can still be unfun or even unplayable. Research benchmarks typically rely on automated proxies (rule checks, agent solvability), which are necessary but often insufficient to capture human notions of fun, flow, and fairness. Meanwhile, large player communities can evaluate levels at scale, but existing ecosystems do not provide open, reproducible evaluation across multiple PCG models.

This project aims to bridge that gap by combining:
- **Benchmark-grade evaluation** (playability checks, controllability metrics, diversity measurements)
- **Human preference data** (pairwise comparisons by real players)
- **A shared platform + API** where others can plug in their own generators

---

## Project goals (what we expect to achieve)
### Goal A — Improved Mario-like generator (research artifact)
1. Implement/replicate at least 1–2 strong baselines (e.g., search-based + neural/LLM-based).
2. Propose and implement a new generator with measurable improvements in:
   - Playability rate (must be high)
   - Diversity (avoid “samey” outputs)
   - Controllability (level parameters reflect requested properties)
3. Provide a reproducible experiment suite and ablations.

### Goal B — Public evaluation platform (product artifact)
1. Web app where players can play short generated levels and give feedback via:
   - Pairwise “which level was more fun?” comparisons (primary)
   - Optional tags (too hard / too easy / unfair / boring / creative / etc.)
2. Maintain and publish a continuously updated ranking of generators (Elo/TrueSkill).
3. Open-source the platform API and a generator “plugin contract” so others can add models.

---

## Methodology (planned approach)
### Phase 1 — Literature review & baseline reproduction
- Review classic and modern Mario PCG:
  - Markov / hierarchical Markov, grammar-based, LSTM string generation
  - GAN latent search / evolutionary search in latent space
  - LLM-based text2level + novelty/QD search
- Reproduce a minimal baseline set with consistent evaluation:
  - At least one search-based baseline (ES/GA)
  - At least one learned baseline (LSTM/GAN/LLM depending on feasibility)

### Phase 2 — New generator design
We will choose one main direction (and possibly combine):
- **Constraint-first + diversity:** generate only playable candidates (hard constraints), then optimize diversity/novelty.
- **Preference-driven optimization:** treat human preference as an objective (learn a reward model from player comparisons).
- **Hybrid:** generator proposes candidates; search/QD refines; final selection uses learned preference.

Planned “must-have” constraints:
- Guaranteed/verified playability (agent-based verification + sanity constraints)
- Structural constraints (avoid broken pipes/degenerate geometry; avoid “dead” levels)

### Phase 3 — Platform + scoring + ranking
- Implement a minimal backend that:
  - Samples levels from each generator with a seed + settings
  - Stores play sessions and pairwise comparisons
  - Updates generator ratings (Elo/TrueSkill)
- Implement anti-noise mechanisms:
  - Calibration matchups (known easy comparisons)
  - Rate limiting / abuse prevention
  - Uncertainty-aware matchmaking (compare close-ranked generators more often)

---

## Evaluation plan (how we will measure success)
### Automated evaluation (research-facing)
- Playability (agent solvability)
- Constraint violations (domain-specific rules)
- Diversity:
  - Behavioral/path diversity
  - Optional structural diversity (tile/pattern statistics)
- Controllability:
  - Difference between requested and achieved properties (e.g., enemies/jumps/coins proxy)

### Human evaluation (player-facing)
- Pairwise preference rate: A vs B (primary signal)
- Secondary: “Would you play more levels from this generator?” / tags
- Reliability: inter-rater agreement and stability of rankings over time

---

## Deliverables by milestone (aligned to course timeline)
### Initial description (this file)
- Clear plan, scope, initial references
- Basic repo structure and execution plan

### Mid report (README-MID.md)
- Baseline(s) working + initial automated evaluation results
- Platform MVP running locally (at least minimal flow)
- Updated plan if scope changes

### Final report (README.md)
- Full paper-like report + experiments + results
- Clear “how to run”
- Deployed demo (if feasible) + open-source API

---

## References (starter list)
*(Will be expanded during literature review; exact bib formatting TBD.)*
- Togelius et al., *Procedural Content Generation in Games*, Springer, 2016.
- Khalifa et al., “The Procedural Content Generation Benchmark”, FDG 2025.
- Shaker et al., “Towards Automatic Personalized Content Generation for Platform Games”, AIIDE 2010.
- Snodgrass & Ontañón, “A Hierarchical MdMC Approach to 2D Video Game Map Generation”, AIIDE 2015.
- Sudhakaran et al., “MarioGPT: Open-Ended Text2Level Generation through Large Language Models”, NeurIPS 2023.
- Cooper, “Sturgeon: Tile-Based Procedural Level Generation via Learned and Designed Constraints”, AIIDE 2022.
- Bazzaz & Cooper, “Level Generation with Constrained Expressive Range”, FDG 2025.

---

## Repository structure (initial proposal)
- `README-INIT.md` (this file)
- `README-MID.md` (mid report)
- `README.md` (final report)
- `src/` (core generation + evaluation)
- `web/` (platform: frontend + backend)
- `experiments/` (configs + scripts)
- `data/` (small, versioned metadata only; large data via git-lfs or external)
- `results/` (generated artifacts, plots; not huge binaries)

---

## How to run (placeholder)
TODO: add a single entrypoint (e.g., `make demo`, `make eval`, `make web`) that:
- Runs baseline generator
- Runs our generator
- Launches local web app for rating

---

## Notes / constraints
- IP-safety: we will implement the platform as a **Mario-like** environment (research-friendly clone / original assets), not a Nintendo asset redistribution.
- Privacy: no PII collection; store anonymous session IDs only.
