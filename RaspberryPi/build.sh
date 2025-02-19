CURRENT_DIR=`readlink -f .`

echo "CURRENT_DIR = " $CURRENT_DIR

TARGET_DIR=$CURRENT_DIR/bin

rm -rf $TARGET_DIR

mkdir $TARGET_DIR

echo "TARGET_DIR = " $TARGET_DIR

cd src

echo "Building src..."

cc -o $TARGET_DIR/UUGearDaemon UUGearDaemon.c serial.c -lrt -lpthread
cc -o $TARGET_DIR/UUGear.o -c -Wall -Werror -fPIC UUGear.c
cc -shared -o $TARGET_DIR/libUUGear.so $TARGET_DIR/UUGear.o -lrt

cc -o $TARGET_DIR/lsuu lsuu.c serial.c

cp UUGear.py $TARGET_DIR/UUGear.py

echo "Copying shared object file to /usr/lib/..."

sudo cp $TARGET_DIR/libUUGear.so /usr/lib/

echo "Build End"
