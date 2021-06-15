#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {< 31, 12, -20> color White }

default {finish {ambient 1}}

camera 
   {
   location  <.25,   -.5, -.16>
   direction <0.0,  0.0,  1.5>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    0,   0>
   }

union
   {
   object {char_O texture {MathR}}
   cylinder { <100, 0, 0> <-100, 0, 0> .01 texture {MathG}}
   cylinder { <0, 100, 0> <0, -100, 0> .01 texture {MathG}}
   cylinder { <0, 0, 100> <0, 0, -100> .01 texture {MathG}}
   }
