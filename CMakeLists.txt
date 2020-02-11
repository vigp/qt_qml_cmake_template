cmake_minimum_required(VERSION 3.11)

project("qt_qml_cmake_template" VERSION 0.0.1 DESCRIPTION "project description ..." LANGUAGES C CXX)

add_subdirectory(app app)  ## app=> src_dir  app=> build_ouput_dir  for subdir project
add_subdirectory(app_libs)
add_subdirectory(3rd_party)
