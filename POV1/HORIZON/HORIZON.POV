#include "Colors.inc"
#include "Textures.inc"

camera 
   {
   location  <0, 0, -8 >
   direction <0, 0, 1.2071>
   up        <0, 1, 0>
   right     <1, 0, 0>
   look_at   <0, -3, 0>
   }

light_source { <200, 200, -150> color red 1 green 1 blue 1 }

plane 
   {
   y, -10
   pigment 
      {
      checker color HuntersGreen color SummerSky
      scale <3, 1, 3>
      }
   finish 
      {
      ambient 0.2
      diffuse 0.6
      }
   scale <5, 5, 5>
   }



//// Define the surface 
//object 
//   {
//   plane { <0.0,  1.0,  0.0> -10.0 }
//   texture 
//      {
//      image_map {<10, 0, 10> gif "test.gif"}
//      interpolate 2                         /* Faster interpolation than 4 */
//      alpha 0 1.0
//      }
//   colour Blue
//   }
