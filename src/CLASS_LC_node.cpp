#include <ros/ros.h>
#include "CLASS_LC/CLASS_LC.h"

int main(int argc, char** argv)
{
  ros::init(argc, argv, "CLASS_LC_node");
  ros::NodeHandle nh;

  NAMESPACE::CLASS Thing;

  ros::spin();

  return 0;
}
