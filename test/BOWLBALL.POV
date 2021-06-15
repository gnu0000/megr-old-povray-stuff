/*
 *
 * t2-1.pov
 * Friday, 4/18/1997.
 *
 */

#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "woods.inc"

/***************************************************************************/

light_source {<10, 100, -10> color White}
light_source {<-20, -15, -40> color White}

camera
   {
   location  <1,   .41,  -3>
   direction <0.0,  0.0,  1.1>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    .1,   0>
   }

plane
   {
   y, -6
   texture
      {
      T_Stone13
      pigment {quick_color Gray30}
      }
   }

sphere
   {
   <0.0, 0.0, 0.0>, 1 inverse
   texture
      {
      pigment
         {
         gradient y
         colour_map
            {
            [0  color .2 green .4  blue .95]
            [.5 color .8 green .24 blue .88]
            [1  color .2 green .24 blue .4]
            }
         }
      finish
         {
         ambient 0.6
         diffuse 0.0
         }
      }
   scale <2000, 2000, 2000>
   }


/***************************************************************************/


difference
   {
   sphere {0, 1}

   cylinder {-x*10 x*10 .54}
   cylinder {-y*10 y*10 .54}
   cylinder {-z*10 z*10 .54}
                         
   texture {T_Wood1 scale .4}
   }
        
