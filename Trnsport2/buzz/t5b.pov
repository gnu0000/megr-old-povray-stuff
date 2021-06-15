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

#declare SmallBallRadius  = 1
#declare LargeBallRadius  = 1.6
#declare MajorOrbitRadius = 3.2

#declare CornerPos        = MajorOrbitRadius * sin (pi/4)

#declare MinorOrbitRadius = MajorOrbitRadius * pi/8
#declare MarbleRadius     = (MinorOrbitRadius - SmallBallRadius) * .60


/***************************************************************************/
/***************************************************************************/

light_source {<-71, 70, -90> color White}
light_source {<20, 30, -900> color White}

camera
   {
   location  <1,    1.6,  -10.6>
   direction <0.0,  0.0,  1.2>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    .13,   0>
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

/********************************************************************/

#declare L_Rad1 = 1     // size metrics for the logo thingie
#declare L_Rad2 = .9    //
#declare L_Gap1 = .085  //
#declare L_Gap2 = .305  //
#declare L_Cent = .138  //


#declare LO_Tex = texture
   {
   finish {ambient .15}
   finish {specular 0.35 roughness 0.15}
   pigment {Tan}
   }

#declare LI_Tex = texture
   {
   finish {ambient .15}
   finish {specular 0.35 roughness 0.15}
   pigment {color rgb <0.13, 0.32, 0.36>}
   }

#declare T_Tex = texture
   {
   finish {ambient .15}
   finish {specular 0.35 roughness 0.15}
   pigment {Wheat}
   }

#declare L_Wing = intersection
   {
   sphere {0 L_Rad1}
   box    {<L_Gap1, L_Gap1, -L_Rad1> <L_Rad1, L_Rad1, L_Rad1>}
   box    {<0, 0, -L_Rad1> <L_Gap2, L_Gap2, L_Rad1> inverse}
   }

#declare L_Center = intersection
   {
   sphere {0 L_Rad1}
   box    {<-L_Cent, -L_Cent, -L_Rad1-1> <L_Cent, L_Cent, -L_Rad1+.15>}
   }

#declare L_Inside = intersection
   {
   sphere  {0 L_Rad2}
   object  {L_Wing inverse}
   texture {LI_Tex}
   }


/*
 * The dot in Trns.Port
 * Looks like a miniature logo w/o the flying wing
 */
#declare Transport_Marble = union
   {
   object {L_Inside}
   object {L_Center texture {LO_Tex}}
   object {L_Center texture {LO_Tex} rotate y*180}
   object {L_Wing rotate z*0   texture {LO_Tex}}
   object {L_Wing rotate z*90  texture {LO_Tex}}
   object {L_Wing rotate z*180 texture {LO_Tex}}
   object {L_Wing rotate z*270 texture {LO_Tex}}
   scale MarbleRadius
   }

/***************************************************************************/

#declare ballfinish = finish
   {
   metallic
   phong 1
   phong_size 200
   reflection 0.25
   }


#declare Bamds4cp = sphere
   {
   0 1

   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Bamds4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2.3, 1, 1>
         scale .75
         }
      finish {ballfinish}
      }
   scale SmallBallRadius
   }

#declare Cas4cp = sphere
   {
   0 1

   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Cas4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2.2, 1, 1>
         scale .75
         }
      finish {ballfinish}
      }
   scale SmallBallRadius
   }

#declare Ces4cp = sphere
   {
   0 1

   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Ces4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <1.65, 1, 1>
         scale .75
         }
      finish {ballfinish}
      }
   scale SmallBallRadius
   }

#declare Estim4cp = sphere
   {
   0 1

   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Estim4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <1.8, 1, 1>
         scale .75
         }
      finish {ballfinish}
      }
   scale SmallBallRadius
   }


#declare Exped4cp = sphere
   {
   0 1

   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Exped4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2, 1, 1>
         scale .75
         }
      finish {ballfinish}
      }
   scale SmallBallRadius
   }

#declare Las4cp = sphere
   {
   0 1

   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Las4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <1.9, 1, 1>
         scale .75
         }
      finish {ballfinish}
      }
   scale SmallBallRadius
   }


#declare Pes4cp = sphere
   {
   0 1

   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Pes4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2, 1, 1>
         scale .75
         }
      finish {ballfinish}
      }
   scale SmallBallRadius
   }

#declare Sitma4cp = sphere
   {
   0 1

   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Sitma4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2.6, 1, 1>
         scale .70
         }
      finish {ballfinish}
      }
   scale SmallBallRadius
   }

#declare Trnsp4cp = sphere
   {
   0 1

   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Trnsp4cp.gif" once}
         translate <-.5, -.5, 0>
         }
      finish {ballfinish}
      }
   scale LargeBallRadius
   }


#declare Marble = sphere
   {
   0, (MinorOrbitRadius - SmallBallRadius) * .75

   texture {MathR}
   }

/***************************************************************************/
/***************************************************************************/

object {Trnsp4cp  translate <0,                0,                0>}
object {Estim4cp  translate <-MajorOrbitRadius,0,                0>}
object {Pes4cp    translate <-CornerPos,       CornerPos,        0>}
object {Las4cp    translate <0,                MajorOrbitRadius, 0>}
object {Cas4cp    translate <CornerPos,        CornerPos,        0>}
object {Exped4cp  translate <MajorOrbitRadius, 0,                0>}
object {Ces4cp    translate <CornerPos,        -CornerPos,       0>}
object {Bamds4cp  translate <0,                -MajorOrbitRadius,0>}
object {Sitma4cp  translate <-CornerPos,       -CornerPos,       0>}



#declare MarbleCount = 32

#declare ctA = 0
#declare sd = -1
#while (ctA < MarbleCount)
   #declare clk  = (clock*2 + ctA)/MarbleCount

   #declare ctB = 0
   #while (ctB < 5)
      #declare MajR = MajorOrbitRadius - MinorOrbitRadius + MinorOrbitRadius/2 * ctB


      #declare MinR = 0
      #declare MinR = (ctB > 0 ? MinorOrbitRadius * sin (60/180*pi) : MinR)
      #declare MinR = (ctB > 1 ? MinorOrbitRadius                   : MinR)
      #declare MinR = (ctB > 2 ? MinorOrbitRadius * sin (60/180*pi) : MinR)
      #declare MinR = (ctB > 3 ? 0                                  : MinR)

      #declare YPos = MajR * sin (clk * 2 * pi)
      #declare XPos = MajR * cos (clk * 2 * pi)
      #declare ZPos = sd * MinR * cos (clk * 8 * pi)

      object {Transport_Marble translate <XPos, YPos, ZPos>}

      #declare ctB = ctB + 1
      #declare sd = sd * -1
   #end

   #declare ctA = ctA + 1
#end


