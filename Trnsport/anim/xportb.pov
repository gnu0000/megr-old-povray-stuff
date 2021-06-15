#include "colors.inc" 
#include "textures.inc"
#include "stones1.inc"
#include "glass.inc"

//***************************************************************************/
//*
//*  Animation Control
//*
//***************************************************************************/

#declare L_Rad1 = 1     // size metrics for the logo thingie
#declare L_Rad2 = .9    //
#declare L_Gap1 = .085  //
#declare L_Gap2 = .305  //
#declare L_Cent = .138  //

/*------ camera moves ------*/
//#declare CameraPct   = (min (1, max (0, (clock - .03) / (.45 - .03))))
//#declare CameraStart = <0, 1.68, -(L_Rad1+1)>
//#declare CameraEnd   = <-.1, .6, -7>
//#declare CameraPos   = CameraStart + CameraPct * (CameraEnd - CameraStart)

/*------ camera look ------*/
#declare LookPct   = (min (1, max (0, (clock - .03) / (.45 - .03))))
#declare LookStart = <0, 1.68, 0>
#declare LookEnd   = <.06,   1.15,   0>
#declare LookPos   = LookStart + LookPct * (LookEnd - LookStart)

/*------ make AASHTO text un-dissolve into picture ------*/
#declare _AAPct   = (min (1, max (0, (clock - .90) / (1.0 - .90))))
#declare _AAStart = 0
#declare _AAEnd   = 1
#declare _AAf     = _AAStart + _AAPct * (_AAEnd - _AAStart)
#declare AAColor = rgbf <1, 1, 1, 1-_AAf*_AAf*_AAf>



#declare hpi = 3.1415926535/2
#declare skale = 0.085
#declare yloc = 0.01
#declare xloc = (-7 + clock * (4 / .25)                     ) *skale
#declare zloc = (2                                          ) *skale
#declare xloc = (clock > 0.25 ? (-3+3*sin((clock-.25)*4*hpi)) *skale : xloc)
#declare zloc = (clock > 0.25 ? (2*cos((clock-.25)*4*hpi)   ) *skale : zloc)
#declare xloc = (clock > 0.50 ? (3-3*sin((clock-.25)*4*hpi) ) *skale : xloc)
#declare xloc = (clock > 0.75 ? (3 + (clock-.75)*(4/.25)    ) *skale : xloc)
#declare zloc = (clock > 0.75 ? (-2                         ) *skale : zloc)

#declare clock2 = clock+.01
#declare ylook = 0.01
#declare xlook = (-7 + clock2 * (4 / .25)) * skale
#declare zlook = 2*skale
#declare xlook = (clock2 > 0.25 ? (-3+3*sin((clock2-.25)*4*hpi))*skale : xlook)
#declare zlook = (clock2 > 0.25 ? (2*cos((clock2-.25)*4*hpi))*skale    : zlook)
#declare xlook = (clock2 > 0.50 ? (3-3*sin((clock2-.25)*4*hpi))*skale  : xlook)
#declare xlook = (clock2 > 0.75 ? (3 + (clock2-.75)*(4/.25))*skale   : xlook)
#declare zlook = (clock2 > 0.75 ? -2*skale : zloc)

#declare CameraPos = <xloc - L_Rad1, yloc, zloc>
#declare LookPos   = <xlook - L_Rad1, ylook+.005, zlook>


//***************************************************************************/
//*
//*  Surface Textures
//*
//***************************************************************************/

#default 
   {
   texture 
      {
      finish {ambient .15}
      finish {specular 0.35 roughness 0.15}
      }
   }

#declare LO_Tex = texture
   {
   pigment {Tan}
   }

#declare LI_Tex = texture
   {
   pigment {color rgb <0.13, 0.32, 0.36>}
   }

#declare T_Tex = texture
   {
   pigment {Wheat}
   }


//***************************************************************************/
//*
//*  Logo Construction
//*
//***************************************************************************/


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

#declare Transport_Logo = union
   {
   object {L_Inside}
   object {L_Center texture {LO_Tex}}
// object {L_Center texture {LO_Tex} rotate y*180}
   object {L_Wing rotate z*0   texture {LO_Tex} translate <L_Rad1*.3, L_Rad1*.23, 0>}
   object {L_Wing rotate z*90  texture {LO_Tex}}
   object {L_Wing rotate z*180 texture {LO_Tex}}
   object {L_Wing rotate z*270 texture {LO_Tex}}
   }

/*
 * The dot in Trns.Port
 * Looks like a miniature logo w/o the flying wing
 */
#declare Transport_Dot = union
   {
   object {L_Inside}
   object {L_Center texture {LO_Tex}}
   object {L_Wing rotate z*0   texture {LO_Tex}}
   object {L_Wing rotate z*90  texture {LO_Tex}}
   object {L_Wing rotate z*180 texture {LO_Tex}}
   object {L_Wing rotate z*270 texture {LO_Tex}}
   }


//***************************************************************************/
//*
//*  Text objects Construction
//*
//***************************************************************************/

#declare TextBlock1 = union
   {
   text 
      { 
      ttf "c:\windows\fonts\gothicb.ttf" "Trns" .3, 0
      texture {T_Tex}
      scale <1, 1.5, 1>
      translate <-1.925, -0.32, 0>
      }
   text 
      { 
      ttf "c:\windows\fonts\gothicb.ttf" "port" .3, 0
      texture {T_Tex}
      scale <1, 1.5, 1>
      translate <.25, -0.32, 0>
      }
   text
      {
      ttf "c:\windows\fonts\arial.ttf" "Transportation Software              Management Solution" .3, 0
      texture {T_Tex}
      scale <.167, .175, .175>
      translate <-2, -.57, 0>
      }
   object {Transport_Dot scale 0.085}
   texture {T_Tex}
   translate -z*0.24
   }

#declare TextBlock2 = text
   {
   ttf "c:\windows\fonts\arial.ttf" "AASHTO" .3, 0
   texture 
      {
      finish {specular 0.001}
      pigment {AAColor}
      }
   scale .225
   translate <-1.45, 0.58, 0>
   }


//***************************************************************************/
//*
//* Scene Creation
//*
//***************************************************************************/


light_source 
   { 
   <-5, -5, -15.0> colour White
//   area_light <4.5 0 0> <0 4.5 0> 10 10
//   adaptive 1 
//   jitter
   }

camera 
   {
   location  CameraPos
   direction <0.0, 0.0, 1>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   LookPos
   }

object 
   {
   Transport_Logo
   translate y*1.7
   }



//object 
//   {
//   TextBlock1
//   }
//
//object 
//   {
//   TextBlock2
//   }


object {Transport_Dot scale 0.085}
