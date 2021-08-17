#!/usr/bin/env python

import rospy
from sensor_msgs.msg import JointState
import numpy as np
import time

rospy.init_node("turtlebot_bridge", anonymous=True)

pub = rospy.Publisher("/joint_command", JointState, queue_size=10)
rate = rospy.Rate(2)
joint_state = JointState()

joint_state.name = ["wheel_left_joint", "wheel_right_joint"]
num_joints = len(joint_state.name)

joint_state.velocity = np.array([3.14]* num_joints)
while not rospy.is_shutdown():
    pub.publish(joint_state)
    rate.sleep()
