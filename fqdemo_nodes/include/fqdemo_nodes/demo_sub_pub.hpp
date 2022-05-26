//
//   Copyright 2021 R. Kent James <kent@caspia.com>
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.

#ifndef FQDEMO_NODES__DEMO_SUB_PUB_HPP_
#define FQDEMO_NODES__DEMO_SUB_PUB_HPP_

/// @file
/// @brief This is the header file for the DemoSubPub class

#include <tuple>
#include "rclcpp/rclcpp.hpp"
#include "fqdemo_msgs/msg/num_pwr_result.hpp"
#include "fqdemo_msgs/msg/num_pwr_data.hpp"

/// namespace for the ROS2 package containing this node
namespace fqdemo_nodes
{

/** 

  A demonstration of a simple ROS2 node that raises numbers to a power and root

  This node is used as a demo of how to setup a folder for a package, including various
  things like documentation and testing. The node itself listens to a custom message that
  contains a number and an exponent, then publishes a message with the number taken to the
  power and root of that exponent.

  @rstb
  **Topics Subscribed**: ``num_power`` (type :py:class:`NumPwrData`): Publishes a message to topic ``/power_result``
  after message is received.
  @endrst

  <b>Topics Published:</b> `power_result` (type @rst `NumPwrResult` @endrst ). A zero-valued message
  is published periodically. A message with appropriate values is published in response to
  a /num_power message.

*/

class DemoSubPub : public rclcpp::Node
{
public:
  DemoSubPub();
  virtual ~DemoSubPub() {}

  /// Generate the root and power of a number
  static std::tuple<double, double> apply_powers(
    const double_t number,  ///< base value we want to take to a power or root
    const double exponent   ///< the exponent for the power or root
  );

public:
  /**
   * called whenever a NumPwrData message is received.
   * @param[in] msg The message
   **/
  void topic_callback(const fqdemo_msgs::msg::NumPwrData::SharedPtr msg);

  /// called periodically to generate a default response
  void timer_callback();

  /// subscription object for NumPwrData messages
  rclcpp::Subscription<fqdemo_msgs::msg::NumPwrData>::SharedPtr subscriber_;

  /// periodic timter to generate some active output even if nothing incoming
  rclcpp::TimerBase::SharedPtr timer_;

  /// publishes the results of apply_powers on the incoming message
  rclcpp::Publisher<fqdemo_msgs::msg::NumPwrResult>::SharedPtr publisher_;

  /// counter used to display number of timer messages sent
  size_t count_;
};

}  // namespace fqdemo_nodes

#endif  // FQDEMO_NODES__DEMO_SUB_PUB_HPP_
