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
#declare Base_Divot = 0.15
#declare Base_X     = 4
#declare Base_Y     = .5
#declare Base_Z     = 2

#declare Base = difference
   {
   box   {<0, -Base_Y, 0> <Base_X, 0, Base_Z>}
   cylinder {<-.001,  0, 0     > <Base_X+.001, 0, 0          > Base_Divot}
   cylinder {<-.001,  0, Base_Z> <Base_X+.001, 0, Base_Z     > Base_Divot}
   cylinder {<0,      0, -.001>  <0,           0, Base_Z+.001> Base_Divot}
   cylinder {<Base_X, 0, -.001>  <Base_X,      0, Base_Z+.001> Base_Divot}

   translate <0, Base_Y, 0>
   texture {Silver_Texture}
   }


/*
 *
 *
 *
 *
 */
#declare Top_Divot2  = 0.06
#declare Top_XOffset = 0.5
#declare Top_ZOffset = 0.5

#declare Top_X       = Base_X - Top_XOffset * 2
#declare Top_Y       = Base_Y
#declare Top_Z       = Base_Z - Top_ZOffset * 2
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
   texture {PinkAlabaster scale <1.7, 1.7, 1.7> translate <-.3, 0, -.5>}
   }


#declare TopOfStand = Top_Y + Top_Divot2
#declare Stand = union
   {
   object {Base}
   object {Top}
   translate <-Base_X/2, 0, -Base_Z/2>
   }


#declare PopDiam   = .2
#declare PopHeight = 1.5
#declare TSize     = Top_Divot2 * 2
#declare Pop = union
   {
   cylinder {<0, 0, 0> <0, PopHeight+.1, 0> PopDiam }
   torus    {PopDiam, TSize translate <0, 0, 0> }
   torus    {PopDiam, TSize translate <0, PopHeight, 0> }
   difference
      {
      sphere   {<0, PopHeight+1, 0>, 1}
      torus    {1, .4 translate <0, PopHeight+1, 0> }
      }
   texture {Silver_Texture}
   }

#declare Monolith = union
   {
   object {Stand}
   object {Pop translate y*TopOfStand}

   torus    
      {1.5, .15
      translate <0, PopHeight+1+TopOfStand, 0> 
      texture {Green_Glass}
      }
   }




// Sky sphere 
sphere 
   { 
   <0.0, 0.0, 0.0>, 1200
   pigment 
      {
      gradient y     // Fade from yellow to orange to red to black 
      color_map 
         {
         [0.00 0.10 color Yellow color Orange] // Yellow at horizon
         [0.10 0.15 color Orange color Red]    // Fade to orange to red
         [0.15 0.4  color Red    color Black ] // then to dark red
         [0.4  1.01 color Black  color Black ] // to Black at zenith
         }
      quick_color SummerSky
      scale 1200
      }
   finish 
      {
      ambient 1.0                 // Keep objects from casting shadows 
      diffuse 0.0                 // All light comes from ambient sources 
      }
   }



object
   {
   Monolith
//   rotate <-17, 25, 0>
   translate <0, -.25, 0>
   }


camera
   {
   location  <1,  1.6, -5>
   direction <0.0,  0.0,  0.75>       //  "wide-angle" view
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,  1, 0>
   }
