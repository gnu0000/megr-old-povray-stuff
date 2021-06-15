
#include "colors.inc"  
#include "textures.inc"
#include "stones1.inc"
#include "glass.inc"


/********************************************************************/

#declare L_Rad1 = 3.85


/*------ camera moves from 3% to 25% thru movie ------*/
#declare CameraPct   = (min (1, max (0, (clock - .03) / (.25 - .03))))
#declare CameraStart = <0, 0, -(L_Rad1+.5)>
#declare CameraEnd   = <-.4, -4, -28>
#declare CameraPos   = CameraStart + CameraPct * (CameraEnd - CameraStart)

/*------ camera look moves from 8% to 25% thru movie ------*/
#declare LookPct   = (min (1, max (0, (clock - .08) / (.25 - .08))))
#declare LookStart = <0, 0, 0>
#declare LookEnd   = <.25,   -2.5,   0>
#declare LookPos   = LookStart + LookPct * (LookEnd - LookStart)

/*------ rotate logo ------*/
#declare LogoPct   = clock
//#declare LogoStart = 180
#declare LogoStart = 0
#declare LogoEnd   = 0
#declare LogoRot   = LogoStart + LogoPct * (LogoEnd - LogoStart)

/*------  ------*/
#declare BreakPct   = (min (1, max (0, (clock - .90) / (1.0 - .90))))
#declare BreakStart = 0
#declare BreakEnd   = <1.1, .8, 0>
#declare BreakPos   = BreakStart + BreakPct * (BreakEnd - BreakStart)

/*------ rotate text ------*/
#declare TextPct   = (min (1, max (0, (clock - .10) / (.88 - .10))))
#declare TextStart = -90
#declare TextEnd   = 0
#declare TextRot   = TextStart + TextPct * (TextEnd - TextStart)

/*------ change light ------*/
#declare LightPct   = (min (1, max (0, (clock - .00) / (.10 - .00))))
#declare LightStart = Gray50
#declare LightEnd   = White
#declare LightColor = LightStart + LightPct * (LightEnd - LightStart)

/*------ add text ------*/
#declare AAPct   = (min (1, max (0, (clock - .90) / (1.0 - .90))))
#declare AAStart = Clear
#declare AAEnd   = White
#declare AAColor = AAStart + AAPct * (AAEnd - AAStart)


#declare Rad2Pct   = (min (1, max (0, (clock - .12) / (.80 - .12))))
#declare Rad2Start = L_Rad1 - .0000001
#declare Rad2End   = 3.45
#declare Rad2Siz   = Rad2Start + Rad2Pct * (Rad2End - Rad2Start)

#declare R2ColPct   = (min (1, max (0, (clock - .12) / (.80 - .12))))
#declare R2ColStart = Tan
#declare R2ColEnd   = color red 0.13 green 0.32 blue 0.36
#declare R2Col      = R2ColStart + R2ColPct * (R2ColEnd - R2ColStart)



/********************************************************************/

#declare L_Rad2 = Rad2Siz

#declare LO_Tex = texture
   {
   finish 
      {
      specular 0.35 roughness 0.10 
      ambient .15
      }
   pigment {Tan}
   }

#declare LI_Tex = texture
   {
   pigment {R2Col}
   finish 
      {
      specular 0.5 roughness 0.15
      ambient .2
      }
   }

#declare T_Tex = texture
   {
   pigment { Wheat }
   finish  
      { 
      specular  .4 roughness .1
      ambient   .15
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

#declare TextBlock1 = union
   {
   text 
      { 
      ttf "c:\win\fonts\gothicb.ttf" "Trns" .3, 0
      texture {T_Tex}
      scale <4, 6, 4>
      translate <-7.7, -8, 0>
      }
   text 
      { 
      ttf "c:\win\fonts\gothicb.ttf" "port" .3, 0
      texture {T_Tex}
      scale <4, 6, 4>
      translate <1, -8, 0>
      }
   text
      {
      ttf "c:\win\fonts\arial.ttf" "Transportation Software              Management Solution" .3, 0
      texture {T_Tex}
      scale <.67, .7, .7>
      translate <-8, -9, 0>
      }
   object {Transport_Logo2 scale <.085, .085, .085> translate <0, -6.6, 0>}

   translate <0, 0, -.6>
   }

#declare TextBlock2 = text
   {
   ttf "c:\win\fonts\arial.ttf" "AASHTO" .3, 0
//   texture {T_Tex}
   scale <.9, .9, .9>
   translate <-5.8, -4.4, 0>
   }


/********************************************************************/

#declare Transport_Logo = union
   {
   object {L_Inside}
   object {L_Center texture {LO_Tex}}
   object {L_Center texture {LO_Tex} rotate <0, 180, 0>}
   object {L_Wing rotate <0, 0, 0>   texture {LO_Tex} translate BreakPos}
   object {L_Wing rotate <0, 0, 90>  texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 180> texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 270> texture {LO_Tex}}
   }

/********************************************************************/


light_source 
   { 
   <-5, -5, -15.0> colour LightColor
// area_light <4.5 0 0> <0 4.5 0> 10 10
   adaptive 1 
   jitter
   }

camera 
   {
   location  CameraPos
   direction <0.0, 0.0, 1.8>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   LookPos
   }

object 
   {
   Transport_Logo
   rotate <0, LogoRot, 0>
   }

object 
   {
   TextBlock1
   rotate <0, TextRot, 0>
   }

object 
   {
   TextBlock2
   texture 
      {
      finish {ambient .2}
      pigment {AAColor}
      }
   }

/********************************************************************/
