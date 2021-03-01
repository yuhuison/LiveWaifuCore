if(NOT EXISTS "E:/2/CubismSdkForNative-4-r.2/LiveWaifuCore/OpenGL/Demo/proj.win.cmake/build/proj_msvc2019_x86_md/install_manifest.txt")
  message(FATAL_ERROR "Cannot find install manifest: E:/2/CubismSdkForNative-4-r.2/LiveWaifuCore/OpenGL/Demo/proj.win.cmake/build/proj_msvc2019_x86_md/install_manifest.txt")
endif(NOT EXISTS "E:/2/CubismSdkForNative-4-r.2/LiveWaifuCore/OpenGL/Demo/proj.win.cmake/build/proj_msvc2019_x86_md/install_manifest.txt")

if (NOT DEFINED CMAKE_INSTALL_PREFIX)
  set (CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/LiveWaifuCore")
endif ()
 message(${CMAKE_INSTALL_PREFIX})

file(READ "E:/2/CubismSdkForNative-4-r.2/LiveWaifuCore/OpenGL/Demo/proj.win.cmake/build/proj_msvc2019_x86_md/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach(file ${files})
  message(STATUS "Uninstalling $ENV{DESTDIR}${file}")
  if(IS_SYMLINK "$ENV{DESTDIR}${file}" OR EXISTS "$ENV{DESTDIR}${file}")
    exec_program(
      "D:/Program Files/CMake/bin/cmake.exe" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
      )
    if(NOT "${rm_retval}" STREQUAL 0)
      message(FATAL_ERROR "Problem when removing $ENV{DESTDIR}${file}")
    endif(NOT "${rm_retval}" STREQUAL 0)
  else(IS_SYMLINK "$ENV{DESTDIR}${file}" OR EXISTS "$ENV{DESTDIR}${file}")
    message(STATUS "File $ENV{DESTDIR}${file} does not exist.")
  endif(IS_SYMLINK "$ENV{DESTDIR}${file}" OR EXISTS "$ENV{DESTDIR}${file}")
endforeach(file)
