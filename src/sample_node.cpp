#include "sample_node/sample_node.h"

namespace sample_node
{

sampleNode::sampleNode() :
  nh_(ros::NodeHandle()),
  nh_private_(ros::NodeHandle("~"))
{
  // retrieve params
  nh_private_.param<double>("param", param_, 0);
  // Setup publishers and subscribers
  Vector3_subscriber_ = nh_.subscribe("in_topic", 1, &sampleNode::Vector3Callback, this);
  Imu_publisher_ = nh_.advertise<sensor_msgs::Imu>("out_topic", 1);
}

void sampleNode::Vector3Callback(const geometry_msgs::Vector3ConstPtr &msg){}

} // namespace sample_node
