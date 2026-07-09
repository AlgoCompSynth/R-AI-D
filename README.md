R-AI-D - Rtificial Audio Intelligence Distrobox
================

## Introduction

R-AI-D is a [Distrobox](https://distrobox.it/) container for algorithmic
musical composition and synthesis using the R programming language. The
R-AI-D container is a Fedora 44 Linux environment featuring

- A complete R development stack, including the open-source edition of
  [RStudio Desktop](https://posit.co/downloads), the `devtools` R
  package development and documentation suite (Wickham et al. 2026), and
  the `btw` package for AI workflow development (Aden-Buie et al. 2026),
- the [Ollama](https://docs.ollama.com/) framework for using local and
  cloud models,
- install scripts for the [Goose](https://goose-docs.ai/),
  [OpenCode](https://opencode.ai/), and [Pi](https://pi.dev/)
  open-source command-line coding agents,
- the `consonaR` package for consonance-based algorithmic composition
  (Borasky 2026a), and
- the `eikosany` package for algorithmic composition with xentonal
  scales (Borasky 2026b).

R-AI-D was developed on [Bluefin DX](https://projectbluefin.io), but
should work on any Linux host system supporting Distrobox. On `x86_64`
systems, an NVIDIA GPU will be detected and used automatically.

## The vision

A traditional orchestral composer starts with an idea, a commission or
both. Most often they will then sit down at a piano and develop a score.
The score will be printed and the parts will be distributed to the
musicians for rehearsal, performance, and most likely, recording.

My vision for R-AI-D is different. Instead of a piano, the composer has
a workstation, containing or connected to an AI model with the kind of
immense database of world music history and theory that today’s large
language models have of languages, logical / mathematical reasoning, and
computer programming.

And as well as conventional scores, the workstation can generate
graphical scores, MIDI files, code in a music programming language like
ChucK (Salazar et al. 2014), and even direct digital recordings of the
compositions. R-AI-D is intended to be an *intelligence amplifier* for
composers.

## Current status

I’ve focused on two facets of experimental music:

- xentonal scales, mostly those developed by Harry Partch (Partch 1979),
  Erv Wilson (Narushima 2019), and Wendy Carlos (Carlos 1987), and
- consonance-based analysis and synthesis, as developed by William A.
  Sethares (Sethares 2013).

If that’s the kind of music that interests you, R-AI-D and I are more or
less ready. You can [open
issues](https://github.com/AlgoCompSynth/R-AI-D/issues/new) for bug
reports / feature requests, and if you’ve got a Linux system with a
decent amount of RAM, or have the money to subscribe to a cloud model,
you can download R-AI-D and run it.

## Road map

The immediate road map is:

- Add a comprehensive users’ guide. The two core packages are usable if
  you’re familiar with the books on which they’re based, but they need
  much more documentation. And although the operation of the container
  is relatively simple, the documentation on getting it running and
  connecting to it needs to be improved.
- Produce a xentonal album. This is going to require expanding the
  capabilities of both `eikosany` and `consonaR`.

Longer term, I want to add more computational music theory, especially
counterpoint and geometric / algebraic approaches like (Tymoczko 2010).
Both are well-suited to the capabilites of R and AI models, and the
databases exist for post-training.

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-aden-buie2026" class="csl-entry">

Aden-Buie, Garrick, Simon Couch, and Joe Cheng. 2026. *Btw: A Toolkit
for Connecting r and Large Language Models*.
<https://github.com/posit-dev/btw>.

</div>

<div id="ref-borasky2026consonar" class="csl-entry">

Borasky, M. Edward (Ed). 2026a. *consonaR: Consonance-Based Algorithmic
Composition*. <https://algocompsynth.github.io/consonaR/>.

</div>

<div id="ref-borasky2026eikosany" class="csl-entry">

Borasky, M. Edward (Ed). 2026b. *Eikosany: Algorithmic Composition with
Erv Wilson’s Combination Product Sets*.
<https://algocompsynth.github.io/eikosany/>.

</div>

<div id="ref-carlos1987tuning" class="csl-entry">

Carlos, Wendy. 1987. “Tuning: At the Crossroads.” *Computer Music
Journal* 11 (1): 29–43.

</div>

<div id="ref-narushima2019microtonality" class="csl-entry">

Narushima, T. 2019. *Microtonality and the Tuning Systems of Erv
Wilson*. Routledge Studies in Music Theory. Taylor & Francis Limited.

</div>

<div id="ref-partch1979genesis" class="csl-entry">

Partch, H. 1979. *Genesis of a Music: An Account of a Creative Work, Its
Roots, and Its Fulfillments, Second Edition*. Hachette Books.

</div>

<div id="ref-salazar2014programming" class="csl-entry">

Salazar, S., A. Kapur, G. Wang, and P. Cook. 2014. *Programming for
Musicians and Digital Artists: Creating Music with ChucK*. Manning.

</div>

<div id="ref-sethares2013tuning" class="csl-entry">

Sethares, W. A. 2013. *Tuning, Timbre, Spectrum, Scale, Second Edition*.
Springer London.

</div>

<div id="ref-tymoczko2010geometry" class="csl-entry">

Tymoczko, D. 2010. *A Geometry of Music: Harmony and Counterpoint in the
Extended Common Practice*. Oxford Studies in Music Theory. Oxford
University Press.

</div>

<div id="ref-wickham2026devtools" class="csl-entry">

Wickham, Hadley, Jim Hester, Winston Chang, and Jennifer Bryan. 2026.
*Devtools: Tools to Make Developing r Packages Easier*.
<https://devtools.r-lib.org/>.

</div>

</div>
