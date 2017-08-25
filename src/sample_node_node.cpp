#include <ros/ros.h>
#include "sample_node/sample_node.h"

int main(int argc, char** argv)
{
  ros::init(argc, argv, "sample_node_node");
  ros::NodeHandle nh;

  sample_node::sampleNode Thing;

  ros::spin();

  return 0;
}
