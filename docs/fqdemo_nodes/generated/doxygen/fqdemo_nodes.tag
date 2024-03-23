<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.9.4">
  <compound kind="file">
    <name>demo_sub_pub.hpp</name>
    <path>/github/workspace/fqdemo_nodes/include/fqdemo_nodes/</path>
    <filename>demo__sub__pub_8hpp.html</filename>
    <class kind="class">fqdemo_nodes::DemoSubPub</class>
    <namespace>fqdemo_nodes</namespace>
  </compound>
  <compound kind="file">
    <name>subpub_node.hpp</name>
    <path>/github/workspace/fqdemo_nodes/include/fqdemo_nodes/</path>
    <filename>subpub__node_8hpp.html</filename>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>subpub__node_8hpp.html</anchorfile>
      <anchor>a3c04138a5bfe5d72780bb7e82a18e627</anchor>
      <arglist>(int argc, char **argv)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>fqdemo_nodes::DemoSubPub</name>
    <filename>classfqdemo__nodes_1_1DemoSubPub.html</filename>
    <member kind="function">
      <type>void</type>
      <name>topic_callback</name>
      <anchorfile>classfqdemo__nodes_1_1DemoSubPub.html</anchorfile>
      <anchor>a0ab3790062646d026425c179f5536d9c</anchor>
      <arglist>(const fqdemo_msgs::msg::NumPwrData::SharedPtr msg)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>timer_callback</name>
      <anchorfile>classfqdemo__nodes_1_1DemoSubPub.html</anchorfile>
      <anchor>acb690d3185c0f74656a97b98cef9246a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static std::tuple&lt; double, double &gt;</type>
      <name>apply_powers</name>
      <anchorfile>classfqdemo__nodes_1_1DemoSubPub.html</anchorfile>
      <anchor>a1b5264352aaa2ba44d31dc1d3657f0e5</anchor>
      <arglist>(const double_t number, const double exponent)</arglist>
    </member>
    <member kind="variable">
      <type>rclcpp::Subscription&lt; fqdemo_msgs::msg::NumPwrData &gt;::SharedPtr</type>
      <name>subscriber_</name>
      <anchorfile>classfqdemo__nodes_1_1DemoSubPub.html</anchorfile>
      <anchor>a7f5b2a5ef9c22ccb8aa55176eeec371e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>rclcpp::TimerBase::SharedPtr</type>
      <name>timer_</name>
      <anchorfile>classfqdemo__nodes_1_1DemoSubPub.html</anchorfile>
      <anchor>a7e147c9be71df32b5441b05feb50b51b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>rclcpp::Publisher&lt; fqdemo_msgs::msg::NumPwrResult &gt;::SharedPtr</type>
      <name>publisher_</name>
      <anchorfile>classfqdemo__nodes_1_1DemoSubPub.html</anchorfile>
      <anchor>a3434595efd95f3bf945556d85718ea7a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>size_t</type>
      <name>count_</name>
      <anchorfile>classfqdemo__nodes_1_1DemoSubPub.html</anchorfile>
      <anchor>a53e223874e01f594369c085b7069a772</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>fqdemo_nodes</name>
    <filename>namespacefqdemo__nodes.html</filename>
    <class kind="class">fqdemo_nodes::DemoSubPub</class>
  </compound>
</tagfile>
