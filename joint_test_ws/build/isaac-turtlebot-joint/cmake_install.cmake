# Install script for directory: /home/cj/isaac-sim-prj/git_lone/Isaac-turtlebot-joint/joint_test_ws/src/isaac-turtlebot-joint

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/cj/isaac-sim-prj/git_lone/Isaac-turtlebot-joint/joint_test_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/cj/isaac-sim-prj/git_lone/Isaac-turtlebot-joint/joint_test_ws/build/isaac-turtlebot-joint/catkin_generated/installspace/isaac-turtlebot-joint.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/isaac-turtlebot-joint/cmake" TYPE FILE FILES
    "/home/cj/isaac-sim-prj/git_lone/Isaac-turtlebot-joint/joint_test_ws/build/isaac-turtlebot-joint/catkin_generated/installspace/isaac-turtlebot-jointConfig.cmake"
    "/home/cj/isaac-sim-prj/git_lone/Isaac-turtlebot-joint/joint_test_ws/build/isaac-turtlebot-joint/catkin_generated/installspace/isaac-turtlebot-jointConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/isaac-turtlebot-joint" TYPE FILE FILES "/home/cj/isaac-sim-prj/git_lone/Isaac-turtlebot-joint/joint_test_ws/src/isaac-turtlebot-joint/package.xml")
endif()
