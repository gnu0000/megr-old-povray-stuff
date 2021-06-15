#include "colors.inc"    
#include "shapes.inc"    
#include "textures.inc"  
#include "stones.inc"
#include "chars.inc"



light_source {<-41, 7, -90> color White}
light_source {< 31, 12, -20> color White}


#declare LittleT = intersection
   {
   plane { z, .25}
   plane {-z,  0}
   plane {-y,  0}
   plane { x,  0  rotate <0, 0,  30> translate <1, 0, 0>}
   plane {-x,  0  rotate <0, 0, -30>}
   texture {Gold_Texture finish {ambient .7}}
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
   texture {Gold_Texture finish {ambient .8}}
   scale <.2, .2, .1> 
   }

#declare BAMSLogo = union
   {
   object {BigT translate <0, 1.1, 0>}
   object {BAMS translate <0, 0,   0>}
   scale <.25, .25, .25>
   }


/********************************************************/

camera
   {
   location  <0, 0, -5>
   direction <0, 0, 1>
   look_at   <0, 0, 0>
   }

//#declare Stone18 =
//   texture
//      {
//      pigment {color SeaGreen}
//      finish {ambient 0.3 diffuse 0.6 crand 0.03}
//      }
//   texture
//      { Grnt22 scale <1.5, 0.7, 0.5> rotate <0, 0, 40> }
//   texture
//      { Grnt20a scale <2.5, 2, 0.5> rotate <0, 0, -50>}
//   texture
//      { 
//      Crack4 scale <0.7, 1, 1> rotate <10, 0, -20>
//      finish { phong 1.0 phong_size 90 }
//      }


box   // the green base plate
   {
   <-3, -1, 0>, <2.2, 1, .1>
   texture
      {
      Stone18
      finish { reflection 0.05 ambient .45 phong .7}
      }
   }


object 
   {
   BAMSLogo
   scale     <1.65, 1.65, 1.65>
   translate <-2.8, -.925, -.15>
   }

