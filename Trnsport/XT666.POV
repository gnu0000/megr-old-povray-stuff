
#include "colors.inc"  
#include "textures.inc"
#include "stones1.inc"
#include "glass.inc"



#declare L_Rad1 = 3.85
#declare L_Rad2 = 3.45

#declare LO_Tex = texture
   {
   finish 
      {
      specular 0.35 roughness 0.10 // Med Dull
//      ambient .15
      ambient .25
      }
   pigment {Tan}
   }

#declare LI_Tex = texture
   {
   pigment {color red 0.13 green 0.32 blue 0.36}
   finish 
      {
      specular 0.5 roughness 0.15 // Dull
//      ambient .2
      ambient .3
      }
   }

#declare T_Tex = texture
   {
   pigment { Wheat }
   finish  { reflection .25 specular 1 }
   }

#declare L_Wing = intersection
   {
   sphere 
      {<0, 0, 0> L_Rad1}
   box
      {<.325, .325, -L_Rad1> <L_Rad1, L_Rad1, L_Rad1>}
   box
      {<0, 0, -L_Rad1> <1.175, 1.175, L_Rad1> inverse}
   }

#declare L_Center = intersection
   {
   sphere 
      {<0, 0, 0> L_Rad1}
   box
      {<-.525, -.525, -L_Rad1-1> <.525, .525, -L_Rad1+.45>}
   }


#declare L_Inside = intersection
   {
   sphere 
      {<0, 0, 0> L_Rad2}
   object 
      {L_Wing inverse}
   texture {LI_Tex}

   }

#declare Transport_Logo = union
   {
   object {L_Inside}
   object {L_Center texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 0>   texture {LO_Tex} translate <1.1, .8, 0>}
   object {L_Wing rotate <0, 0, 90>  texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 180> texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 270> texture {LO_Tex}}
   }

#declare Transport_Logo2 = union
   {
   object {L_Inside}
   object {L_Center texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 0>   texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 90>  texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 180> texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 270> texture {LO_Tex}}
   }


/********************************************************************/


camera 
   {
   location  <-1.5, -2, -28.0>
   direction <0.0, 0.0, 3.0>
   up        <0.0, 1.0, 0>
//   right     <4/3, 0.0, 0>
        right <1, 0.0, 0.0>
   look_at   <.45,   0.33,   0>
   }

light_source 
   { 
//   <-5, -5, -15.0> colour White 
   <-100, -100, -300.0> colour White 
   adaptive 1 
   jitter
   }

//light_source { <-8, -0, -150.0> colour White }



object {Transport_Logo}


sphere
   {
   <0, 0, 0> 1000
   texture
      {
      pigment {color red 0.75 green 0.75 blue 0.75}
      finish
         {
         diffuse 0.0
         ambient 1
         }
      }
   }
