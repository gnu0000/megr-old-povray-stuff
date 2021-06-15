#include "colors.inc"    
#include "shapes.inc"    
#include "textures.inc"  
#include "stones.inc"


light_source {<-31, 11, -90> color Gray90}
light_source {< 31, 12, -20> color White}


/*
 * This is the base plate
 * from 0,0,0 to BASE_X,Y,Z
 * sizing done in place to prevent warping divots
 */
#declare Base_Divot = 0.15 ;
#declare Base_X     = 4    ;
#declare Base_Y     = .5   ;
#declare Base_Z     = 2    ;

#declare Base = difference
   {
   box   {<0, -Base_Y, 0> <Base_X, 0, Base_Z>}
   cylinder {<-.001,  0, 0     > <Base_X+.001, 0, 0          > Base_Divot}
   cylinder {<-.001,  0, Base_Z> <Base_X+.001, 0, Base_Z     > Base_Divot}
   cylinder {<0,      0, -.001>  <0,           0, Base_Z+.001> Base_Divot}
   cylinder {<Base_X, 0, -.001>  <Base_X,      0, Base_Z+.001> Base_Divot}

   translate <0, Base_Y, 0>
// texture {Blood_Marble}
//   texture {Math}
   texture {Silver_Texture}
   }


/*
 *
 *
 *
 *
 */
#declare Top_Divot2  = 0.06;
#declare Top_XOffset = 0.5 ;
#declare Top_ZOffset = 0.5 ;


#declare Top_X       = Base_X - Top_XOffset * 2;
#declare Top_Y       = Base_Y                  ;
#declare Top_Z       = Base_Z - Top_ZOffset * 2;
#declare Top = union
   {
   box {<0, 0, 0> <Top_X, Top_Divot2, 1>}

   cylinder {<0,     0, 0    > <Top_X, 0, 0    > Top_Divot2}
   cylinder {<0,     0, Top_Z> <Top_X, 0, Top_Z> Top_Divot2}
   cylinder {<0,     0, 0    > <0,     0, Top_Z> Top_Divot2}
   cylinder {<Top_X, 0, 0    > <Top_X, 0, Top_Z> Top_Divot2}

   sphere {<0,     0, 0    > Top_Divot2}
   sphere {<Top_X, 0, 0    > Top_Divot2}
   sphere {<0,     0, Top_Z> Top_Divot2}
   sphere {<Top_X, 0, Top_Z> Top_Divot2}

   translate <Top_XOffset, Top_Y, Top_ZOffset>
//   texture {Silver_Texture}
//   texture {Blood_Marble}
   texture {PinkAlabaster}
   }


#declare Stand = union
   {
   object {Base}
   object {Top}
   }


object
   {
   Stand
//   Inset
   rotate <-15, 25, 0>
   }


camera
   {
   location  <3, 1, -5>
   look_at   <2, 0, 0>
   }
