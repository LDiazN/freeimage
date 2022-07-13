--
--  FreeImage v3.15.4 build script
--

-- Set a prefix for the install action below
local prefix = _OPTIONS["prefix"] or "./dist/freeimage"

-----------------------------------------------------------------------------------------------------------------------------------------------------

project "freeimagelib"
    kind "StaticLib"
    language "C++"
    staticruntime "on"
       
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    includedirs
    {
		"source",
		"source/zlib",
		"source/deprecationmanager",
		"source/openexr/half",
		"source/openexr/iex",
		"source/openexr/ilmimf",
		"source/openexr/imath",
		"source/openexr/ilmthread",
    }
        
    files 
    { 
		"source/*.h",
		"source/deprecationmanager/*.h",
		"source/deprecationmanager/*.cpp",
		"source/freeimage/*.cpp",
		"source/metadata/*.cpp",
		"source/freeimagetoolkit/*.h",
		"source/freeimagetoolkit/*.cpp",	
    }
    
    excludes
    {
      
    }
    
    defines 
    { 
      "WIN32",
      "WIN32_LEAN_AND_MEAN",
      "VC_EXTRALEAN",
      "_LIB",
      "OPJ_STATIC",
	  "LIBRAW_NODLL",
      "FREEIMAGE_LIB",
      "_CRT_SECURE_NO_DEPRECATE"
    }
    
    configuration "Debug"
        defines { "DEBUG" }
        symbols "on"	  	  
        targetname "freeimage"
           
    configuration "Release"
        defines { "NDEBUG" }
        optimize "on"      	  
        targetname "freeimage"
