cmake_minimum_required(VERSION 3.8)
project(fqdemo_nodes)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rclpy REQUIRED)
find_package(fqdemo_msgs REQUIRED)

# Include Cpp "include" directory
include_directories(include)

# Create a library we can import for our tests
add_library(${PROJECT_NAME} src/demo_sub_pub.cpp)
ament_target_dependencies(${PROJECT_NAME} rclcpp fqdemo_msgs)

# Install Cpp executables
add_executable(subpub src/subpub_node.cpp)
ament_target_dependencies(subpub rclcpp fqdemo_msgs)
target_link_libraries(subpub ${PROJECT_NAME})

# install Python modules
ament_python_install_package(${PROJECT_NAME})

# Install Python executables
install(PROGRAMS
  scripts/py_node
  DESTINATION lib/${PROJECT_NAME}
)

install(TARGETS
  subpub
  DESTINATION lib/${PROJECT_NAME}
)

if(BUILD_TESTING)
  # linting
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()

  # gtest
  find_package(ament_cmake_gtest REQUIRED())
  ament_add_gtest(test_fqdemo_nodes
    test/test_apply_powers
  )
  target_link_libraries(test_fqdemo_nodes ${PROJECT_NAME})
  ament_target_dependencies(test_fqdemo_nodes rclcpp fqdemo_msgs)

  # pytest
  find_package(ament_cmake_pytest REQUIRED)

  ament_add_pytest_test(
    fqdemo_nodes_pytest
    test/test_apply_powers.py
    PYTHON_EXECUTABLE "${PYTHON_EXECUTABLE}"
    APPEND_ENV PYTHONPATH=${CMAKE_CURRENT_BINARY_DIR}
  )

endif()

ament_package()
