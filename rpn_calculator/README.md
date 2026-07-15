# RPN Calculator

A simple command-line calculator that evaluates expressions written in **Reverse Polish Notation (RPN)**.

Unlike conventional calculators, operators are written **after** their operands.

## Examples

```text
Input:
3 4 +

Output:
7
```

```text
Input:
5 3 + 2 *

Output:
16
```

```text
Input:
10 2 / 7 +

Output:
12
```

## Features

* Evaluate Reverse Polish Notation expressions
* Interactive command-line interface
* Supports basic arithmetic operations:

  * Addition (`+`)
  * Subtraction (`-`)
  * Multiplication (`*`)
  * Division (`/`)
* Reports invalid expressions and runtime errors

## Building

```sh
zig build
```

## Running

```sh
zig build run
```

## Running Tests

```sh
zig build test
```

## What is Reverse Polish Notation?

Reverse Polish Notation (RPN) is a mathematical notation in which operators follow their operands.

Instead of writing:

```text
(5 + 3) * 2
```

you write:

```text
5 3 + 2 *
```

The expression is evaluated from left to right using a stack, eliminating the need for parentheses and operator precedence rules.
