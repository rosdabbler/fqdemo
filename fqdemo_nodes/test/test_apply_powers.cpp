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

#include <gtest/gtest.h>
#include <tuple>
#include "fqdemo_nodes/demo_sub_pub.hpp"

namespace fqdemo_nodes
{

TEST(fqdemo_nodes, ApplyPowers)
{
  std::tuple<double, double> t1_1 = DemoSubPub::apply_powers(1.0, 1.0);
  ASSERT_DOUBLE_EQ(1.0, std::get<0>(t1_1));
  ASSERT_DOUBLE_EQ(1.0, std::get<1>(t1_1));
}

}  // namespace fqdemo_nodes
