# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/Asus/Documents/Projects/mka/build/windows/_deps/nuget-src"
  "C:/Users/Asus/Documents/Projects/mka/build/windows/_deps/nuget-build"
  "C:/Users/Asus/Documents/Projects/mka/build/windows/_deps/nuget-subbuild/nuget-populate-prefix"
  "C:/Users/Asus/Documents/Projects/mka/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/tmp"
  "C:/Users/Asus/Documents/Projects/mka/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp"
  "C:/Users/Asus/Documents/Projects/mka/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/src"
  "C:/Users/Asus/Documents/Projects/mka/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp"
)

set(configSubDirs Debug;Release;MinSizeRel;RelWithDebInfo)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/Asus/Documents/Projects/mka/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp/${subDir}")
endforeach()
