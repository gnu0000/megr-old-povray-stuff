#include "colors.inc"  
#include "shapes.inc"  
#include "textures.inc"
#include "stones.inc"

#declare Sky_Top = 500
#include "Gnu_Sky.inc"

camera 
   {
   location  <0, 0, -3.2>
   direction <0.0, 0.0, 1.5>
   up        <0.0, 1.0, 0>
   right     <8/5, 0.0, 0>
   look_at   <0,   0,   500>
   }

light_source {<10,   10, -20> color White}
light_source {<-10, 120, -30> color White}

#declare Dull = finish 
   {
   specular 0.35 
   roughness 0.15 
   ambient .15
   }

#declare walltex = texture
   {
   tiles 
      {
      texture 
         {
         pigment {image_map {gif "wall1.gif" filter 0, 1}}
         finish {ambient 1}
         }
      tile2 
      texture 
         {
         pigment {image_map {gif "wall1.gif" filter 0, .9}}
         finish {ambient 1}
         translate <-.5, -.5, -.5>
         rotate <0, 0, 90>
         translate < .5,  .5, .5>
         }
      }
   }


declare wing = difference
   {
   box 
      {<0, 0, 0> <7/8, 7/8, .1> translate <7/64, 7/64, 0>}
   cylinder 
      {<1/4, 1/4, -1> <1/4, 1/4, 2> 4.5/16}
   cylinder 
      {<1, 1, -1> <1, 1, 2> 3/4}
   texture
      {
      pigment {ForestGreen}
      finish  {Dull}
      }
   }

declare tear = union
   {
   cylinder 
      {<0, 0, 0> <0, 0, .1> 9/64 translate <9/64, 9/64, 0>}
   box 
      {<0, 0, 0> <9/64, 9/64, .1> }

   translate <1/8, 1/8, 0>

   texture
      {
      pigment {White}
      finish  {Dull}
      }
   }

declare corner = union
   {
   object {wing }
   object {tear}
   translate <-1/32, -1/32, 0>
   }


declare CloverLogo = union
   {
   object {corner rotate <0, 0, 0>}
   object {corner rotate <0, 0, 90>}
   object {corner rotate <0, 0, -90>}
   object {corner rotate <0, 0, 180>}
   scale  <1, 1, 3>
   }


#declare wallY = intersection
   {
   plane {z, 0.000001}
   plane {z, 0 inverse}
   plane {y, 1}
   plane {y, -1 inverse}

   texture {walltex}
   scale <10, 10, 10>
   }


#declare wallX = intersection
   {
   plane {z, 0.000001}
   plane {z, 0 inverse}
   plane {x, 1}
   plane {x, -1 inverse}

   texture {walltex}
   scale <10, 10, 10>
   }


object {wallY rotate  y*90 translate  x*10}
object {wallY rotate -y*90 translate -x*10}
object {wallX rotate  x*90 translate  y*10}
object {wallX rotate -x*90 translate -y*10}


object {CloudySky1 rotate <0, clock * 360, 0>}


#declare cc = 1-clock
#declare cd = 2-clock

object
   {
   CloverLogo
   rotate <0, cc * 1200, 0>
   rotate <cc * 800, 0, 0>
   rotate <0, 0, cc * 100>
   translate <0, 0, cc * 120>
   }

object
   {
   CloverLogo
   rotate <0, cd * 1200, 0>
   rotate <cd * 800, 0, 0>
   rotate <0, 0, cd * 100>
   translate <0, 0, cd * 120>
   }
