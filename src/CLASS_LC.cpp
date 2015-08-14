#include "CLASS_LC/CLASS_LC.h"

namespace NAMESPACE
{

CLASS::CLASS() :
  nh_(ros::NodeHandle()),
  nh_private_(ros::NodeHandle("~"))
{
  // retrieve params
  nh_private_.param<double>("PARAM", PARAM_, 0);
  // Setup publishers and subscribers
  SUB_TYPE_subscriber_ = nh_.subscribe("SUB_TOPIC", 1, &CLASS::SUB_TYPECallback, this);
  PUB_TYPE_publisher_ = nh_.advertise<PUB_NAMESPACE::PUB_TYPE>("PUB_TOPIC", 1);
}

void CLASS::SUB_TYPECallback(const SUB_NAMESPACE::SUB_TYPEConstPtr &msg){}

} // namespace NAMESPACE
