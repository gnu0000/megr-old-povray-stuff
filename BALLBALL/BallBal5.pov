#include "colors.inc"  
#include "shapes.inc"  
#include "shapes2.inc"  
#include "textures.inc"
#include "stones1.inc"

// Sky
sphere 
   { 
   <0, 0, 0>, 1
   texture 
      {
      pigment {rgb <1, 1, 1>}
      finish {ambient 1 diffuse 0}
      }
   scale 1000
   }


#declare L_Rad1 = 3.85;
#declare L_Rad2 = 3.45;

#declare LO_Tex = texture
   {
   finish 
      {
      specular 0.35 roughness 0.10 // Med Dull
      ambient .2
      }
   pigment {Tan}
   }

#declare LI_Tex = texture
   {
   pigment {color red 0.13 green 0.32 blue 0.36}
   finish 
      {
      specular 0.5 roughness 0.15 // Dull
      ambient .2
      }
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
//   object {L_Wing rotate <0, 0, 0>   texture {LO_Tex} translate <1.1, .8, 0>}
   object {L_Wing rotate <0, 0, 0>   texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 90>  texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 180> texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 270> texture {LO_Tex}}
   }

#declare Ball = object
	{
	Transport_Logo
	scale <.035, .035, .035>
	rotate <0, -90, 0>
	}

/********************************************************************/


light_source { <1, 5, -50.0> colour White }


camera 
   {
   location  <.5,  .8, -6>
   direction <0.0, 0.0, 1.2>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   0,   0>
   }

#declare CountO=0;
#while (CountO < 360)

   #declare Count=0;
   #while (Count < 3.14159)
      object
         {
			Ball
			translate <2 * sin (Count), 2 * cos(Count), 0>
         rotate <0, CountO + Count * 90/3.14159 * 2, 0>
         }
         #declare Count = Count + 3.14159/35;
   #end

   #declare CountO = CountO + 20;
#end

