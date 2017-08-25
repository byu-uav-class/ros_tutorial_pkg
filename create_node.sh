#!/bin/bash

yellow='\E[0;33m'
red='\E[0;31m'
wipe="\033[1m\033[0m"

echo_yellow "Welcome to the Node Creator!"

echo -e "What is the name of the ${red}class${wipe} you're wrapping a Node around?  ${red}[camelCase format]${wipe} [sampleNode]"
read CLASS

if [ -z "$CLASS" ]
then
	CLASS=sampleNode
fi

echo -e "What is the name of the ${red}class${wipe} you're wrapping a node around in? ${red}[lower_case format]${wipe} [sample_node]"
read CLASS_LC

if [ -z "$CLASS_LC" ]
then
	CLASS_LC=sample_node
fi

echo -e "What ${red}topic${wipe} would you like to subscribe to? (no quotes) [in_topic]"
read SUB_TOPIC

if [ -z "$SUB_TOPIC" ]
then
	SUB_TOPIC=in_topic
fi


echo -e "What is the ${red}namespace${wipe} of the message type you're subcribing to? [${yellow}geometry_msgs${wipe}::Vector3 ]"
read SUB_NAMESPACE

if [ -z "$SUB_NAMESPACE" ]
then
	SUB_NAMESPACE=geometry_msgs
fi

echo -e "What is the message ${red}type${wipe} you're subcribing to? [geometry_msgs::${yellow}Vector3${wipe}]"
read SUB_TYPE

if [ -z "$SUB_TYPE" ]
then
	SUB_TYPE=Vector3
fi

echo -e "What ${red}topic${wipe} would you like to publish to? (no quotes) [out_topic]"
read PUB_TOPIC

if [ -z "$PUB_TOPIC" ]
then
	PUB_TOPIC=out_topic
fi

echo -e "What is the ${red}namespace${wipe} of the message type you're publishing to? [${yellow}sensor_msgs${wipe}::Imu ]"
read PUB_NAMESPACE

if [ -z "$PUB_NAMESPACE" ]
then
	PUB_NAMESPACE=sensor_msgs
fi

echo -e "What is the message ${red}type${wipe} you're publishing to? [sensor_msgs::${yellow}Imu${wipe}]"
read PUB_TYPE

if [ -z "$PUB_TYPE" ]
then
	PUB_TYPE=Imu
fi

echo -e "What is your ${red}email${wipe}?"
read EMAIL

if [ -z "$EMAIL" ]
then
	EMAIL=todo@todo.com
fi

echo -e "What is your ${red}name${wipe}? [Firstname Lastname]"
read PROGRAMMER

if [ -z "$PROGRAMMER" ]
then
	PROGRAMMER=Firstname Lastname
fi


FILES=(include/CLASS_LC/CLASS_LC.h src/CLASS_LC_node.cpp src/CLASS_LC.cpp package.xml CMakeLists.txt)

echo -en "${red}Modifying Files "
for i in ${FILES[@]}; do
	echo -en "."
	sed -i -e "s/CLASS_LC/${CLASS_LC}/g" ${i}
	sed -i -e "s/CLASS_UC/${CLASS_LC^^}/g" ${i}
	sed -i -e "s/CLASS/${CLASS}/g" ${i}
	sed -i -e "s/PARAM/param/g" ${i}

	sed -i -e "s/SUB_NAMESPACE/${SUB_NAMESPACE}/g" ${i}

	sed -i -e "s/SUB_TOPIC/${SUB_TOPIC}/g" ${i}
	sed -i -e "s/SUB_TYPE/${SUB_TYPE}/g" ${i}

	sed -i -e "s/PUB_NAMESPACE/${PUB_NAMESPACE}/g" ${i}
	sed -i -e "s/PUB_TOPIC/${PUB_TOPIC}/g" ${i}
	sed -i -e "s/PUB_TYPE/${PUB_TYPE}/g" ${i}

	sed -i -e "s/NAMESPACE/${CLASS_LC}/g" ${i}
	sed -i -e "s/EMAIL@gmail.com/${EMAIL}/g" ${i}
	sed -i -e "s/PROGRAMMER/${PROGRAMMER}/g" ${i}
done
echo -en "."
git mv include/CLASS_LC/CLASS_LC.h include/CLASS_LC/${CLASS_LC}.h
git mv include/CLASS_LC include/${CLASS_LC}

git mv src/CLASS_LC.cpp src/${CLASS_LC}.cpp
git mv src/CLASS_LC_node.cpp src/${CLASS_LC}_node.cpp
echo "${wipe}"

cd ../..

echo "Done moving files.  Perform catkin_make? [y/N]"
read BUILD

if [ -z "$BUILD" ]
then
	BUILD=N
fi


if [ $BUILD == 'y' ]; then
	echo "skipping build"
else
	catkin_make
fi

echo "${green}Finished.  Remember to rename the folder and restart the .git directory${wipe}"
