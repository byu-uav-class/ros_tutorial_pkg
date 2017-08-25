#ifndef SAMPLE_NODE_H
#define SAMPLE_NODE_H

#include <ros/ros.h>
#include <geometry_msgs/Vector3.h>
#include <sensor_msgs/Imu.h>

namespace sample_node
{

class sampleNode
{

public:

  sampleNode();

private:

  // Node handles, publishers, subscribers
  ros::NodeHandle nh_;         //!< public node handle for subscribing, publishing, etc.
  ros::NodeHandle nh_private_; //!< private node handle for pulling parameter values from the parameter server

  // Publishers and Subscribers
  ros::Subscriber Vector3_subscriber_;
  ros::Publisher Imu_publisher_; 

  // Parameters
  double param_; 

  // Local Variables

  // Functions
  void Vector3Callback(const geometry_msgs::Vector3ConstPtr &msg);
};

} // namespace sample_node

#endif // sampleNode_H
