
#include "colors.inc"    
#include "shapes.inc"    
#include "textures.inc"  
#include "stones.inc"
#include "chars.inc"



light_source {<-71, 7, -90> color White}
light_source {< 31, 12, -20> color White}
light_source {< 0,  -10,-50> color White}


#declare LittleT = intersection
   {
   plane { z, .25}
   plane {-z,  -3}
   plane {-y,  0}
   plane { x,  0  rotate <0, 0,  30> translate <1, 0, 0>}
   plane {-x,  0  rotate <0, 0, -30>}
   texture {Green_Glass}
   }
#declare LittleTHeight = 0.866

/*
 * Defines the  BAMS triangle
 * a ~1x1xi object lower left origin
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
   scale <.2, .2, .2>
   }


/*
 * Defines the word BAMS
 * a 4x1x.2 object lower left origin
 */
#declare BAMS = union
   {
   object {char_B translate <0,  0, 0>} 
   object {char_A translate <5,  0, 0>} 
   object {char_M translate <10, 0, 0>} 
   object {char_S translate <15, 0, 0>} 
   translate <2.5, 0, 0>
   texture {New_Brass}
   scale <.2, .2, .2> 
   }


#declare Plate = difference
   {
   box {<-3, -1, 0>, <2.2, 1, .3>}
   object {BigT scale <1.6, 1.6, 1.6> translate <-2.8, -.4, 0> }
   texture {Stone18}
//   texture {Sapphire_Agate}
   }



/********************************************************/

camera
   {
   location  <-.5, 0, -4.4>
   direction <0, 0, 1>
   look_at   <-.5, 0, 0>
   }

plane {z, 100 texture {pigment {color White}}}

object {Plate}


object 
   {
   BAMS
   scale <.25, .25, .25>
   scale     <1.65, 1.65, 1.65>
   translate <-2.8, -.925, -.15>
   }


//box   // the sign
//   {
//   <-.7, -.7, -.1>, <.7, .7, .1>
//   texture
//      {
//      Gold_Texture
//      pigment {color Orange}
//      }
//   rotate <0, 0, 45>
//   translate <-1.95, 0, 0>
//   }





