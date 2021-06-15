/*
 *
 * t2-1.pov
 * Friday, 4/18/1997.
 *
 */

#include "colors.inc"  
#include "textures.inc"
#include "stones1.inc"
#include "glass.inc"

light_source {<-71, 70, -90> color White}

camera 
   {
   location  <0,    1.25, -3.5>
   direction <0.0,  0.0,  1.0>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    1,    0>
   }

plane
   {
   y, 0
   texture 
      {
      T_Stone13
      pigment {quick_color Gray30} 
      }
   }

sphere
   {
   <0, 0, 0> 1

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map 
            { 
            gif "exped4cp.gif" once
            } 
         scale <1, .6, .6>
         translate <-.5, -.3, 0>
         }
      finish 
         {
         reflection 0.75
         }
      }
   translate <0, 1, 0>
   }

