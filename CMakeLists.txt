cmake_minimum_required(VERSION 2.8.3)
project(CLASS_LC)

find_package(catkin REQUIRED COMPONENTS
  SUB_NAMESPACE
  PUB_NAMESPACE
  roscpp
  rospy
)

catkin_package()

###########
## Build ##
###########
include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

## Declare a cpp library
# add_library(CLASS_LC
#   src/${PROJECT_NAME}/CLASS_LC.cpp
# )

## Declare a cpp executable
add_executable(CLASS_LC_node src/CLASS_LC_node.cpp src/CLASS_LC.cpp)

## Add cmake target dependencies of the executable/library
add_dependencies(CLASS_LC_node relative_nav_msgs_generate_messages_cpp)

target_link_libraries(CLASS_LC_node
  ${catkin_LIBRARIES}
)
