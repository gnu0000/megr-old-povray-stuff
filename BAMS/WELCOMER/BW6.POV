#include "colors.inc"    
#include "shapes.inc"    
#include "textures.inc"  
#include "stones.inc"
#include "chars.inc"

light_source {<-41, 7, -90> color White}
//light_source {< 31, 12, -20> color White}

#declare LittleT = intersection
   {
   plane { z, .25}
   plane {-z,  0}
   plane {-y,  0}
   plane { x,  0  rotate <0, 0,  30> translate <1, 0, 0>}
   plane {-x,  0  rotate <0, 0, -30>}
//   texture 
//      {
//      Gold_Texture 
//      finish 
//         {ambient .7
//         }
//      }
   }
#declare LittleTHeight = 0.866


/*
 * Defines the  BAMS triangle
 * a ~4x4x.1 object lower left origin
 */
#declare BigT = union
   {
   object {LittleT translate <0,   0,               0>}
   object {LittleT translate <1,   0,               0>}
   object {LittleT translate <2,   0,               0>}
   object {LittleT translate <3,   0,               0>}
   object {LittleT translate <.5,  LittleTHeight,   0>}
   object {LittleT translate <1.5, LittleTHeight,   0>}
   object {LittleT translate <2.5, LittleTHeight,   0>}
   object {LittleT translate <1,   LittleTHeight*2, 0>}
   object {LittleT translate <2,   LittleTHeight*2, 0>}
   object {LittleT translate <1.5, LittleTHeight*3, 0>}
   texture
      {
      PinkAlabaster
      scale <.25, .25, .25>
      }
   }

camera
   {
   location  <0, 0, -5>
   direction <0, 0, 1.2>
   look_at   <0, 0, 0>
   }



object 
   {
   BigT 
   translate <-2, -1.6, 0>
   rotate <0, 30, 0>
   }



