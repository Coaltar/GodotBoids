
# Godot Boids

## Overview

This is small implementation of Boids in Godot!
Not finished yet, check back soon!

## Background

### What are Boids?
Boids are a type of simulated life model originally developed in the late 80s by Craig Reynolds. 
Using three basic principles of **Separation**, **Alignment**, and **Cohesion**, Boids are able to convincingly 
simulate the flocking behavior of birds and other animals. It's an interesting emergent property
that I think is worth investigating!

### Resources
Read more about them [here](https://cs.stanford.edu/people/eroberts/courses/soco/projects/2008-09/modeling-natural-systems/boids.html)!
The Stanford web page provides an excellent overview, and contains links to pseudo code and the original paper published
by Reynolds in *Computer Graphics*. 
There's also a [really excellent video by Sebastian Lague](https://www.youtube.com/watch?v=bqtqltqcQhw) if you're interested.

## Immediate Goals

Basic neighbor detection and flight path adjustment.
(Literally just boids)


## Future Goals

- UI to control boid parameters.
- Environmental goals and obstacles
- Vision cone visualization
- Nearest neighbors visualization
- Flight trails
- Translate from GodotScript to C++ or Rust using GDNative. 
- Possible short game implementation!

