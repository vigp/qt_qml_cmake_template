#cmake_minimum_required(VERSION 3.11)

project ("qt_qml_cmake_template")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++11 -fPIC -fstrict-aliasing -pedantic-errors -pedantic -Wno-deprecated-declarations -Wno-unused-variable")

###############################
# qt specific
###############################
set(QT_MODULES_TO_USE Core Gui Widgets Quick QuickControls2 Qml Concurrent Network DBus PrintSupport)

find_package(Qt5 COMPONENTS ${QT_MODULES_TO_USE} REQUIRED)

include_directories(${Qt5Widgets_INCLUDE_DIRS} ${Qt5Core_INCLUDE_DIRS} ${Qt5Gui_INCLUDE_DIRS} ${QtQml_INCLUDE_DIRS} ${Qt5Quick_INCLUDE_DIRS})
add_definitions(${Qt5Core_DEFINITIONS} ${Qt5Gui_DEFINITIONS} ${QtQml_DEFINITIONS} ${Qt5Quick_DEFINITIONS})
add_definitions(${QT_DEFINITIONS})

## qt resources files
qt5_add_resources(RESOURCES ./qml.qrc ./resources.qrc)

###############################
## source code
###############################
set(HEADERS
    ./src/xyz.h
    )

set(SOURCES
    ./src/main.cpp
    ./src/xyz.cpp
    )

#if(NOT DEFINED HEADERS)
#    file(GLOB HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
#endif()

#if(NOT DEFINED SOURCES)
#    file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
#endif()

## not for qt creator IDE
#source_group("Header Files" FILES ${HEADERS}) ## does not work in qt creator 5
#source_group("Source Files" FILES ${SOURCES}) ## does not work in qt creator 5

###############################
## target
###############################
add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES} ${RESOURCES})

target_include_directories(${PROJECT_NAME}
  PUBLIC
    src
)

###############################
## target link dependencies
###############################
target_link_libraries(${PROJECT_NAME}
  PUBLIC
    Qt5::Core
    Qt5::Gui
    Qt5::Qml
    Qt5::Quick
    Qt5::QuickControls2
)

###############################
## target properties
###############################
set_target_properties(${PROJECT_NAME}
  PROPERTIES
    AUTOMOC ON
    AUTORCC ON
    AUTOUIC ON
    #ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
    #LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
    #RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)

###############################
## target compile features
###############################
target_compile_features(${PROJECT_NAME}
  PUBLIC
    cxx_std_11
    #cxx_std_14
)

