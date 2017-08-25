cmake_minimum_required(VERSION 2.8.3)
project(sample_node)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  sensor_msgs
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
# add_library(sample_node
#   src/${PROJECT_NAME}/sample_node.cpp
# )

## Declare a cpp executable
add_executable(sample_node_node src/sample_node_node.cpp src/sample_node.cpp)

## Add cmake target dependencies of the executable/library
add_dependencies(sample_node_node relative_nav_msgs_generate_messages_cpp)

target_link_libraries(sample_node_node
  ${catkin_LIBRARIES}
)
