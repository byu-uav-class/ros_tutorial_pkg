#ifndef CLASS_UC_H
#define CLASS_UC_H

#include <ros/ros.h>
#include <SUB_NAMESPACE/SUB_TYPE.h>
#include <PUB_NAMESPACE/PUB_TYPE.h>

namespace NAMESPACE
{

class CLASS
{

public:

  CLASS();

private:

  // Node handles, publishers, subscribers
  ros::NodeHandle nh_;         //!< public node handle for subscribing, publishing, etc.
  ros::NodeHandle nh_private_; //!< private node handle for pulling parameter values from the parameter server

  // Publishers and Subscribers
  ros::Subscriber SUB_TYPE_subscriber_;
  ros::Publisher PUB_TYPE_publisher_; 

  // Parameters
  double PARAM_; 

  // Local Variables

  // Functions
  void SUB_TYPECallback(const SUB_NAMESPACE::SUB_TYPEConstPtr &msg);
};

} // namespace NAMESPACE

#endif // CLASS_H
