/*
 *
 * Exports: the sky object is included as part of the scene
 *
 * you must #declare Sky_Top before including this file
 * Sky_Top is the distance from ground to the top of the sky
 *
 */

//#declare Sky_Top = 100

#declare Colors2 = color_map  // Realistic
   {
   [0.0 0.1 color SkyBlue color SkyBlue]
   [1.0 color White]
   }

#declare Colors3 = color_map  // Very realistic!
   {
   [0.0 0.1 color SkyBlue color SkyBlue]
   [0.70 color rgb <4/5, 4/5, 5/6>]
   [1.0 color White]
   }

#declare Storm = color_map  // looks quite heavy with SkyColor in the lower layer!
   {
   [0.0 0.1 color Clear color Clear]
   [0.70 color rgbf <4/5, 4/5, 5/6, 1/2>]
   [1.0 color White]
   }

#declare CloudSky = texture  // this is the cloud texture
   {
   pigment
      {
      bozo
      turbulence 0.5
      octaves    3
      lambda     6   // bigger values are worth trying
      omega      0.45
      color_map {Colors3}
      }
   finish { ambient 1 diffuse 0 }
   scale 1/6   // please notice
   }

//sphere  // the sky globe -- please notice the scalings!
//   {
//   <0, 0, 0>, 1
//   texture {CloudSky}
//   scale <Sky_Top*10, Sky_Top, Sky_Top*10>
//   }

