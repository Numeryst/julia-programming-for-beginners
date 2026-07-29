# Julia Programming for Beginners

Codes and examples for the "Julia Programming for Beginners" playlist on the Numeryst YouTube channel.

Watch the full playlist:
https://www.youtube.com/watch?v=5G7voQvgSbk&list=PLLlTVphLQsuM7pZgoQym3VxIbqnz-Uxna&index=1

## Table of contents
- [About](#about)
- [What you'll learn](#what-youll-learn)
- [Prerequisites](#prerequisites)
- [Repository layout](#repository-layout)
- [Quick start](#quick-start)
- [Running examples](#running-examples)
- [Recommended tooling](#recommended-tooling)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## About
This repository contains the example scripts and short demos used in the "Julia Programming for Beginners" playlist on the Numeryst YouTube channel. Each folder groups short, focused .jl scripts that illustrate a particular topic from the videos so you can follow along and experiment locally.

## What you'll learn
Topics covered by the playlist and the code include:
- Basic syntax, variables, and types
- Strings and character handling
- Control flow (if/else, for/while)
- Functions and simple abstractions
- Common data structures (arrays, dictionaries, sets)
- Working with DataFrames
- Simple plotting (Makie)
- Dates and time handling
- Metaprogramming basics
- Benchmarking and profiling to measure performance
- Defining custom types

## Prerequisites
- Julia (recommended: current stable release). Download at https://julialang.org/downloads/
- Basic familiarity with using a command line or terminal is helpful but not required.

## Repository layout
Top-level directories and their purpose:

`benchmark/`        — benchmarking and profiling examples (BenchmarkTools, Profile, TimerOutputs)  
`controlflow/`      — examples for if/else, ternary, and looping constructs  
`dataframes/`       — DataFrames usage and examples (loading, slicing, describing)  
`datastructures/`   — dictionaries, sets, and related idioms  
`dates/`            — date/time examples and utilities  
`functions/`        — function definitions, argument styles, and patterns  
`io/`               — input/output examples (file and console I/O)  
`makie/`            — plotting examples using Makie (visualization demos)  
`metaprogramming/`  — simple metaprogramming examples (macros, code generation)  
`types/`            — custom types and struct examples  
`variables/`        — basics: variables, strings, chars, and related snippets

All code is plain Julia (.jl) scripts; browse the directories to find small, self-contained examples that match the playlist episodes.

## Quick start
Clone the repository and run an example:

```bash
git clone https://github.com/Numeryst/julia-programming-for-beginners.git
cd julia-programming-for-beginners
# Run a single example script, for example:
julia variables/variables.jl
