#
#   Copyright 2021 R. Kent James <kent@caspia.com>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

"""
(This is module-level documentation for PySubPub. This docstring must be inserted
before any code in the module.)

Overview
========
This module contains a single class which creates a ROS2 node.
"""

import math

from fqdemo_msgs.msg import NumPwrData, NumPwrResult
import rclpy
from rclpy.node import Node

TIMER_PERIOD_SECONDS = 0.5

class PySubPub(Node):
    """Node to simulate a sample filter to an incoming topic, publishing result.

    Listens for a message with a number and power. Publishes a message with that number to that
    power, and to that root. Part of a demonstration of a ROS2 package with supporting quality
    features.

    **Node Name**: ``py_node``

    **Topics Subscribed**

    * ``num_power`` (type :py:class:`fqdemo_msgs:fqdemo_msgs.msg.NumPwrData`)
        Requests from package users to calculate a power and root.

    **Topics Published**

    * ``power_result`` (type :doc:`fqdemo_msgs:fqdemo_msgs.msg.NumPwrResult`)
        Message is published either in response to an incoming ``num_power``
        NumPwrResult message, or a message with zeros is published periodically.
    """
    def __init__(self):
        """Constructor method"""
        super().__init__('pysubpub')

        #: Publisher for topic *power_result* type NumPwrResult
        self.publisher = self.create_publisher(NumPwrResult, 'power_result', 10)

        #: Subscriber for topic *num_power* type NumPwrData
        self.subscriber = self.create_subscription(
          NumPwrData, 'num_power', self.topic_callback, 10
        )

        #: Timer that fires periodically to generate a zero response
        self._timer = self.create_timer(TIMER_PERIOD_SECONDS, self._timer_callback)

    @staticmethod
    def apply_powers(
        number, exponent):
        """Given a number and an exponent, calculate its power and root.

        :param float number: Base value to take to a power or root
        :param float exponent: Value to use as exponent for power or root
        :return: Result of (pow(number, exponent), pow(number, 1./exponent))
        :rtype: tuple(float, float)
        """

        to_power = math.pow(number, exponent)
        to_root = math.pow(number, 1. / exponent)
        return ((to_power, to_root))

    def _timer_callback(self):
        """ callback for a periodic timer, publishes a zero message """
        msg = NumPwrResult()
        msg.to_power = 0.0
        msg.to_root = 0.0
        self.publisher.publish(msg)
        self.get_logger().info(f'Publishing to_power: {msg.to_power}, to_root: {msg.to_root}')

    def topic_callback(self, 
          msg:NumPwrData
        ):
        """ callback for subscription to num_power """
        self.get_logger().info(f'I heard {msg}')
        response_msg = NumPwrResult()
        (response_msg.to_power, response_msg.to_root) = self.apply_powers(msg.num, msg.power)
        self.publisher.publish(response_msg)
        self.get_logger().info(
            f'Publishing to_power: {response_msg.to_power}, to_root: {response_msg.to_root}')

    def run(self):
        """ main program for the node """
        # run the node, teardown when done
        rclpy.spin(self)
        self.destroy_node()


if __name__ == '__main__':
    rclpy.init()
    pySubPub = PySubPub()
    pySubPub.run()
    rclpy.shutdown()
